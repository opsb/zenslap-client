require 'heroku'
require 'heroku/command'

module Zenslap
  class Command

    ZENSLAP_HEROKU_USER = "admin@zenslap.me"
    ZENSLAP_ADDON = "zenslap2"

    def run(command)
      case command
      when "create" then create
      when "destroy" then destroy
      else raise "#{command} command not found"
      end
    end

    def display(message)
      puts "---> #{message}"
    end

    def display_error(message)
      puts "---! #{message}"
    end

    def display_numbered_bullets(items)
      items.each_with_index do |item, index|
        puts "  #{index}) #{item}"
      end
    end

    def git_repo
      @git_repo ||= GitRepo.new
    end
    
    def heroku
      Heroku::Command.run_internal('auth:client', [])
    end
    
    def test_environment_name(name, owner)
      full_name = "#{name}-zenslap-#{owner}".gsub(/[^a-zA-Z\d-]/, '-')
      return full_name if full_name.length <= 30
      return full_name[0, 27].gsub(/-+$/, "") + "-" + rand(99).to_s
    end

    def create
      begin
        if git_repo.remote_exists? 'zenslap'
          display_error "Zenslap has already been set up"
          return
        end
        
        display "Checking for github details"
        git_repo.github_owner
        git_repo.github_name
        git_repo.github_credentials

        display "Creating test environment in heroku"
        display "Using account: #{heroku.user}"
        heroku_app = test_environment_name(git_repo.github_name, git_repo.github_owner)
        display "Creating test environment: #{heroku_app}"
        heroku.create heroku_app
        heroku.add_collaborator(heroku_app, ZENSLAP_HEROKU_USER)
        git_repo.add_zenslap_remote(heroku_app)

        display "Installing zenslap addon"
        heroku.install_addon heroku_app, ZENSLAP_ADDON
        zenslap_id = heroku.config_vars(heroku_app)["ZENSLAP_ID"]

        display "Configuring zenslap"
        ZenslapClient.configure( zenslap_id, git_repo.github_owner, git_repo.github_name, git_repo.github_credentials, heroku_app )

        display ""
        display "Nearly there, you just need to do add a couple of things on github and you'll be ready to go"
        display_numbered_bullets [
          "Add 'zenslap' as a collaborator",
          "Add 'http://zenslap.me/pushes' to the service hooks"
        ]

      rescue ConsoleError => e
        display_error e
      end
    end

    def destroy
      display "Destroying zenslap project and test environment"
      heroku.destroy git_repo.zenslap_app
      display "Removing zenslap git remote"
      git_repo.remove_zenslap_remote
      display "All done. Thanks for using zenslap."
    rescue ConsoleError => e
      display_error e
    end    
  end
end

# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{zenslap}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["opsb"]
  s.date = %q{2010-11-10}
  s.default_executable = %q{zenslap}
  s.description = %q{Client for zenslap continuous integration}
  s.email = %q{oliver@opsb.co.uk}
  s.executables = ["zenslap"]
  s.files = [
    ".gitignore",
     ".rvmrc",
     "Gemfile",
     "Gemfile.lock",
     "Rakefile",
     "VERSION",
     "autotest/discover.rb",
     "bin/zenslap",
     "lib/zenslap.rb",
     "lib/zenslap/client.rb",
     "lib/zenslap/commands.rb",
     "lib/zenslap/console_error.rb",
     "lib/zenslap/git_repo.rb",
     "spec/client_spec.rb",
     "spec/commands_spec.rb",
     "spec/git_repo_spec.rb",
     "spec/spec_helper.rb",
     "zenslap.gemspec"
  ]
  s.homepage = %q{http://github.com/opsb/zenslap-client}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Client for zenslap continuous integration}
  s.test_files = [
    "spec/client_spec.rb",
     "spec/commands_spec.rb",
     "spec/git_repo_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    else
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    end
  else
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
  end
end


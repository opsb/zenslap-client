# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{zenslap}
  s.version = "0.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["opsb"]
  s.date = %q{2010-11-10}
  s.default_executable = %q{zenslap}
  s.description = %q{Client for zenslap continuous integration}
  s.email = %q{oliver@opsb.co.uk}
  s.executables = ["zenslap"]
  s.files = Dir.glob("{bin}/**/*") + %w(zenslap.gemspec)

  s.homepage = %q{http://github.com/opsb/zenslap-client}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Client for zenslap continuous integration}
  s.test_files = Dir.glob("spec/**/*")  
  s.add_dependency('heroku', ["~> 2.0"])
end


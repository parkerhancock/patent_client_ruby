# Generated by juwelier
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Juwelier::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: patent_client 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "patent_client".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Parker Hancock".freeze]
  s.date = "2019-03-12"
  s.description = "A client for accessing freely-available patent data".freeze
  s.email = "pypatent2018@gmail.com".freeze
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/ptab.rb",
    "test/test_ptab_trial.rb"
  ]
  s.homepage = "http://github.com/parkerhancock/patent_client_ruby".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.0.2".freeze
  s.summary = "a ruby version of python patent client".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<faraday>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<dry-inflector>.freeze, [">= 0"])
      s.add_development_dependency(%q<shoulda>.freeze, [">= 0"])
      s.add_development_dependency(%q<rdoc>.freeze, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.15"])
      s.add_development_dependency(%q<juwelier>.freeze, ["~> 2.1.0"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
    else
      s.add_dependency(%q<faraday>.freeze, [">= 0"])
      s.add_dependency(%q<dry-inflector>.freeze, [">= 0"])
      s.add_dependency(%q<shoulda>.freeze, [">= 0"])
      s.add_dependency(%q<rdoc>.freeze, ["~> 3.12"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.15"])
      s.add_dependency(%q<juwelier>.freeze, ["~> 2.1.0"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<faraday>.freeze, [">= 0"])
    s.add_dependency(%q<dry-inflector>.freeze, [">= 0"])
    s.add_dependency(%q<shoulda>.freeze, [">= 0"])
    s.add_dependency(%q<rdoc>.freeze, ["~> 3.12"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.15"])
    s.add_dependency(%q<juwelier>.freeze, ["~> 2.1.0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
  end
end


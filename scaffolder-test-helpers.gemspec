# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{scaffolder-test-helpers}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michael Barton"]
  s.date = %q{2011-01-04}
  s.description = %q{Helper methods and cucumber steps for testing scaffolder.}
  s.email = %q{mail@michaelbarton.me.uk}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/scaffolder/test/cucumber_steps.rb",
    "lib/scaffolder/test/helpers.rb",
    "scaffolder-test-helpers.gemspec",
    "spec/scaffolder/test/helpers_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/michaelbarton/scaffolder-test-helpers}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Common methods for testing scaffolder.}
  s.test_files = [
    "spec/scaffolder/test/helpers_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<bio>, ["~> 1.4"])
      s.add_runtime_dependency(%q<scaffolder>, ["~> 0.4"])
      s.add_runtime_dependency(%q<cucumber>, ["~> 0.9"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5"])
      s.add_development_dependency(%q<rspec>, ["~> 2.2"])
      s.add_development_dependency(%q<yard>, ["~> 0.6"])
    else
      s.add_dependency(%q<bio>, ["~> 1.4"])
      s.add_dependency(%q<scaffolder>, ["~> 0.4"])
      s.add_dependency(%q<cucumber>, ["~> 0.9"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5"])
      s.add_dependency(%q<rspec>, ["~> 2.2"])
      s.add_dependency(%q<yard>, ["~> 0.6"])
    end
  else
    s.add_dependency(%q<bio>, ["~> 1.4"])
    s.add_dependency(%q<scaffolder>, ["~> 0.4"])
    s.add_dependency(%q<cucumber>, ["~> 0.9"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5"])
    s.add_dependency(%q<rspec>, ["~> 2.2"])
    s.add_dependency(%q<yard>, ["~> 0.6"])
  end
end


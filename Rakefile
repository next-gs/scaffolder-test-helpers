require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "scaffolder-test-helpers"
  gem.homepage = "http://github.com/michaelbarton/scaffolder-test-helpers"
  gem.license = "MIT"
  gem.summary = %Q{Methods and classes for testing scaffolder.}
  gem.description = %Q{Useful Helper methods and classes for testing scaffolder.}
  gem.email = "mail@michaelbarton.me.uk"
  gem.authors = ["Michael Barton"]
end
Jeweler::RubygemsDotOrgTasks.new

require 'yard'
YARD::Rake::YardocTask.new

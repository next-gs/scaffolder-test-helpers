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

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "scaffolder-test-helpers"
  gem.homepage = "http://github.com/michaelbarton/scaffolder-test-helpers"
  gem.license = "MIT"
  gem.summary = %Q{Common methods for testing scaffolder.}
  gem.description = %Q{Helper methods and cucumber steps for testing scaffolder.}
  gem.email = "mail@michaelbarton.me.uk"
  gem.authors = ["Michael Barton"]
end
Jeweler::RubygemsDotOrgTasks.new

require 'yard'
YARD::Rake::YardocTask.new

# encoding: utf-8

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
  gem.name = "iomatic"
  gem.homepage = "http://github.com/foxnewsnetwork/iomatic"
  gem.license = "MIT"
  gem.summary = %Q{Monadic IO context to provide a standardized interface wrapper for pure business logic so that it can interface with the outside world}
  gem.description = %Q{Provides an interface for things like persisting to a database, rendering to views, and whatnot.}
  gem.email = "foxnewsnetwork@gmail.com"
  gem.authors = ["Thomas Chen"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "iomatic #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

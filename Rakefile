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
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = "mvz-ruby-handlebars"
  gem.homepage = "https://github.com/mvz/ruby-handlebars"
  gem.summary = "Pure Ruby library for Handlebars templates "
  gem.email = "matijs@matijs.net"
  gem.authors = ["Vincent Pretre", "Hiptest R&D", "Matijs van Zuijlen"]

  gem.executables = []
  gem.files = `git ls-files -- lib/*`.split("\n")
  gem.require_path = "lib"
end
Jeweler::RubygemsDotOrgTasks.new


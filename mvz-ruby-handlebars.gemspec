# frozen_string_literal: true

require File.join(File.dirname(__FILE__), 'lib/ruby-handlebars/version.rb')

Gem::Specification.new do |s|
  s.name = 'mvz-ruby-handlebars'
  s.version = Handlebars::VERSION

  s.rubygems_version = '>= 1.6.1'
  s.required_ruby_version = '>= 2.4'

  s.authors = ['Vincent Pretre', 'Hiptest R&D', 'Matijs van Zuijlen']
  s.date = '2019-05-13'
  s.email = 'matijs@matijs.net'
  s.extra_rdoc_files = [
    'LICENSE',
    'README.md'
  ]

  s.files = Dir['{lib,spec}/**/*',
                '*.md',
                'Gemfile',
                'Rakefile',
                'LICENSE'] & `git ls-files -z`.split("\0")

  s.homepage = 'https://github.com/mvz/ruby-handlebars'
  s.rubygems_version = '3.0.3'
  s.summary = 'Pure Ruby library for Handlebars templates'

  s.add_runtime_dependency('parslet', ['~> 2.0'])

  s.add_development_dependency('pry', ['~> 0.13.1'])
  s.add_development_dependency('pry-stack_explorer', ['~> 0.4', '>= 0.4.12'])
  s.add_development_dependency('rake', ['~> 13.0'])
  s.add_development_dependency('rspec', ['~> 3.10'])
  s.add_development_dependency('rspec-mocks', ['~> 3.10'])

  s.require_paths = ['lib']
end

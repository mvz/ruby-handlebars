# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = 'mvz-ruby-handlebars'
  s.version = '0.0.6'

  s.rubygems_version = '>= 1.6.1'
  s.required_ruby_version = '>= 2.4'

  s.authors = ['Vincent Pretre', 'Hiptest R&D', 'Matijs van Zuijlen']
  s.date = '2019-05-13'
  s.email = 'matijs@matijs.net'
  s.extra_rdoc_files = [
    'LICENSE',
    'README.md'
  ]
  s.files = [
    'lib/ruby-handlebars.rb',
    'lib/ruby-handlebars/context.rb',
    'lib/ruby-handlebars/helper.rb',
    'lib/ruby-handlebars/parser.rb',
    'lib/ruby-handlebars/template.rb',
    'lib/ruby-handlebars/tree.rb'
  ]

  s.homepage = 'https://github.com/mvz/ruby-handlebars'
  s.rubygems_version = '3.0.3'
  s.summary = 'Pure Ruby library for Handlebars templates'

  s.add_runtime_dependency('parslet', ['~> 1.6', '>= 1.6.2'])

  s.add_development_dependency('pry', ['~> 0.10', '>= 0.10.1'])
  s.add_development_dependency('pry-stack_explorer', ['~> 0.4', '>= 0.4.9.1'])
  s.add_development_dependency('rake', ['~> 12.0'])
  s.add_development_dependency('rspec', ['>= 3.1.0', '~> 3.1'])
  s.add_development_dependency('rspec-mocks', ['~> 3.1', '>= 3.1.3'])

  s.require_paths = ['lib']
end

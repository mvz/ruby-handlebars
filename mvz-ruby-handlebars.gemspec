# frozen_string_literal: true

require_relative "lib/ruby-handlebars/version"

Gem::Specification.new do |spec|
  spec.name = "mvz-ruby-handlebars"
  spec.version = Handlebars::VERSION
  spec.authors = ["Vincent Pretre", "Hiptest R&D", "Matijs van Zuijlen"]
  spec.email = ["matijs@matijs.net"]

  spec.summary = "Pure Ruby library for Handlebars templates"
  spec.homepage = "https://github.com/mvz/ruby-handlebars"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["rubygems_mfa_required"] = "true"

  spec.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]

  spec.files = Dir["{lib,spec}/**/*",
                "*.md",
                "Gemfile",
                "Rakefile",
                "LICENSE"] & `git ls-files -z`.split("\0")

  spec.require_paths = ["lib"]

  spec.add_dependency("parslet", ["~> 2.0"])

  spec.add_development_dependency("pry", "~> 0.14.0")
  spec.add_development_dependency("pry-stack_explorer", ["~> 0.4", ">= 0.4.12"])
  spec.add_development_dependency("rake", ["~> 13.0"])
  spec.add_development_dependency("rspec", ["~> 3.10"])
  spec.add_development_dependency("rspec-mocks", ["~> 3.10"])
  spec.add_development_dependency("rubocop", "~> 1.63")
  spec.add_development_dependency("simplecov")
end

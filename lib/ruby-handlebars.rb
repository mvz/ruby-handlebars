require_relative "ruby-handlebars/version"
require_relative "ruby-handlebars/context"
require_relative "ruby-handlebars/parser"
require_relative "ruby-handlebars/tree"
require_relative "ruby-handlebars/transform"
require_relative "ruby-handlebars/template"
require_relative "ruby-handlebars/helper"
require_relative "ruby-handlebars/helpers/register_default_helpers"
require_relative "ruby-handlebars/escapers/html_escaper"

module Handlebars
  class Handlebars
    attr_reader :escaper

    def initialize
      @as_helpers = {}
      @helpers = {}
      @partials = {}
      @parser = Parser.new
      @transform = Transform.new

      register_default_helpers
      set_escaper
    end

    def compile(template)
      Template.new(self, template_to_ast(template))
    end

    def register_helper(name, &fn)
      @helpers[name.to_s] = Helper.new(self, fn)
    end

    def register_as_helper(name, &fn)
      @as_helpers[name.to_s] = Helper.new(self, fn)
    end

    def get_helper(name)
      @helpers[name.to_s]
    end

    def get_as_helper(name)
      @as_helpers[name.to_s]
    end

    def register_partial(name, content)
      @partials[name.to_s] = Template.new(self, template_to_ast(content))
    end

    def get_partial(name)
      @partials[name.to_s]
    end

    def set_escaper(escaper = nil)
      @escaper = escaper || Escapers::HTMLEscaper
    end

    private

    attr_reader :parser, :transform

    def template_to_ast(content)
      transform.apply(parser.parse(content))
    end

    def register_default_helpers
      Helpers.register_default_helpers(self)
    end
  end
end

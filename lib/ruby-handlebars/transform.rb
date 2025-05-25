require "parslet"
require_relative "tree"

module Handlebars
  class Transform < Parslet::Transform
    rule(template_content: simple(:content)) { Tree::TemplateContent.new(content) }
    rule(replaced_unsafe_item: simple(:item)) { Tree::EscapedReplacement.new(item) }
    rule(replaced_safe_item: simple(:item)) { Tree::Replacement.new(item) }
    rule(str_content: simple(:content)) { Tree::String.new(content) }
    rule(parameter_name: simple(:name)) { Tree::Parameter.new(name) }

    rule(
      unsafe_helper_name: simple(:name),
      parameters: subtree(:parameters)
    ) do
      Tree::EscapedHelper.new(name, parameters)
    end

    rule(
      safe_helper_name: simple(:name),
      parameters: subtree(:parameters)
    ) do
      Tree::Helper.new(name, parameters)
    end

    rule(
      helper_name: simple(:name),
      block_items: subtree(:block_items)
    ) do
      Tree::Helper.new(name, [], block_items)
    end

    rule(
      helper_name: simple(:name),
      block_items: subtree(:block_items),
      else_block_items: subtree(:else_block_items)
    ) do
      Tree::Helper.new(name, [], block_items, else_block_items)
    end

    rule(
      helper_name: simple(:name),
      parameters: subtree(:parameters),
      block_items: subtree(:block_items)
    ) do
      Tree::Helper.new(name, parameters, block_items)
    end

    rule(
      helper_name: simple(:name),
      parameters: subtree(:parameters),
      block_items: subtree(:block_items),
      else_block_items: subtree(:else_block_items)
    ) do
      Tree::Helper.new(name, parameters, block_items, else_block_items)
    end

    rule(
      helper_name: simple(:name),
      parameters: subtree(:parameters),
      as_parameters: subtree(:as_parameters),
      block_items: subtree(:block_items)
    ) do
      Tree::AsHelper.new(name, parameters, as_parameters, block_items)
    end

    rule(
      helper_name: simple(:name),
      parameters: subtree(:parameters),
      as_parameters: subtree(:as_parameters),
      block_items: subtree(:block_items),
      else_block_items: subtree(:else_block_items)
    ) do
      Tree::AsHelper.new(name, parameters, as_parameters, block_items, else_block_items)
    end

    rule(
      partial_name: simple(:partial_name),
      arguments: subtree(:arguments)
    ) do
      Tree::PartialWithArgs.new(partial_name, arguments)
    end

    rule(partial_name: simple(:partial_name)) { Tree::Partial.new(partial_name) }
    rule(block_items: subtree(:block_items)) { Tree::Block.new(block_items) }
    rule(else_block_items: subtree(:else_block_items)) { Tree::Block.new(block_items) }
  end
end

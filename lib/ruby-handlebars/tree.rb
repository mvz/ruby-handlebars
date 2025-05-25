require "parslet"

module Handlebars
  module Tree
    class TreeItem < Struct
      def eval(context)
        _eval(context)
      end
    end

    class TemplateContent < TreeItem.new(:content)
      def _eval(context)
        return content
      end
    end

    class Replacement < TreeItem.new(:item)
      def _eval(context)
        helper = context.get_helper(item.to_s)
        if call_with_one_argument_possible?(helper)
          helper.apply(context)
        else
          context.get(item.to_s)
        end
      end

      private

      def call_with_one_argument_possible?(helper)
        [1, -2].include? helper&.arity
      end
    end

    class EscapedReplacement < Replacement
      def _eval(context)
        context.escaper.escape(super.to_s)
      end
    end

    class String < TreeItem.new(:content)
      def _eval(context)
        return content
      end
    end

    class Parameter < TreeItem.new(:name)
      def _eval(context)
        if name.is_a?(Parslet::Slice)
          context.get(name.to_s)
        else
          name._eval(context)
        end
      end
    end

    class Helper < TreeItem.new(:name, :parameters, :block, :else_block)
      def _eval(context)
        helper = context.get_helper(name.to_s)
        if helper.nil?
          context.get_helper("helperMissing").apply(context, String.new(name.to_s))
        else
          helper.apply(context, parameters, block, else_block)
        end
      end
    end

    class AsHelper < TreeItem.new(:name, :parameters, :as_parameters, :block, :else_block)
      def _eval(context)
        helper = context.get_as_helper(name.to_s)
        if helper.nil?
          context.get_helper("helperMissing").apply(context, String.new(name.to_s))
        else
          helper.apply_as(context, parameters, as_parameters, block, else_block)
        end
      end
    end

    class EscapedHelper < Helper
      def _eval(context)
        context.escaper.escape(super.to_s)
      end
    end

    class Partial < TreeItem.new(:partial_name)
      def _eval(context)
        context.get_partial(partial_name.to_s).call_with_context(context)
      end
    end

    class PartialWithArgs < TreeItem.new(:partial_name, :arguments)
      def _eval(context)
        [arguments].flatten.map(&:values).map do |vals| 
          context.add_item vals.first.to_s, vals.last._eval(context)
        end
        context.get_partial(partial_name.to_s).call_with_context(context)
      end
    end

    class Block < TreeItem.new(:items)
      def _eval(context)
        items.map {|item| item._eval(context)}.join()
      end
      alias :fn :_eval

      def add_item(i)
        items << i
      end

    end
  end
end

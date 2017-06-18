require_relative 'function_with_arity'

module Ramda
  module Internal
    # Curried Method
    module CurriedMethod
      def curried_method(name, &block)
        define_singleton_method(name) do |*args|
          curried = block.curry
          # curried.define_singleton_method(:origin_arity) { block.arity }

          return curried if args.empty?

          curried.call(*args)
        end
      end
    end
  end
end

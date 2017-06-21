require_relative 'function_with_arity'

module Ramda
  module Internal
    # Curried Method
    module CurriedMethod
      def curried_method(name, &block)
        define_singleton_method(name, &curried_method_body(block.arity, &block))
      end

      def curried_method_body(arity, &block)
        Ramda::Internal::FunctionWithArity.new.call(arity) do |*args|
          if args.include?(Ramda.__)
            replace_placeholder(args, &block).curry
          else
            args.empty? ? block : yield(*args)
          end
        end.curry
      end

      def replace_placeholder(basic_args)
        Ramda::Internal::FunctionWithArity.new.call(basic_args.count(Ramda.__)) do |*new_args|
          cloned_args = basic_args.dup
          new_args.each { |arg| cloned_args[cloned_args.index(Ramda.__)] = arg }
          yield(*cloned_args)
        end
      end

      def curried_method_v2(name, &block)
        fn = Ramda::Internal::FunctionWithArity.new.call(block.arity) do |*args|
          if args.empty?
            block
          else
            yield(*args)
          end
        end

        define_singleton_method(name, &fn.curry)
      end

      def curried_method_v1(name, &block)
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

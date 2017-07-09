require_relative 'function_with_arity'

module Ramda
  module Internal
    # Curried Method
    module CurriedMethod
      def curried(name, &block)
        define_method(name, &curried_method_body(name, block.arity, &block))
      end

      alias curried_method curried

      # rubocop:disable Metrics/MethodLength
      def curried_method_body(name, arity, &block)
        Ramda::Internal::FunctionWithArity.call(arity) do |*args|
          begin
            if args.index(Ramda.__)
              replace_placeholder(args, &block).curry
            else
              result = args.empty? ? block : yield(*args)
              debug_log(name, args, result) if ::Ramda::DEBUG_MODE
              result
            end
          rescue StandardError => e
            ::Ramda.exception_handler.call(e, name)
          end
        end.curry
      end
      # rubocop:enable Metrics/MethodLength

      def replace_placeholder(basic_args)
        Ramda::Internal::FunctionWithArity.call(basic_args.count(Ramda.__)) do |*new_args|
          cloned_args = basic_args.dup
          new_args.each { |arg| cloned_args[cloned_args.index(Ramda.__)] = arg }
          result = yield(*cloned_args)
          debug_log(name, cloned_args, result) if ::Ramda::DEBUG_MODE
          result
        end
      end

      def debug_log(name, args, result)
        puts "-> #{name}(#{args.join(', ')}) # #{result}"
      end
    end
  end
end

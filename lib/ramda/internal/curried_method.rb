require_relative 'function_with_arity'

module Ramda
  module Internal
    # Curried Method
    module CurriedMethod
      def curried_method(name, &block)
        define_singleton_method(name, &curried_method_body(name, block.arity, &block))
      end

      # rubocop:disable Metrics/MethodLength
      def curried_method_body(name, arity, &block)
        Ramda::Internal::FunctionWithArity.new.call(arity) do |*args|
          begin
            if args.include?(Ramda.__)
              replace_placeholder(args, &block).curry
            else
              args.empty? ? block : yield(*args)
            end
          rescue StandardError => e
            raise e, [name, e.exception].join(' -> '), e.backtrace
          end
        end.curry
      end
      # rubocop:enable Metrics/MethodLength

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

      if RUBY_PLATFORM == 'java'
        # This hack resolved issue:
        #   undefined method `__make_curry_proc__' for Ramda::Math:Module
        #
        # Source:
        #   https://github.com/jruby/jruby/issues/1523
        #
        # rubocop:disable Metrics/MethodLength
        def __make_curry_proc__(proc, passed, arity)
          is_lambda = proc.lambda?
          passed.freeze

          __send__((is_lambda ? :lambda : :proc)) do |*argv, &passed_proc|
            my_passed = passed + argv
            # original
            # if my_passed.length < arity
            # changed
            if my_passed.length < arity.abs - 1
              warn "#{caller[0]}: given block not used" unless passed_proc.nil?
              __make_curry_proc__(proc, my_passed, arity)
            else
              proc.call(*my_passed)
            end
          end
        end
        # rubocop:enable Metrics/MethodLength
      end
    end
  end
end

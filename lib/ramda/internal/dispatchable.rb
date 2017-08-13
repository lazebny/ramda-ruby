module Ramda
  module Internal
    # Dispatchable
    # rubocop:disable Performance/CaseWhenSplat
    # rubocop:disable Metrics/MethodLength
    module Dispatchable
      #   Returns a function that dispatches with different strategies based on the
      #   object in list position (last argument). If it is an array, executes [fn].
      #   Otherwise, if it has a  function with [methodname], it will execute that
      #   function (functor case). Otherwise, if it is a transformer, uses transducer
      #   [xf] to return a new transformer (transducer case). Otherwise, it will
      #   default to executing [fn].
      #
      #   @private
      #   - @param {Array[Symbol]|Symbol} method_names property to check for a custom implementation
      #   - @param {Array[Class]|Class} described_types a list of type with default behaviour
      #   - @param {Function} xf transducer to initialize if object is transformer
      #   - @param {Function} fn default ramda implementation
      #   - @return {Function} A function that dispatches on object in list position
      #
      # Works with fn(arity>1)
      def dispatchable(method_names, described_types, xf = nil, &fn)
        method_names = Array(method_names)

        FunctionWithArity.call(fn.arity) do |*args, xs|
          case xs
          when *described_types # default behaviour
            yield(*args, xs)

          when Proc # transducer behaviour
            xf.call(*args, xs)

          else # method dispatch behaviour
            method_name = method_names.find { |name| xs.respond_to?(name) }

            if method_name
              xs.public_send(method_name, *args)
            else
              dispatchable_error(xs, method_name)
            end
          end
        end
      end

      # Works with fn(arity=1)
      def dispatchable1(method_names, described_types, xf = nil, &fn)
        method_names = Array(method_names)

        FunctionWithArity.call(fn.arity) do |xs|
          case xs
          when *described_types # default behaviour
            yield(xs)

          when Proc # transducer behaviour
            xf.call(xs)

          else # method dispatch behaviour
            method_name = method_names.find { |name| xs.respond_to?(name) }

            if method_name
              xs.public_send(method_name)
            else
              dispatchable_error(xs, method_name)
            end
          end
        end
      end

      def dispatchable_error(xs, method_name)
        raise ArgumentError, "Unexpected type #{xs.class} in method: #{method_name}"
      end
    end
  end
end

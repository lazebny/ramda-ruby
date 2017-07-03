module Ramda
  module Internal
    # Dispatchable
    module Dispatchable
      #
      #   Returns a function that dispatches with different strategies based on the
      #   object in list position (last argument). If it is an array, executes [fn].
      #   Otherwise, if it has a  function with [methodname], it will execute that
      #   function (functor case). Otherwise, if it is a transformer, uses transducer
      #   [xf] to return a new transformer (transducer case). Otherwise, it will
      #   default to executing [fn].
      #
      #   @private
      #   - @param {String} methodname property to check for a custom implementation
      #   - @param {Function} xf transducer to initialize if object is transformer
      #   - @param {Function} fn default ramda implementation
      #   - @return {Function} A function that dispatches on object in list position
      #
      def self.call(method_names, _xf, *args, xs)
        method_name = method_names.find { |name| xs.respond_to?(name) }

        return xs.public_send(method_name, *args) if method_name

        raise ArgumentError, "Unexpected type #{xs.class} in method: #{method_name}"
      end
    end
  end
end

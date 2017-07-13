module Ramda
  module Internal
    # Defines a class which responds to method and can be used in case construction
    # for equality check.
    module ClassWhichRespondTo
      def class_which_responds_to(*method_names)
        Class.new do
          @method_names = method_names

          def self.===(other)
            @method_names.find(&other.method(:respond_to?))
          end
        end
      end
    end
  end
end

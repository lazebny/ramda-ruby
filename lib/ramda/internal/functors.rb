module Ramda
  module Internals
    module Functors
      # `const` is a functor that effectively ignores the function given to `map`.
      class Const
        attr_reader :value

        def self.of(x)
          new(x)
        end

        def map(*)
          Const.of(@value)
        end

        private

        def initialize(value)
          @value = value
        end
      end

      # `Identity` is a functor that holds a single value, where `map` simply
      # transforms the held value with the provided function.
      class Identity
        attr_reader :value

        def self.of(x)
          new(x)
        end

        def map(f)
          Identity.of(f.call(@value))
        end

        private

        def initialize(value)
          @value = value
        end
      end
    end
  end
end

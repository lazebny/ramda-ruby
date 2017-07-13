module Ramda
  module Internal
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

      # The `Maybe` type represents the possibility of some value or nothing.
      class Maybe
        def self.of(x)
          Some.new(x)
        end

        # Some value
        class Some
          attr_reader :value

          def initialize(value)
            @value = value
          end

          def ==(other)
            instance_of?(other.class) && value == other.value
          end

          def ap(m)
            m.map(@value)
          end

          def chain(f)
            f.call(@value)
          end

          def map(f)
            Maybe.of(f.call(@value))
          end

          def none?
            false
          end

          def some?
            true
          end
        end

        # None value
        class None
          attr_reader :value

          def initialize(*); end

          def ==(other)
            instance_of?(other.class)
          end

          def ap(_m)
            self
          end

          def chain(_f)
            self
          end

          def map(_f)
            self
          end

          def none?
            true
          end

          def some?
            false
          end
        end
      end
    end
  end
end

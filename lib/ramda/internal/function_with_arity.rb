module Ramda
  module Internal
    # Curried Method
    class FunctionWithArity
      # rubocop:disable Metrics/CyclomaticComplexity
      # rubocop:disable Metrics/MethodLength
      # rubocop:disable Metrics/ParameterLists
      def call(arity)
        case arity
        when 0
          ->(*a) { yield(*a) }
        when 1
          ->(a, *b) { yield(a, *b) }
        when 2
          ->(a, b, *c) { yield(a, b, *c) }
        when 3
          ->(a, b, c, *d) { yield(a, b, c, *d) }
        when 4
          ->(a, b, c, d, *e) { yield(a, b, c, d, *e) }
        when 5
          ->(a, b, c, d, e, *f) { yield(a, b, c, d, e, *f) }
        when 6
          ->(a, b, c, d, e, f, *g) { yield(a, b, c, d, e, f, *g) }
        else
          raise ArgumentError, "Arrity #{arity} is not supported"
        end
      end
    end
  end
end

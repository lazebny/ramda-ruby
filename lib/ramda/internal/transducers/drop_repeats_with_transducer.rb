module Ramda
  module Internal
    module Transducers
      # Remove repeats with based on predicate which receives a, b
      class DropRepeatsWithTransducer
        # predicate - fn with 2 arity
        def call(predicate, reducer)
          lambda do |acc, x|
            if acc.any? && predicate.call(acc.last, x)
              acc
            else
              reducer.call(acc, x)
            end
          end
        end
      end
    end
  end
end

module Ramda
  module Internal
    module Transducers
      # Filter list based on predicate which receives x
      class FilterTransducer
        # predicate - fn with 1 arity
        def call(predicate, reducer)
          lambda do |acc, x|
            if predicate.call(x)
              reducer.call(acc, x)
            else
              acc
            end
          end
        end
      end
    end
  end
end

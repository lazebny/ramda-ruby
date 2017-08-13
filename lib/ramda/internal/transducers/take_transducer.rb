module Ramda
  module Internal
    module Transducers
      # Returns a head of collection
      class TakeTransducer
        # limit - number
        def call(limit, reducer)
          count = 0
          lambda do |acc, x|
            count += 1
            if limit >= count
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

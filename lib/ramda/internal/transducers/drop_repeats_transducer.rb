module Ramda
  module Internal
    module Transducers
      # Removes repeats from list
      class DropRepeatsTransducer
        # No arguments
        def call(reducer)
          lambda do |acc, x|
            if acc.any? && acc.last == x
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

module Ramda
  module Internal
    module Transducers
      # Transform collection based on transformer
      class MapTransducer
        # transformer - fn with 1 arity
        def call(transformer, reducer)
          lambda do |acc, x|
            reducer.call(acc, transformer.call(x))
          end
        end
      end
    end
  end
end

module Ramda
  module Internal
    # Transducers
    #
    # Signature: (*, reducing_fn) -> Proc((acc, input) -> acc)
    #
    module Transducers
      # predicate - fn with 1 arity
      def self.filter(predicate, reducer)
        lambda do |acc, x|
          if predicate.call(x)
            reducer.call(acc, x)
          else
            acc
          end
        end
      end

      # transformer - fn with 1 arity
      def self.map(transformer, reducer)
        lambda do |acc, x|
          reducer.call(acc, transformer.call(x))
        end
      end

      # limit - number
      def self.take(limit, reducer)
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

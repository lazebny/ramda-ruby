module Ramda
  # Mixins
  module Mixins
    def curried_method(name, &block)
      define_singleton_method(name) do |*args|
        curried = block.curry

        return curried if args.empty?

        curried.call(*args)
      end
    end
  end
end

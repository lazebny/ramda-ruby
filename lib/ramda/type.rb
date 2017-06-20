require_relative 'internal/curried_method'

module Ramda
  # Type functions
  module Type
    extend ::Ramda::Internal::CurriedMethod

    # See if an object (val) is an instance of the supplied constructor.
    # This function will check up the inheritance chain, if any.
    #
    # (* -> {*}) -> a -> Boolean
    #
    curried_method(:is) do |type, x|
      x.is_a?(type)
    end

    # Checks if the input value is nil.
    #
    # * -> Boolean
    #
    curried_method(:is_nil, &:nil?)
  end
end

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

    # Type -> String -> Object -> Boolean
    #
    # Returns true if the specified object property is of the given type;
    # false otherwise.
    #
    curried(:prop_is) do |type, key, obj|
      obj[key].is_a?(type)
    end

    # Gives a class of the (native) type of a value.
    #
    # (* -> {*}) -> String
    #
    curried_method(:type, &:class)
  end
end

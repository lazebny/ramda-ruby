require_relative 'internal/curried_method'

module Ramda
  # Math functions
  module Math
    extend ::Ramda::Internal::CurriedMethod

    # Add two values.
    #
    # Number -> Number -> Number
    #
    curried_method(:add) do |a, b|
      a + b
    end

    # Divides two numbers. Equivalent to a / b.
    #
    # Number -> Number -> Number
    #
    curried_method(:divide) do |a, b|
      a.to_f / b
    end

    # Multiplies two numbers. Equivalent to a * b but curried.
    #
    # Number -> Number -> Number
    #
    curried_method(:multiply) do |a, b|
      a * b
    end

    # Multiplies together all the elements of a list.
    #
    # [Number] -> Number
    #
    curried_method(:product) do |xs|
      xs.reduce(:*)
    end
  end
end

require_relative 'internal/curried_method'

module Ramda
  # String functions
  module String
    extend ::Ramda::Internal::CurriedMethod

    # The upper case version of a string.
    #
    # String -> String
    #
    curried_method(:to_upper, &:upcase)

    # The lower case version of a string.
    #
    # String -> String
    #
    curried_method(:to_lower, &:downcase)
  end
end

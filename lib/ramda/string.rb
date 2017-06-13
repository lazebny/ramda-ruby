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

    # Tests a regular expression against a String. Note that this function will
    # return an empty array when there are no matches. This differs from
    # String.prototype.match which returns null when there are no matches.
    #
    # RegExp -> String -> [String | NilClass]
    #
    curried_method(:match) do |exp, x|
      case x
      when ::String
        x[exp]
        # x.scan(exp).flatten
      else
        type_error(x)
      end
    end

    # TODO: Extract from this module
    def self.type_error(object)
      raise ArgumentError, "Unexpected type #{object.class}"
    end
  end
end

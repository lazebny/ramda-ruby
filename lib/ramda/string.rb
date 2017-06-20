require_relative 'internal/curried_method'

module Ramda
  # String functions
  module String
    extend ::Ramda::Internal::CurriedMethod

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

    # Replace a substring or regex match in a string with a replacement.
    #
    # RegExp|String -> String -> String -> Boolean -> String
    #
    curried_method(:replace) do |from, to, x|
      x.gsub(from, to)
    end

    # Splits a string into an array of strings based on the given separator.
    #
    # (String | RegExp) -> String -> [String]
    #
    curried_method(:split) do |sep, x|
      x.split(sep)
    end

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

    # TODO: Extract from this module
    def self.type_error(object)
      raise ArgumentError, "Unexpected type #{object.class}"
    end
  end
end

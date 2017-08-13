require_relative 'internal/curried_method'
require_relative 'internal/dispatchable'

module Ramda
  # String functions
  module String
    extend ::Ramda::Internal::CurriedMethod
    extend ::Ramda::Internal::Dispatchable

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

    # Determines whether a given string matches a given regular expression.
    #
    # RegExp -> String -> Boolean
    #
    curried_method(:test) do |rx, str|
      !str.match(rx).nil?
    end

    # The lower case version of a string.
    #
    # String -> String
    #
    curried_method(:to_lower, &:downcase)

    # Returns the string representation of the given value.
    # eval'ing the output should result in a value equivalent to the input value.
    # Many of the built-in to_string methods do not satisfy this requirement.
    #
    # * -> String
    #
    curried_method(:to_string, &dispatchable([:inspect], []) do |x|
      # case x
      # when Array
      # when TrueClass, FalseClass
      # when DateTime
      # when NilClass
      # when Number
      # when String
      # end
    end)

    # The upper case version of a string.
    #
    # String -> String
    #
    curried_method(:to_upper, &:upcase)

    # Removes (strips) whitespace from both ends of the string.
    #
    # String -> String
    #
    curried_method(:trim, &:strip)

    # TODO: Extract from this module
    def self.type_error(object)
      raise ArgumentError, "Unexpected type #{object.class}"
    end
  end
end

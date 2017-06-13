require_relative 'internal/curried_method'

module Ramda
  # Math functions
  module Object
    extend ::Ramda::Internal::CurriedMethod

    # Creates a deep copy of the value which may contain (nested)
    # Arrays and Objects, Numbers, Strings, Booleans and Dates.
    # Functions are assigned by reference rather than copied
    #
    # {*} -> {*}
    #
    curried_method(:clone) do |object|
      case object
      when Array
        object.dup.map(&method(:clone))
      else
        object.dup
      end
    end

    # Reports whether two objects have the same value, in R.equals terms,
    # for the specified property. Useful as a curried predicate.
    #
    # k -> {k: v} -> {k: v} -> Boolean
    #
    curried_method(:eq_props) do |prop, a, b|
      a[prop] == b[prop]
    end

    # Returns a list containing the names of all the enumerable own properties
    # of the supplied object.
    # Note that the order of the output array is not guaranteed.
    #
    # {k: v} -> [k]
    #
    curried_method(:keys, &:keys)
  end
end

require_relative 'internal/curried_method'

module Ramda
  # Relation functions
  module Relation
    extend ::Ramda::Internal::CurriedMethod

    # Returns true if its arguments are equivalent, false otherwise.
    # Handles cyclical data structures.
    #
    # a -> b -> Boolean
    #
    curried_method(:equals) do |a, b|
      a == b
    end

    # Counts the elements of a list according to how many match each value
    # of a key generated by the supplied function. Returns an object mapping
    # the keys produced by fn to the number of occurrences in the list.

    # Acts as a transducer if a transformer is given in list position.
    #
    # (a -> String) -> [a] -> {*}
    #
    curried_method(:count_by) do |fn, list|
      list
        .group_by(&fn)
        .each_with_object({}) { |(key, value), acc| acc[key] = value.count }
    end

    # Finds the set (i.e. no duplicates) of all elements in the first list not
    # contained in the second list. Objects and Arrays are compared in terms
    # of value equality, not reference equality.
    #
    # [*] -> [*] -> [*]
    #
    curried_method(:difference) do |list_a, list_b|
      list_a - list_b
    end

    # Finds the set (i.e. no duplicates) of all elements in the first list not
    # contained in the second list. Duplication is determined according to the
    # value returned by applying the supplied predicate to two list elements.
    #
    # ((a, a) -> Boolean) -> [a] -> [a] -> [a]
    #
    # TODO: optimize
    curried_method(:difference_with) do |fn, list_a, list_b|
      list_a.reject do |el_a|
        list_b.find { |el_b| fn.call(el_a, el_b) }
      end
    end

    # Returns true if the first argument is greater than the second; false otherwise.
    #
    # Ord a => a -> a -> Boolean
    #
    curried_method(:gt) do |a, b|
      a > b
    end

    # Returns true if the first argument is greater than or equal to the second;
    # false otherwise.
    #
    # Ord a => a -> a -> Boolean
    #
    curried_method(:gte) do |a, b|
      a >= b
    end

    # Combines two lists into a set (i.e. no duplicates) composed of those elements
    # common to both lists. The order is preserved from the original array.
    #
    # [*] -> [*] -> [*]
    #
    curried_method(:intersection) do |list_a, list_b|
      list_a & list_b
    end

    # Returns true if the first argument is less than the second; false otherwise.
    #
    # a -> a -> Boolean
    #
    curried_method(:lt) do |a, b|
      a < b
    end

    # Returns true if the first argument is less than or equal to the second;
    # false otherwise.
    #
    # a -> a -> Boolean
    #
    curried_method(:lte) do |a, b|
      a <= b
    end

    # Returns the larger of its two arguments.
    #
    # Ord a => a -> a -> a
    #
    curried_method(:max) do |a, b|
      [a, b].max
    end

    # Returns the smaller of its two arguments.
    #
    # Ord a => a -> a -> a
    #
    curried_method(:min) do |a, b|
      [a, b].min
    end

    curried_method(:prop_eq) do |prop, value, obj|
      obj[prop] == value
    end
  end
end

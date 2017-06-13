require_relative 'internal/curried_method'

module Ramda
  # List functions
  module List
    extend ::Ramda::Internal::CurriedMethod

    # Returns true if all elements of the list match the predicate,
    # false if there are any that don't.
    # Dispatches to the all method of the second argument, if present.
    # Acts as a transducer if a transformer is given in list position.
    #
    # (a -> Boolean) -> [a] -> Boolean
    #
    curried_method(:all) do |f, xs|
      xs.all?(&f)
    end

    # Returns true if at least one of elements of the list match the predicate,
    # false otherwise.
    # Dispatches to the any method of the second argument, if present.
    # Acts as a transducer if a transformer is given in list position.
    #
    # (a -> Boolean) -> [a] -> Boolean
    #
    curried_method(:any) do |f, xs|
      xs.any?(&f)
    end

    # Returns a new list containing the contents of the given list,
    # followed by the given element.
    #
    # a -> [a] -> [a]
    #
    curried_method(:append) do |x, xs|
      xs.dup + [x]
    end

    # Returns the result of concatenating the given lists or strings.
    # String -> String -> String
    #
    # List -> List -> List
    #
    curried_method(:concat) do |list_a, list_b|
      case list_a
      when ::String, ::Symbol
        [list_a, list_b].join('')
      when ::Array
        list_a.dup + list_b
      else
        type_error(list_a)
      end
    end

    # Returns true if the specified value is equal, in R.equals terms,
    # to at least one element of the given list; false otherwise.
    #
    # a -> [a] -> Boolean
    #
    curried_method(:contains) do |x, xs|
      xs.include?(x)
    end

    # Returns all but the first n elements of the given list, string,
    # or transducer/transformer (or object with a drop method).
    #
    # Number -> [a] -> [a]
    # Number -> String -> String
    #
    curried_method(:drop) do |num, xs|
      case xs
      when ::String
        xs[num..-1] || ''
      when ::Array
        xs[num..-1] || []
      else
        type_error(xs)
      end
    end

    # Takes a predicate and a Filterable, and returns a new filterable of the same
    # type containing the members of the given filterable which satisfy the given
    # predicate. Filterable objects include plain objects or any object that
    # has a filter method such as Array.
    # Dispatches to the filter method of the second argument, if present.
    #
    # Filterable f => (a -> Boolean) -> f a -> f a
    #
    curried_method(:filter) do |f, xs|
      case xs
      when ::Hash
        xs.select { |_, value| f.call(value) }
      else
        xs.select(&f)
      end
    end

    # Returns the first element of the list which matches the predicate,
    # or undefined if no element matches.
    #
    # (a -> Boolean) -> [a] -> a | nil
    #
    curried_method(:find) do |f, xs|
      xs.find(&f)
    end

    # Returns a new list by pulling every item out of it (and all its sub-arrays)
    # and putting them in a new array, depth-first.
    #
    # [a] -> [b]
    #
    curried_method(:flatten, &:flatten)

    # Splits a list into sub-lists stored in an object, based on the result of
    # calling a String-returning function on each element, and grouping the
    # results according to values returned.
    #
    # (a -> String) -> [a] -> {String: [a]}
    #
    curried_method(:group_by) do |f, xs|
      xs.group_by(&f)
    end

    # Returns the first element of the given list or string. In some libraries
    # this function is named first.
    #
    # [a] -> a | nil
    # String -> String
    #
    curried_method(:head) do |x|
      case x
      when ::String
        x[0] || ''
      else
        x[0]
      end
    end

    # Returns the position of the first occurrence of an item in an array,
    # or -1 if the item is not included in the array.
    #
    # a -> [a] -> Number
    #
    curried_method(:index_of) do |x, xs|
      xs.index(x) || -1
    end

    # Returns a string made by inserting the separator between each element and
    # concatenating all the elements into a single string.
    #
    # String -> [a] -> String
    #
    curried_method(:join) do |separator, xs|
      xs.join(separator)
    end

    # Returns the position of the last occurrence of an item in an array,
    # or -1 if the item is not included in the array.
    #
    # a -> [a] -> Number
    #
    curried_method(:last_index_of) do |x, xs|
      xs.rindex(x) || -1
    end

    # Returns a copy of the list, sorted according to the comparator function,
    # which should accept two values at a time and return a negative number
    # if the first value is smaller, a positive number if it's larger, and
    # zero if they are equal. Please note that this is a copy of the list.
    # It does not modify the original.

    curried_method(:sort) do |comparator, xs|
      xs.sort(&comparator)
    end

    # TODO: Extract from this module
    def type_error(object)
      raise ArgumentError, "Unexpected type #{object.class}"
    end
  end
end

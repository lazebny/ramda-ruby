require_relative 'mixins'

module Ramda
  # List functions
  module List
    extend Ramda::Mixins

    # Returns true if all elements of the list match the predicate,
    # false if there are any that don't.
    # Dispatches to the all method of the second argument, if present.
    # Acts as a transducer if a transformer is given in list position.
    #
    # (a -> Boolean) -> [a] -> Boolean
    #
    curried_method(:all) do |fn, list|
      list.all?(&fn)
    end

    # Returns true if at least one of elements of the list match the predicate,
    # false otherwise.
    # Dispatches to the any method of the second argument, if present.
    # Acts as a transducer if a transformer is given in list position.
    #
    # (a -> Boolean) -> [a] -> Boolean
    #
    curried_method(:any) do |fn, list|
      list.any?(&fn)
    end

    # Returns a new list containing the contents of the given list,
    # followed by the given element.
    #
    # a -> [a] -> [a]
    #
    curried_method(:append) do |el, list|
      list.dup + [el]
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
    curried_method(:contains) do |el, list|
      list.include?(el)
    end

    # Returns all but the first n elements of the given list, string,
    # or transducer/transformer (or object with a drop method).
    #
    # Number -> [a] -> [a]
    # Number -> String -> String
    #
    curried_method(:drop) do |num, list|
      case list
      when ::String
        list[num..-1] || ''
      when ::Array
        list[num..-1] || []
      else
        type_error(list)
      end
    end

    # TODO: Extract from this module
    def type_error(object)
      raise ArgumentError, "Unexpected type #{object.class}"
    end
  end
end

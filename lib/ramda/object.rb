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

    # Create a new object with the own properties of the first object merged
    # with the own properties of the second object. If a key exists in both
    # objects, the value from the second object will be used.
    #
    # {k: v} -> {k: v} -> {k: v}
    #
    curried_method(:merge) do |obj_a, obj_b|
      obj_a.merge(obj_b)
    end

    # Returns a partial copy of an object omitting the keys specified.
    #
    # [String] -> {String: *} -> {String: *}
    #
    curried_method(:omit) do |keys, obj|
      obj_copy = obj.dup
      keys.each(&obj_copy.method(:delete))
      obj_copy
    end

    # Returns a partial copy of an object containing only the keys specified.
    # If the key does not exist, the property is ignored.
    #
    # [k] -> {k: v} -> {k: v}
    #
    curried_method(:pick) do |keys, obj|
      obj.select { |k, _| keys.include?(k) }
    end

    # Similar to pick except that this one includes a key: undefined pair for
    # properties that don't exist.
    #
    # [k] -> {k: v} -> {k: v}
    #
    curried_method(:pick_all) do |keys, obj|
      Hash[keys.map { |k| [k, obj.key?(k) ? obj.fetch(k) : nil] }]
    end

    # Reasonable analog to SQL select statement.
    #
    # [k] -> [{k: v}] -> [{k: v}]
    #
    curried_method(:project) do |keys, objs|
      objs.map(&pick_all(keys))
    end

    # Returns a function that when supplied an object returns the indicated
    # property of that object, if it exists.
    #
    # s -> {s: a} -> a | NilClass
    #
    curried_method(:prop) do |key, obj|
      obj[key]
    end

    # Acts as multiple prop: array of keys in, array of values out.
    # Preserves order.
    #
    # [k] -> {k: v} -> [v]
    #
    curried_method(:props) do |keys, obj|
      keys.map(&obj.method(:[]))
    end

    # Returns a list of all the enumerable own properties of the supplied object.
    #
    # {k: v} -> [v]
    #
    curried_method(:values, &:values)
  end
end

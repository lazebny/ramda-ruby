require_relative 'internal/curried_method'

module Ramda
  # Math functions
  module Object
    extend ::Ramda::Internal::CurriedMethod

    # Makes a shallow clone of an object, setting or overriding the specified
    # property with the given value. Note that this copies and flattens
    # prototype properties onto the new object as well. All non-primitive
    # properties are copied by reference.
    #
    # String -> a -> {k: v} -> {k: v}
    #
    curried_method(:assoc) do |key, val, obj|
      obj.merge(key => val)
    end

    # Creates a deep copy of the value which may contain (nested)
    # Arrays and Objects, Numbers, Strings, Booleans and Dates.
    # Functions are assigned by reference rather than copied
    #
    # {*} -> {*}
    #
    curried_method(:clone) do |obj|
      case obj
      when Array
        obj.dup.map(&method(:clone))
      else
        obj.dup
      end
    end

    # Returns a new object that does not contain a prop property.
    #
    # String -> {k: v} -> {k: v}
    #
    curried_method(:dissoc) do |prop, obj|
      clone(obj).tap { |o| o.delete(prop) }
    end

    # Returns whether or not an object has an own property with the specified name
    #
    # s -> {s: x} -> Boolean
    #
    curried_method(:has) do |key, obj|
      obj.key?(key)
    end

    # Returns whether or not an object or its prototype chain has a property
    # with the specified name
    #
    # s -> {s: x} -> Boolean
    #
    curried_method(:has_in) do |key, obj|
      obj.respond_to?(key)
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

    # Returns a list containing the names of all the properties of the supplied
    # object, including prototype properties.
    #
    # {k: v} -> [k]
    #
    curried_method(:keys_in) do |obj|
      (obj.methods - obj.class.methods)
        .map(&:to_s)
        .reject { |r| r.include?('=') }
        .map(&:to_sym)
        .uniq
    end

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

    # Retrieve the value at a given path.
    #
    # [Idx] -> {a} -> a | NilClass
    # Idx = String | Int
    #
    curried_method(:path) do |keys, obj|
      keys.reduce(obj) { |acc, key| acc.is_a?(Hash) ? acc.fetch(key, nil) : nil }
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

    # If the given, non-null object has an own property with the specified
    # name, returns the value of that property. Otherwise returns
    # the provided default value.
    #
    # a -> String -> Object -> a
    #
    curried_method(:prop_or) do |val, name, obj|
      case obj
      when Hash
        obj[name] || val
      else
        obj.respond_to?(name) || val
      end
    end

    # Acts as multiple prop: array of keys in, array of values out.
    # Preserves order.
    #
    # [k] -> {k: v} -> [v]
    #
    curried_method(:props) do |keys, obj|
      keys.map(&obj.method(:[]))
    end

    # Converts an object into an array of key, value arrays. Only the
    # object's own properties are used. Note that the order of the
    # output array is not guaranteed.
    #
    # {String: *} -> [[String,*]]
    #
    curried_method(:to_pairs, &:to_a)

    # Returns a list of all the enumerable own properties of the supplied object.
    #
    # {k: v} -> [v]
    #
    curried_method(:values, &:values)

    # Returns a list of all the properties, including prototype properties,
    # of the supplied object.
    #
    # {k: v} -> [v]
    #
    curried_method(:values_in) do |obj|
      keys_in(obj).map(&obj.method(:send))
    end

    # Takes a spec object and a test object; returns true if the test satisfies
    # the spec. Each of the spec's own properties must be a predicate function.
    # Each predicate is applied to the value of the corresponding property of
    # the test object. where returns true if all the predicates return true,
    # false otherwise.
    #
    # where is well suited to declaratively expressing constraints for other
    # functions such as filter and find.
    #
    # {String: (* -> Boolean)} -> {String: *} -> Boolean
    #
    curried_method(:where) do |spec, test|
      spec.all? { |k, v| v.call(test[k]) }
    end
  end
end

require_relative 'internal/curried_method'
require_relative 'internal/function_with_arity'

module Ramda
  # Function functions
  module Function
    extend ::Ramda::Internal::CurriedMethod

    curried_method(:always) do |value|
      -> { value }
    end

    # Makes a comparator function out of a function that reports whether
    # the first element is less than the second.
    #
    # (a, b -> Boolean) -> (a, b -> Number)
    #
    curried_method(:comparator) do |fn|
      lambda do |a, b|
        if fn.call(a, b)
          -1
        elsif fn.call(b, a)
          1
        else
          0
        end
      end
    end

    # Performs right-to-left function composition. The rightmost function
    # may have any arity; the remaining functions must be unary.
    #
    # Note: The result of compose is not automatically curried.
    curried_method(:compose) do |*fns|
      ->(*args) { fns.reverse.reduce(args) { |memo, fn| fn.call(*memo) } }
    end

    # Wraps a constructor function inside a curried function that can be called
    # with the same arguments and returns the same type.
    #
    # (* -> {*}) -> (* -> {*})
    #
    curried_method(:construct) do |constructor|
      ->(*args) { constructor.new(*args) }
    end

    # Returns a curried equivalent of the provided function. The curried function
    # has two unusual capabilities. First, its arguments needn't be provided
    # one at a time. If f is a ternary function and g is R.curry(f),
    # the following are equivalent:
    #
    # g(1)(2)(3)
    # g(1)(2, 3)
    # g(1, 2)(3)
    # g(1, 2, 3)

    # (* -> a) -> (* -> a)
    #
    curried_method(:curry, &:curry)

    # Returns a new function much like the supplied one, except that the
    # first two arguments' order is reversed.
    #
    # (a -> b -> c -> ... -> z) -> (b -> a -> c -> ... -> z))
    #
    curried_method(:flip) do |fn|
      ->(a, b, *args) { fn.curry.call(b, a, *args) }.curry
    end

    # A function that does nothing but return the parameter supplied to it.
    # Good as a default or placeholder function.
    #
    # a -> a
    #
    curried_method(:identity) do |el|
      el
    end

    # Turns a named method with a specified arity into a function that can be
    # called directly supplied with arguments and a target object.
    # The returned function is curried and accepts arity + 1 parameters where
    # the final parameter is the target object.
    #
    # Number -> String -> (a -> b -> ... -> n -> Object -> *)
    #
    curried_method(:invoker) do |arity, method_name|
      Ramda::Internal::FunctionWithArity.new.call(arity + 1) do |*args, object|
        object.public_send(method_name, *args)
      end.curry
    end

    # Creates a new function that, when invoked, caches the result of calling
    # fn for a given argument set and returns the result. Subsequent calls to
    # the memoized fn with the same argument set will not result in an
    # additional call to fn; instead, the cached result for that set of arguments
    # will be returned.
    #
    # (*... -> a) -> (*... -> a)
    #
    curried_method(:memoize) do |fn|
      memo = {}

      Ramda::Internal::FunctionWithArity.new.call(fn.arity) do |*args|
        memo[args] = fn.call(*args) unless memo.key?(args)
        memo[args]
      end.curry
    end

    # Accepts a function fn and returns a function that guards invocation of fn
    # such that fn can only ever be called once, no matter how many times the
    # returned function is invoked. The first value calculated is returned
    # in subsequent invocations.
    #
    # (a... -> b) -> (a... -> b)
    #
    curried_method(:once) do |fn|
      memo = {}

      Ramda::Internal::FunctionWithArity.new.call(fn.arity) do |*args|
        memo[:result] = fn.call(*args) unless memo.key?(:result)
        memo[:result]
      end.curry
    end

    # Performs left-to-right function composition. The leftmost function may
    # have any arity; the remaining functions must be unary.
    # In some libraries this function is named sequence.
    # Note: The result of pipe is not automatically curried.
    #
    # (((a, b, ..., n) -> o), (o -> p), ..., (x -> y), (y -> z)) -> ((a, b, ..., n) -> z)
    #
    curried_method(:pipe) do |*fns|
      ->(*args) { fns.reduce(args) { |memo, fn| fn.call(*memo) } }
    end
  end
end

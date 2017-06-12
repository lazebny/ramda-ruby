require_relative 'mixins'

module Ramda
  # Function functions
  module Function
    extend Ramda::Mixins

    curried_method(:always) do |value|
      -> { value }
    end

    # Makes a comparator function out of a function that reports whether
    # the first element is less than the second.
    #
    # (a, b -> Boolean) -> (a, b -> Number)
    #
    # FIXME: Implement
    # curried_method(:comparator) do |fn|
    #   fn
    # end

    # Performs right-to-left function composition. The rightmost function
    # may have any arity; the remaining functions must be unary.
    #
    # Note: The result of compose is not automatically curried.
    curried_method(:compose) do |*funs|
      ->(*args) { funs.reverse.reduce(args) { |memo, fun| fun.call(*memo) } }
    end

    # Returns a new function much like the supplied one, except that the
    # first two arguments' order is reversed.
    #
    # (a -> b -> c -> ... -> z) -> (b -> a -> c -> ... -> z))
    #
    curried_method(:flip) do |fn|
      ->(a, b, *args) { fn.curry.call(b, a, *args) }.curry
    end

    # Wraps a constructor function inside a curried function that can be called
    # with the same arguments and returns the same type.
    #
    # (* -> {*}) -> (* -> {*})
    #
    # FIXME: Implement
    # curried_method(:construct) do |constructor|
    #   -> (args) { constructor.new(*args) }
    # end

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
  end
end

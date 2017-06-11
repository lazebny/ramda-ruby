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
    # FIXME
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

    # def self.flip(fn)
    #   -> (*args) { fn.call(args[1]).call(args[0], *args[2..-1]) }.curry
    # end
  end
end

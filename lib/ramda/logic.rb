require_relative 'internal/curried_method'

module Ramda
  # Logic functions
  module Logic
    extend ::Ramda::Internal::CurriedMethod

    curried_method(:all_pass) do |predicates, obj|
      predicates.all? { |predicate| predicate.call(obj) }
    end

    curried_method(:and) do |a, b|
      a && b
    end

    curried_method(:any_pass) do |predicates, obj|
      predicates.any? { |predicate| predicate.call(obj) }
    end

    # Takes a function f and returns a function g such that if called with
    # the same arguments when f returns a "truthy" value, g returns false
    # and when f returns a "falsy" value g returns true.
    #
    # R.complement may be applied to any functor
    #
    # (*... -> *) -> (*... -> Boolean)
    #
    curried_method(:complement) do |fn|
      ::Ramda::Internal::FunctionWithArity.new.call(fn.arity) do |*args|
        !fn.call(*args)
      end.curry
    end

    # Creates a function that will process either the onTrue or the onFalse
    # function depending upon the result of the condition predicate.
    #
    # (*... -> Boolean) -> (*... -> *) -> (*... -> *) -> (*... -> *)
    #
    curried_method(:if_else) do |predicate, fn1, fn2, obj|
      predicate.call(obj) ? fn1.call(obj) : fn2.call(obj)
    end

    # Returns true if the given value is its type's empty value; false otherwise.
    #
    # a -> Boolean
    #
    curried_method(:is_empty) do |el|
      case el
      when ::NilClass, ::Integer
        false
      else
        el.empty?
      end
    end

    # A function that returns the ! of its argument. It will return true when
    # passed false-y value, and false when passed a truth-y one.
    #
    # * -> Boolean
    #
    curried_method(:not, &:!)

    # Returns true if one or both of its arguments are true. Returns false if
    # both arguments are false.
    #
    # a -> b -> a | b
    #
    curried_method(:or) do |a, b|
      a || b
    end
  end
end

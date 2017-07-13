require_relative 'internal/curried_method'

module Ramda
  # Logic functions
  module Logic
    extend ::Ramda::Internal::CurriedMethod

    # Takes a list of predicates and returns a predicate that returns
    # true for a given list of arguments if every one of the provided
    # predicates is satisfied by those arguments.
    #
    # The function returned is a curried function whose arity matches
    # that of the highest-arity predicate.
    #
    # [(*... -> Boolean)] -> (*... -> Boolean)
    #
    curried_method(:all_pass) do |predicates, obj|
      predicates.all? { |predicate| predicate.call(obj) }
    end

    # Returns true if both arguments are true; false otherwise.
    #
    # a -> b -> a | b
    #
    curried_method(:and) do |a, b|
      a && b
    end

    # Takes a list of predicates and returns a predicate that returns
    # true for a given list of arguments if at least one of the
    # provided predicates is satisfied by those arguments.
    #
    # The function returned is a curried function whose arity matches
    # that of the highest-arity predicate.
    #
    # [(*... -> Boolean)] -> (*... -> Boolean)
    #
    curried_method(:any_pass) do |predicates, obj|
      predicates.any? { |predicate| predicate.call(obj) }
    end

    # A function which calls the two provided functions and returns
    # the && of the results. It returns the result of the first function
    # if it is false-y and the result of the second function otherwise.
    # Note that this is short-circuited, meaning that the second function
    # will not be invoked if the first returns a false-y value.
    #
    # In addition to functions, R.both also accepts any fantasy-land
    # compatible applicative functor.
    #
    # (*... -> Boolean) -> (*... -> Boolean) -> (*... -> Boolean)
    #
    curried_method(:both) do |fa, fb|
      if fa.is_a?(Proc)
        ->(*args) { fa.call(*args) && fb.call(*args) }
      else
        Ramda.lift(Ramda.and, fa, fb)
      end
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
      if fn.is_a?(Proc)
        ::Ramda::Internal::FunctionWithArity.call(fn.arity) do |*args|
          !fn.call(*args)
        end.curry
      else
        Ramda.lift(Ramda.not, fn)
      end
    end

    # Returns a function, fn, which encapsulates if/else, if/else, ...
    # logic. R.cond takes a list of [predicate, transformer] pairs.
    # All of the arguments to fn are applied to each of the predicates
    # in turn until one returns a "truthy" value, at which point fn
    # returns the result of applying its arguments to the corresponding
    # transformer. If none of the predicates matches, fn returns nil.
    #
    # [[(*... -> Boolean),(*... -> *)]] -> (*... -> *)
    #
    curried_method(:cond) do |xs, x, *other_x|
      _, then_fn = xs.find do |(when_fn, _)|
        when_fn.call(x, *other_x)
      end
      then_fn.call(x, *other_x) unless then_fn.nil?
    end

    # Returns the second argument if it is not null, undefined or NaN;
    # otherwise the first argument is returned.
    #
    # a -> b -> a | b
    #
    curried_method(:default_to) do |a, b|
      b || a
    end

    # A function wrapping calls to the two functions in an || operation,
    # returning the result of the first function if it is truth-y and
    # the result of the second function otherwise.
    # Note that this is short-circuited, meaning that the second
    # function will not be invoked if the first returns a truth-y value.
    #
    # In addition to functions, R.either also accepts any fantasy-land
    # compatible applicative functor.
    #
    # (*... -> Boolean) -> (*... -> Boolean) -> (*... -> Boolean))
    #
    curried_method(:either) do |fa, fb|
      if fa.is_a?(Proc)
        ->(*args) { fa.call(*args) || fb.call(*args) }
      else
        ::Ramda.lift(Ramda.or, fa, fb)
      end
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

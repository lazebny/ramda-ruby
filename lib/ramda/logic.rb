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

require_relative 'mixins'

module Ramda
  # Relation functions
  module Relation
    extend Ramda::Mixins

    curried_method(:equals) do |a, b|
      a == b
    end

    curried_method(:lt) do |a, b|
      a < b
    end

    curried_method(:prop_eq) do |prop, value, obj|
      obj[prop] == value
    end
  end
end

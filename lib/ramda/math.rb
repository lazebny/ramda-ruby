require_relative 'mixins'

module Ramda
  # Math functions
  module Math
    extend Ramda::Mixins

    curried_method(:add) do |a, b|
      a + b
    end
  end
end

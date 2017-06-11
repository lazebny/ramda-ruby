require_relative 'mixins'

module Ramda
  # Function functions
  module Function
    extend Ramda::Mixins

    curried_method(:always) do |value|
      -> { value }
    end

    # def self.flip(fn)
    #   -> (*args) { fn.call(args[1]).call(args[0], *args[2..-1]) }.curry
    # end
  end
end

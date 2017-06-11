require_relative 'mixins'

module Ramda
  # Math functions
  module Object
    extend Ramda::Mixins

    # Creates a deep copy of the value which may contain (nested)
    # Arrays and Objects, Numbers, Strings, Booleans and Dates.
    # Functions are assigned by reference rather than copied
    #
    # {*} -> {*}
    #
    curried_method(:clone) do |object|
      case object
      when Array
        object.dup.map(&method(:clone))
      else
        object.dup
      end
    end
  end
end

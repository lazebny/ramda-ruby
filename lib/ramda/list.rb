require_relative 'mixins'

module Ramda
  # List functions
  module List
    extend Ramda::Mixins

    curried_method(:all) do |fn, collection|
      collection.all?(&fn)
    end

    curried_method(:any) do |fn, collection|
      collection.any?(&fn)
    end
  end
end

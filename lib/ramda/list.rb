module Ramda
  # List functions
  module List
    def self.all(fn)
      ->(collection) { collection.all?(&fn) }
    end

    # def self.all
    #   method(:all_source).curry
    # end

    def self.any(fn)
      ->(collection) { collection.any?(&fn) }
    end

    # def self.all_source(predicate, collection)
    #   collection.all?(&predicate)
    # end
  end
end

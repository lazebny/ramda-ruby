module Ramda
  # Relation functions
  module Relation
    def self.equals(expected)
      ->(actual) { actual == expected }
    end

    def self.lt(a)
      ->(b) { a < b }
    end

    def self.prop_eq(prop, value)
      ->(obj) { obj[prop] == value }
    end

    private_class_method

    def self.lt_source
      ->(a, b) { a < b }
    end
  end
end

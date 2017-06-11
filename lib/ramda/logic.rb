module Ramda
  # Logic functions
  module Logic
    def self.all_pass(*predicates)
      ->(obj) { predicates.all? { |predicate| predicate.call(obj) } }
    end

    def self.and(a, b)
      a && b
    end

    def self.any_pass(*predicates)
      ->(obj) { predicates.any? { |predicate| predicate.call(obj) } }
    end
  end
end

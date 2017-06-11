module Ramda
  # Math functions
  module Math
    def self.add
      method(:apply_math).curry[:+]
    end

    private_class_method

    def self.apply_math(fn, a, b)
      a.send(fn, b)
    end
  end
end

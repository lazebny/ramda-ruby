require 'ramda/version'

# Ramda library implementation, source: http://ramdajs.com/
module Ramda
  # PUBLIC ---------------------------------------------------------------

  def self.add
    method(:apply_math).curry[:+]
  end

  # def self.all
  #   method(:all_source).curry
  # end

  def self.all(fn)
    ->(collection) { collection.all?(&fn) }
  end

  def self.all_pass(*predicates)
    ->(obj) { predicates.all? { |predicate| predicate.call(obj) } }
  end

  def self.always(value)
    -> { value }
  end

  def self.and(a, b)
    a && b
  end

  def self.any(fn)
    ->(collection) { collection.any?(&fn) }
  end

  def self.any_pass(*predicates)
    ->(obj) { predicates.any? { |predicate| predicate.call(obj) } }
  end

  # FUTURE --------------------------------------------------------------------

  def self.equals(expected)
    ->(actual) { actual == expected }
  end

  # def self.flip(fn)
  #   -> (*args) { fn.call(args[1]).call(args[0], *args[2..-1]) }.curry
  # end

  def self.lt(a)
    ->(b) { a < b }
  end

  def self.prop_eq(prop, value)
    ->(obj) { obj[prop] == value }
  end

  # PRIVATE -------------------------------------------------------------------

  # def self.all_source(predicate, collection)
  #   collection.all?(&predicate)
  # end

  def self.lt_source
    ->(a, b) { a < b }
  end

  def self.apply_math(fn, a, b)
    a.send(fn, b)
  end
end

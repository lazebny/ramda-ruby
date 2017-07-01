require 'ramda/version'
require 'ramda/exception_handler'
require 'ramda/function'
require 'ramda/list'
require 'ramda/logic'
require 'ramda/math'
require 'ramda/object'
require 'ramda/relation'
require 'ramda/string'
require 'ramda/type'
require 'ramda/internal/java/__make_curry_proc__' if RUBY_PLATFORM == 'java'

# Ramda library implementation, source: http://ramdajs.com/
module Ramda
  extend Ramda::Function
  extend Ramda::List
  extend Ramda::Logic
  extend Ramda::Math
  extend Ramda::Object
  extend Ramda::Relation
  extend Ramda::String
  extend Ramda::Type
  extend Ramda::Internal::Java::MakeCurryProc if RUBY_PLATFORM == 'java'

  # Constants are faster than module variables
  #
  def self.const_missing(name)
    value = {
      DEBUG_MODE: false
    }[name]

    value.nil? ? super : const_set(name, value)
  end

  # A special placeholder value used to specify "gaps" within curried
  # functions, allowing partial application of any combination of
  # arguments, regardless of their positions.
  #
  # If g is a curried ternary function and _ is R.__, the following are equivalent:
  #
  # g(1, 2, 3)
  # g(_, 2, 3)(1)
  # g(_, _, 3)(1)(2)
  # g(_, _, 3)(1, 2)
  # g(_, 2, _)(1, 3)
  # g(_, 2)(1)(3)
  # g(_, 2)(1, 3)
  # g(_, 2)(_, 3)(1)
  #
  def self.__
    :ramda_placeholder
  end

  # A function that always returns false. Any passed in parameters are ignored.
  #
  # * -> Boolean
  #
  # rubocop:disable Style/MethodName
  def self.F
    ->(*) { false }
  end
  # rubocop:enable Style/MethodName

  # A function that always returns true. Any passed in parameters are ignored.
  #
  # * -> Boolean
  #
  # rubocop:disable Style/MethodName
  def self.T
    ->(*) { true }
  end
  # rubocop:enable Style/MethodName

  # Takes Boolean
  def self.debug_mode=(enabled)
    const_set('DEBUG_MODE', enabled)
  end

  # Returns Boolean/NilClass
  def self.debug_mode
    DEBUG_MODE
  end

  def self.exception_handler=(handler)
    @exception_handler = handler
  end

  def self.exception_handler
    @exception_handler ||= ::Ramda::ExceptionHandler.method(:with_narrow)
  end
end

# Ramda.debug_mode = true

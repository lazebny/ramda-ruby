require_relative 'internal/curried_method'

module Ramda
  # Type functions
  module Type
    extend ::Ramda::Internal::CurriedMethod

    # Checks if the input value is nil.
    curried_method(:is_nil, &:nil?)
  end
end

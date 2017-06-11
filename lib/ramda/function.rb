module Ramda
  # Function functions
  module Function
    def self.always(value)
      -> { value }
    end

    # def self.flip(fn)
    #   -> (*args) { fn.call(args[1]).call(args[0], *args[2..-1]) }.curry
    # end
  end
end

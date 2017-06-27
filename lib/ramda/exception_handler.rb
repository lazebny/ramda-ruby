module Ramda
  # Exception Handlers
  module ExceptionHandler
    # This handler is useful for debug.
    #
    # Output example:
    # 	compose -> map -> add -> ... original message ... with backtrace:
    # 	...
    # 	original backtrace
    # 	...
    #
    def self.with_narrow(e, method_name)
      raise e, [method_name, e.exception].join(' -> '), e.backtrace
    end

    # This handler follows a standard behavior.
    #
    def self.default(e, *)
      raise e, e.exception, e.backtrace
    end
  end
end

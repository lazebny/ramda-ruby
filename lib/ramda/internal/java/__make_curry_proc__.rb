module Ramda
  module Internal
    module Java
      # This hack resolved issue:
      #   undefined method `__make_curry_proc__' for Ramda::Math:Module
      #
      # Source:
      #   https://github.com/jruby/jruby/issues/1523
      #
      module MakeCurryProc
        # rubocop:disable Metrics/MethodLength
        def __make_curry_proc__(proc, passed, arity)
          is_lambda = proc.lambda?
          passed.freeze

          __send__((is_lambda ? :lambda : :proc)) do |*argv, &passed_proc|
            my_passed = passed + argv
            # original
            # if my_passed.length < arity
            # changed
            if my_passed.length < arity.abs - 1
              warn "#{caller[0]}: given block not used" unless passed_proc.nil?
              __make_curry_proc__(proc, my_passed, arity)
            else
              proc.call(*my_passed)
            end
          end
        end
        # rubocop:enable Metrics/MethodLength
      end
    end
  end
end

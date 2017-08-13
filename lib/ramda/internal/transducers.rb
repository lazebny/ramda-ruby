module Ramda
  module Internal
    # Transducers
    #
    # Signature: (*, reducing_fn) -> Proc((acc, input) -> acc)
    #
    module Transducers
      Dir["#{File.dirname(__FILE__)}/transducers/*"].each { |file| require file }
    end
  end
end

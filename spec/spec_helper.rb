require 'bundler/setup'
require 'pry'
require 'ramda'
require 'dry-monads' if RUBY_VERSION.to_f >= 2.1
require 'kleisli'

R = Ramda
R.debug_mode = true if ENV['RAMDA_DEBUG']

Maybe = ::Ramda::Internal::Functors::Maybe
DryMaybe = ::Dry::Monads::Maybe if defined?(Dry)
KleisliMaybe = ::Kleisli::Maybe

require 'coveralls'
Coveralls.wear!

RSpec.configure do |config|
  config.order = 'random'
  # Enable flags like --only-failures and --next-failure
  # config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.filter_run_excluding market: :dry_monads unless defined?(Dry)
end

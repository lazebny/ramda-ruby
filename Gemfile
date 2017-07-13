source 'https://rubygems.org'

# Specify your gem's dependencies in ramda-ruby.gemspec
gemspec

group :development do
  gem 'rake', '~> 10.0'
  # gem 'benchmark-bigo', '~> 1.0'
  gem 'benchmark-ips', '~> 2.0'
  # gem 'ruby-prof'
  # gem 'fasterer'
  # gem 'stackprof'
  # gem 'flamegraph'
end

group :testing do
  gem 'codeclimate-test-reporter', '~> 0.4.7', group: :test, require: nil
  gem 'coveralls', '~> 0.8.2', require: false
  gem 'dry-monads', '~> 0.3.1' if RUBY_VERSION.to_f >= 2.1
  # gem 'kleisli', '~> 0.2.7'
  gem 'kleisli', git: 'https://github.com/lazebny/kleisli.git', branch: 'ramda-ruby'
  gem 'pry', '~> 0.10.4'
  gem 'rspec', '~> 3.6.0'
  gem 'simplecov', '~> 0.10.0', platforms: :mri, require: false
end

group :documentation do
  # gem 'countloc', '~> 0.4.0', platforms: :mri, require: false
  # gem 'yard', '~> 0.8.7.6', require: false
  # gem 'inch', '~> 0.6.3', platforms: :mri, require: false
  # gem 'redcarpet', '~> 3.3.2', platforms: :mri # understands github markdown
end

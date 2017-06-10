require 'simplecov-csv'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::CSVFormatter,
]

SimpleCov.coverage_dir(ENV["COVERAGE_REPORTS"])
SimpleCov.start('rails')

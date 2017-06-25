require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

namespace :ramda do
  desc 'Run benchmark in current ruby'
  task :run_benchmark, [:pattern] do |_t, args|
    args.with_defaults(pattern: 'bench/*/*.rb')

    Dir[args[:pattern]].sort.each do |benchmark|
      puts "$ ruby -v #{benchmark}"
      system('ruby', '-v', '-W0', benchmark)
    end
  end

  desc 'Run benckmark in current ruby and save to file'
  task :run_benchmark_to_file, [:pattern] do |_t, args|
    args.with_defaults(pattern: 'bench/*/*.rb')

    require 'pry'
    require './bench/run_benchmark_to_file'

    ::Bench::RunBenchmarkToFile.init.call(Dir[args[:pattern]].sort)
  end
end

require 'benchmark/ips'
require 'ramda'

xs = [*1..100].freeze

fn = ->(x) { x > 50 }

Benchmark.ips do |x|
  x.report('Array#all') { xs.all?(&fn) }
  x.report('Ramda.all') { Ramda.all(fn, xs) }
  x.report('C Ramda.all') { Ramda.all(fn).call(xs) }
  x.report('CA Ramda.all') { Ramda.all.call(fn).call(xs) }
  x.compare!
end

require 'benchmark/ips'
require 'ramda'

xs = [*1..100].freeze

fn = ->(x) { x == 50 }

Benchmark.ips do |x|
  x.report('Array#any') { xs.any?(&fn) }
  x.report('Ramda.any') { Ramda.any(fn, xs) }
  x.report('C Ramda.any') { Ramda.any(fn).call(xs) }
  x.report('CA Ramda.any') { Ramda.any.call(fn).call(xs) }
  x.compare!
end

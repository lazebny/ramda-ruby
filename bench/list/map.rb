require 'benchmark/ips'
require 'ramda'

xs = [*1..100].freeze

fn = ->(x) { x + 1 }

Benchmark.ips do |x|
  x.report('Array#map') { xs.map(&fn) }
  x.report('Ramda.map') { Ramda.map(fn, xs) }
  x.report('C Ramda.map') { Ramda.map(fn).call(xs) }
  x.report('CA Ramda.map') { Ramda.map.call(fn).call(xs) }
  x.compare!
end

require 'benchmark/ips'
require 'ramda'

xs = [*1..100].freeze

Benchmark.ips do |x|
  x.report('Integer#+') { xs.sample + xs.sample }
  x.report('Ramda.add') { Ramda.add(xs.sample, xs.sample) }
  x.report('C Ramda.add') { Ramda.add(xs.sample).call(xs.sample) }
  x.report('CA Ramda.add') { Ramda.add.call(xs.sample).call(xs.sample) }
  x.compare!
end

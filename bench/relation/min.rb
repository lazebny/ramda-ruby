require 'benchmark/ips'
require 'ramda'

xs = [*1..100]

Benchmark.ips do |x|
  x.report('Array#min') { [xs.sample, xs.sample].min }
  x.report('Ramda.min') { Ramda.min(xs.sample, xs.sample) }
  x.report('C Ramda.min') { Ramda.min(xs.sample).call(xs.sample) }
  x.report('CA Ramda.min') { Ramda.min.call(xs.sample).call(xs.sample) }
  x.compare!
end

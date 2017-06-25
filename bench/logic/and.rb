require 'benchmark/ips'
require 'ramda'

xs = [true, false, 1, nil, 0, '', 'string', Object, {}, 1.8]

Benchmark.ips do |x|
  x.report('&&') { xs.sample && xs.sample }
  x.report('Ramda.and') { Ramda.and(xs.sample, xs.sample) }
  x.report('C Ramda.and') { Ramda.and(xs.sample).call(xs.sample) }
  x.report('CA Ramda.and') { Ramda.and.call(xs.sample).call(xs.sample) }
  x.compare!
end

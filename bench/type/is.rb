require 'benchmark/ips'
require 'ramda'

obj = {}
xs = [Object, String, Integer, NilClass, TrueClass, Hash, StandardError]

Benchmark.ips do |x|
  x.report('Object#is_a?') { obj.is_a?(xs.sample) }
  x.report('Ramda.is') { Ramda.is(xs.sample, obj) }
  x.report('C Ramda.is') { Ramda.is(xs.sample).call(obj) }
  x.report('CA Ramda.is') { Ramda.is.call(xs.sample).call(obj) }
  x.compare!
end

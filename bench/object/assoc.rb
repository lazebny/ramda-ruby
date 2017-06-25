require 'benchmark/ips'
require 'ramda'

obj = { a: 100, c: 300, d: 400, e: 'abc' }.freeze

Benchmark.ips do |x|
  x.report('Hash#merge') { obj.merge(b: 200) }
  x.report('Ramda.assoc') { Ramda.assoc(:b, 200, obj) }
  x.report('C Ramda.assoc') { Ramda.assoc(:b, 200).call(obj) }
  x.report('CA Ramda.assoc') { Ramda.assoc.call(:b).call(200).call(obj) }
  x.compare!
end

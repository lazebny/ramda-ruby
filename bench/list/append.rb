require 'benchmark/ips'
require 'ramda'

xs = [*1..100].freeze

Benchmark.ips do |x|
  x.report('Array#+') { xs + [1] }
  x.report('Ramda.append') { Ramda.append(1, xs) }
  x.report('C Ramda.append') { Ramda.append(1).call(xs) }
  x.report('CA Ramda.append') { Ramda.append.call(1).call(xs) }
  x.compare!
end

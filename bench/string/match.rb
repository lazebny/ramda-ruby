require 'benchmark/ips'
require 'ramda'

str = 'Tests a regular expression against a String'
xs = [/test/, /a/, /something/, /S/, /abc/]

Benchmark.ips do |x|
  x.report('String#match') { str[xs.sample] }
  x.report('Ramda.match') { Ramda.match(xs.sample, str) }
  x.report('C Ramda.match') { Ramda.match(xs.sample).call(str) }
  x.report('CA Ramda.match') { Ramda.match.call(xs.sample).call(str) }
  x.compare!
end

require 'benchmark/ips'
require 'ramda'

def add(a, b)
  a + b
end

add_fn = method(:add)
add_proc = method(:add).to_proc
xs = [*1..100]

unless (add(1, 2) == add_fn.call(1, 2)) && (add(1, 2) == Ramda.curry(add_fn).call(1, 2))
  raise StandardError, 'Results are not equal'
end

Benchmark.ips do |x|
  x.report('Method') { add(xs.sample, xs.sample) }
  x.report('Proc.call') { add_proc.call(xs.sample, xs.sample) }
  x.report('Proc.curry0') { add_proc.curry.call(xs.sample, xs.sample) }
  x.report('Proc.curry1') { add_proc.curry.call(xs.sample).call(xs.sample) }
  x.report('Method.curry0') { add_fn.to_proc.curry.call(xs.sample, xs.sample) }
  x.report('Method.curry1') { add_fn.to_proc.curry.call(xs.sample).call(xs.sample) }
  x.report('C Ramda.curry') { Ramda.curry(add_fn).call(xs.sample, xs.sample) }
  x.report('CA Ramda.curry') { Ramda.curry(add_fn).call(xs.sample).call(xs.sample) }
  x.compare!
end

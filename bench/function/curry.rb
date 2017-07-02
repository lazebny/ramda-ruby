require 'benchmark/ips'
require 'ramda'

xs = [*1..100]

def add(a, b)
  a + b
end

add_fn = method(:add)
add_proc = method(:add).to_proc
add_curried = method(:add).to_proc.curry
add_ramda = Ramda.curry(add_fn)
add_ramda1 = Ramda.curry(add_fn).call(xs.sample)

unless (add(1, 2) == add_fn.call(1, 2)) && (add(1, 2) == Ramda.curry(add_fn).call(1, 2))
  raise StandardError, 'Results are not equal'
end

Benchmark.ips do |x|
  x.report('Method') { add(xs.sample, xs.sample) }
  x.report('Proc.call') { add_proc.call(xs.sample, xs.sample) }
  x.report('Proc.curry') { add_curried.call(xs.sample, xs.sample) }
  x.report('C Ramda.curry') { add_ramda.call(xs.sample, xs.sample) }
  x.report('CA Ramda.curry') { add_ramda1.call(xs.sample) }
  x.compare!
end

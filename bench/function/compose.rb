require 'benchmark/ips'
require 'ramda'

def fn1(x)
  x + 1
end

def fn2(x)
  x - 1
end

fn1_proc = method(:fn1)
fn2_proc = method(:fn2)

Benchmark.ips do |x|
  x.report('Ruby compose') { fn2(fn1(100)) }
  x.report('Ramda.compose') { Ramda.compose(fn2_proc, fn1_proc).call(100) }
  x.compare!
end

require 'ramda'
require 'ruby-prof'

RubyProf.start

# ...

xs = [true, false, 1, nil, 0, '', 'string', Object, {}, 1.8]
100_000.times { Ramda.and(xs.sample, xs.sample) }

# ...

result = RubyProf.stop

printer = RubyProf::FlatPrinter.new(result)
printer.print(STDOUT)

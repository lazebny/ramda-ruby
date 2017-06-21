require 'spec_helper'

describe Ramda::Function do
  let(:r) { described_class }

  context '#__' do
    it 'from docs' do
      greet = R.replace('{name}', r.__, 'Hello, {name}!')
      expect(greet.call('Alice')).to eq('Hello, Alice!')

      greet = R.replace(r.__, r.__, 'Hello, {name}!')
      expect(greet.call('{name}', 'Alice')).to eq('Hello, Alice!')
    end
  end

  context '#always' do
    it 'from docs' do
      str = 'Tee'
      expect(r.always(str).call).to be(str)
    end

    it 'is curried' do
      str = 'Tee'
      expect(r.always.call(str).call).to be(str)
    end
  end

  context '#ap' do
    it 'from docs' do
      expect(r.ap([R.multiply(2), R.add(3)], [1, 2, 3])).to eq([2, 4, 6, 4, 5, 6])
      expect(r.ap([R.concat('tasty '), R.to_upper], ['pizza', 'salad']))
        .to eq(['tasty pizza', 'tasty salad', 'PIZZA', 'SALAD'])
    end
  end

  context '#binary' do
    it 'from docs' do
      takes_three_args = ->(a, b, c) { [a, b, c]; }
      expect(takes_three_args.call(1, 2, 3)).to eq([1, 2, 3])

      takes_two_args = r.binary(takes_three_args)
      expect(takes_two_args.call(1, 2, 3)).to eq([1, 2, nil])
    end
  end

  context '#comparator' do
    it 'from docs' do
      sort_rule = r.comparator(->(a, b) { a < b })
      numbers = [30, 25, 21]
      expect(R.sort(sort_rule, numbers)).to eq([21, 25, 30])
    end
  end

  context '#compose' do
    it 'from docs' do
      classy_greeting = lambda do |first_name, last_name|
        "The name's #{last_name}, #{first_name} #{last_name}"
      end
      abs = ->(val) { val < 0 ? -1 * val : val }

      expect(r.compose(R.to_upper, classy_greeting).call('James', 'Bond'))
        .to eq("THE NAME'S BOND, JAMES BOND")

      expect(r.compose(abs, R.add(1), R.multiply(2)).call(-4)).to be(7)
    end
  end

  context '#construct' do
    it 'from docs' do
      array_builder = r.construct(Array)
      expect(array_builder.call(2, 10)).to eq([10, 10])
    end
  end

  context '#construct_n' do
    it 'from docs' do
      calendar = Class.new do
        attr_reader :days

        def initialize(*days)
          @days = days
        end
      end

      callendar_with_three_days = r.construct_n(3, calendar)

      expect(callendar_with_three_days.call(1).call(2).call(3).days).to eq([1, 2, 3])
    end
  end

  context '#converge' do
    it 'from docs' do
      average = r.converge(R.divide, [R.sum, R.length])
      expect(average.call([1, 2, 3, 4, 5, 6, 7])).to eq(4)

      strange_concat = r.converge(R.concat, [R.to_upper, R.to_lower])
      expect(strange_concat.call('Yodel')).to eq('YODELyodel')
    end
  end

  context '#curry' do
    it 'from docs' do
      add_four_numbers = ->(a, b, c, d) { a + b + c + d }

      curried_add_four_numbers = r.curry(add_four_numbers)
      f = curried_add_four_numbers.call(1, 2)
      g = f.call(3)
      expect(g.call(4)).to be(10)
    end

    def test_method(a)
      a
    end

    it 'can receive a method' do
      expect(r.curry(method(:test_method)).call(100)).to eq(100)
    end

    it 'supports placeholder' do
      g = r.curry(->(a, b, c) { a + b + c })

      expect(g.call(1, 2, 3)).to eq(6)
      expect(g.call(R.__, 2, 3).call(1)).to eq(6)
      expect(g.call(R.__, R.__, 3).call(1).call(2)).to eq(6)
      expect(g.call(R.__, R.__, 3).call(1, 2)).to eq(6)
      expect(g.call(R.__, 2, R.__).call(1, 3)).to eq(6)
    end
  end

  context '#curry_n' do
    it 'from docs' do
      sum_args = ->(*args) { R.sum(args) }

      curried_add_four_numbers = r.curry_n(4, sum_args)
      f = curried_add_four_numbers.call(1, 2)
      g = f.call(3)

      expect(g.call(4)).to eq(10)
    end

    it 'supports placeholder' do
      g = r.curry_n(3, ->(*args) { R.sum(args) })

      expect(g.call(1, 2, 3)).to eq(6)
      expect(g.call(R.__, 2, 3).call(1)).to eq(6)
      expect(g.call(R.__, R.__, 3).call(1).call(2)).to eq(6)
      expect(g.call(R.__, R.__, 3).call(1, 2)).to eq(6)
      expect(g.call(R.__, 2, R.__).call(1, 3)).to eq(6)
    end
  end

  context '#empty' do
    it 'from docs' do
      expect(r.empty([1, 2, 3])).to eq([])
      expect(r.empty('unicorns')).to eq('')
      expect(r.empty(x: 1, y: 2)).to eq({})
    end

    it 'object has empty method' do
      obj = Class.new do
        def empty
          []
        end
      end.new

      expect(r.empty(obj)).to eq([])
    end
  end

  context '#flip' do
    def merge_tree
      ->(a, b, c) { [a, b, c] }
    end

    it 'from docs' do
      expect(merge_tree.call(1, 2, 3)).to eq([1, 2, 3])
      expect(r.flip(merge_tree).call(1, 2, 3)).to eq([2, 1, 3])
    end

    it 'curried' do
      expect(r.flip(merge_tree).call(1, 2).call(3)).to eq([2, 1, 3])
      expect(r.flip(merge_tree).call(1).call(2).call(3)).to eq([2, 1, 3])
    end
  end

  context '#identity' do
    it 'from docs' do
      expect(r.identity(1)).to be(1)
      obj = {}
      expect(r.identity(obj)).to be(obj)
    end

    it 'is curried' do
      obj = {}
      expect(r.identity.call(obj)).to be(obj)
    end
  end

  context '#invoker' do
    it 'from docs' do
      slice_form = r.invoker(1, 'slice')
      expect(slice_form.call(6, 'abcdefghijklm')).to eq('g')

      slice_form6 = r.invoker(2, 'slice').call(6)
      expect(slice_form6.call(8, 'abcdefghijklmnop')).to eq('ghijklmn')
    end
  end

  context '#juxt' do
    it 'from docs' do
      get_range = r.juxt([->(*xs) { xs.min }, ->(*xs) { xs.max }])
      expect(get_range.call(3, 4, 9, -3)).to eq([-3, 9])
    end
  end

  context '#memoize' do
    it 'from docs' do
      count = 0

      sum = r.memoize(lambda do |a, b, c|
        count += 1
        a + b + c
      end)

      expect(sum.call(10, 20, 30)).to be(60)
      expect(sum.call(10, 20, 30)).to be(60)
      expect(sum.call(10, 20, 30)).to be(60)

      expect(count).to be(1)
    end

    it 'is curried' do
      count = 0

      sum = r.memoize(lambda do |a, b, c|
        count += 1
        a + b + c
      end)

      expect(sum.call(10).call(20).call(30)).to be(60)
      expect(sum.call(10, 20).call(30)).to be(60)
      expect(sum.call(10, 20, 30)).to be(60)

      expect(count).to be(1)
    end
  end

  context '#n_ary' do
    it 'from docs' do
      takes_two_args = ->(a, b) { [a, b] }

      # expect(takes_two_args.arity).to be(2)
      expect(takes_two_args.call(1, 2)).to eq([1, 2])

      takes_one_arg = r.n_ary(1, takes_two_args)
      # expect(takes_one_arg.arity).to be(1)
      expect(takes_one_arg.call(1, 2)).to eq([1, nil])
    end
  end

  context '#of' do
    it 'from docs' do
      expect(r.of(nil)).to eq([nil])
      expect(r.of([42])).to eq([[42]])
    end
  end

  context '#once' do
    it 'from docs' do
      add_one_once = r.once(->(x) { x + 1 })
      expect(add_one_once.call(10)).to eq(11)
      expect(add_one_once.call(add_one_once.call(50))).to eq(11)
    end
  end

  context '#pipe' do
    it 'from docs' do
      classy_greeting = lambda do |first_name, last_name|
        "The name's #{last_name}, #{first_name} #{last_name}"
      end
      abs = ->(val) { val < 0 ? -1 * val : val }

      expect(r.pipe(classy_greeting, R.to_upper).call('James', 'Bond'))
        .to eq("THE NAME'S BOND, JAMES BOND")

      expect(r.pipe(R.multiply(2), R.add(1), abs).call(-4)).to be(7)
    end
  end

  context '#tap' do
    it 'from docs' do
      say_x = instance_double(Proc)
      expect(say_x).to receive(:call).with(100)
      expect(r.tap(say_x, 100)).to be(100)
    end
  end

  context '#unary' do
    it 'from docs' do
      takes_two_args = ->(a, b) { [a, b] }
      expect(takes_two_args.call(1, 2)).to eq([1, 2])

      takes_one_args = r.unary(takes_two_args)
      expect(takes_one_args.call(1, 2)).to eq([1, nil])
    end
  end

  context '#use_with' do
    it 'from docs' do
      pow = ->(x, count) { Array.new(count, x).reduce(:*) }

      expect(r.use_with(pow, [R.identity, R.identity]).call(3, 4)).to eq(81)
      expect(r.use_with(pow, [R.identity, R.identity]).call(3).call(4)).to eq(81)
      expect(r.use_with(pow, [R.dec, R.inc]).call(3, 4)).to eq(32)
      expect(r.use_with(pow, [R.dec, R.inc]).call(3).call(4)).to eq(32)
    end
  end
end

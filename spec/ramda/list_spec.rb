require 'spec_helper'

describe Ramda::List do
  let(:r) { described_class }

  context '#all' do
    it 'test' do
      equals3 = R.equals(3)
      expect(r.all(equals3, [3, 3, 3, 3])).to be_truthy
      expect(r.all(equals3, [3, 3, 1, 3])).to be_falsey
    end

    it 'is curried' do
      equals3 = R.equals(3)
      expect(r.all(equals3).call([3, 3, 3])).to be_truthy
    end
  end

  context '#any' do
    it 'test' do
      greater_than0 = R.lt(1)
      greater_than2 = R.lt(2)

      expect(r.any(greater_than0, [0, 1])).to be_falsey
      expect(r.any(greater_than2, [2, 3])).to be_truthy
    end

    it 'is curried' do
      greater_than0 = R.lt(1)

      expect(r.any(greater_than0)[[0, 1]]).to be_falsey
    end
  end

  context '#append' do
    it 'from docs' do
      expect(r.append('tests', %w[write more])).to eq(%w[write more tests])
      expect(r.append('tests', [])).to eq(['tests'])
      expect(r.append(['tests'], %w[write more])).to eq(['write', 'more', ['tests']])
    end

    it 'is curried' do
      expect(R.append(1).call([4, 3, 2])).to eq([4, 3, 2, 1])
    end
  end

  context '#concat' do
    it 'from docs' do
      expect(r.concat('ABC', 'DEF')).to eq('ABCDEF')
      expect(r.concat([4, 5, 6], [1, 2, 3])).to eql([4, 5, 6, 1, 2, 3])
      expect(r.concat([], [])).to eql([])
    end

    it 'is curried' do
      expect(r.concat('ABC').call('DEF')).to eq('ABCDEF')
    end
  end

  context '#contains' do
    it 'from docs' do
      expect(r.contains(3, [1, 2, 3])).to be_truthy
      expect(r.contains(4, [1, 2, 3])).to be_falsey
      expect(r.contains({ name: 'Fred' }, [{ name: 'Fred' }])).to be_truthy
      expect(r.contains([42], [[42]])).to be_truthy
    end

    it 'is curried' do
      expect(r.contains(3).call([1, 2, 3]))
    end
  end

  context '#drop' do
    it 'from docs' do
      expect(r.drop(1, %w[foo bar baz])).to eq(%w[bar baz])
      expect(r.drop(2, %w[foo bar baz])).to eq(%w[baz])
      expect(r.drop(3, %w[foo bar baz])).to eq([])
      expect(r.drop(4, %w[foo bar baz])).to eq([])
      expect(r.drop(3, 'ramda')).to eq('da')
    end

    it 'is curried' do
      expect(r.drop(3).call('ramda')).to eq('da')
    end
  end

  context '#filter' do
    def is_even
      ->(n) { n.even? }
    end

    it 'from docs' do
      expect(r.filter(is_even, [1, 2, 3, 4])).to eq([2, 4])
      expect(r.filter(is_even, a: 1, b: 2, c: 3, d: 4)).to eq(b: 2, d: 4)
    end

    it 'is curried' do
      expect(r.filter(is_even).call([1, 2, 3, 4])).to eq([2, 4])
    end
  end

  context '#find' do
    it 'from docs' do
      list = [{ a: 1 }, { a: 2 }, { a: 3 }]

      expect(r.find(R.prop_eq(:a, 2), list)).to eq(a: 2)
      expect(r.find(R.prop_eq(:a, 4), list)).to be_nil
    end

    it 'is curried' do
      list = [{ a: 1 }, { a: 2 }, { a: 3 }]

      expect(r.find(R.prop_eq(:a, 2)).call(list)).to eq(a: 2)
    end
  end

  context '#flatten' do
    it 'from docs' do
      expect(r.flatten([1, 2, [3, 4], 5, [6, [7, 8, [9, [10, 11], 12]]]]))
        .to eq([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])
    end
  end

  context '#group_by' do
    it 'from docs' do
      by_grade = lambda do |student|
        case student.fetch(:score)
        when 0...65 then 'F'
        when 0...70 then 'D'
        when 0...80 then 'C'
        when 0...90 then 'B'
        else
          'A'
        end
      end
      students = [
        { name: 'Abby', score: 84 },
        { name: 'Eddy', score: 58 },
        { name: 'Jack', score: 69 }
      ]
      expect(r.group_by(by_grade, students)).to eq(
        'D' => [{ name: 'Jack', score: 69 }],
        'F' => [{ name: 'Eddy', score: 58 }],
        'B' => [{ name: 'Abby', score: 84 }]
      )
    end

    it 'is curried' do
      students = [
        { name: 'Mike', age: 30 },
        { name: 'Tom', age: 25 },
        { name: 'Tom', age: 20 }
      ]

      group_by_name = r.group_by(->(a) { a.fetch(:name) })
      expect(group_by_name.call(students)).to eq(
        'Tom' => [{ name: 'Tom', age: 25 }, { name: 'Tom', age: 20 }],
        'Mike' => [{ name: 'Mike', age: 30 }]
      )
    end
  end

  context '#head' do
    it 'from docs' do
      expect(r.head(%w[fi fo fum])).to eq('fi')
      expect(r.head([])).to be_nil
      expect(r.head('abc')).to eq('a')
      expect(r.head('')).to eq('')
    end
  end

  context '#index_of' do
    it 'from docs' do
      expect(r.index_of(3, [1, 2, 3, 4])).to be(2)
      expect(r.index_of(1, [1, 2, 3, 4])).to be(0)
      expect(r.index_of(10, [1, 2, 3, 4])).to be(-1)
    end
  end

  context '#join' do
    it 'from docs' do
      expect(r.join('|', [1, 2, 3])).to eq('1|2|3')
    end

    it 'is curried' do
      spacer = r.join(' ')
      expect(spacer.call(['a', 2, 3.4])).to eq('a 2 3.4')
    end
  end

  context '#last_index_of' do
    it 'from docs' do
      expect(r.last_index_of(3, [-1, 3, 3, 0, 1, 2, 3, 4])).to be(6)
      expect(r.last_index_of(10, [1, 2, 3, 4])).to be(-1)
    end
  end

  context '#map' do
    it 'from docs' do
      double_fn = ->(x) { x * 2 }

      expect(r.map(double_fn, [1, 2, 3])).to eq([2, 4, 6])
      expect(r.map(double_fn, x: 1, y: 2, z: 3)).to eq(x: 2, y: 4, z: 6)
    end

    it 'is curried' do
      double_fn = ->(x) { x * 2 }

      expect(r.map(double_fn).call([1, 2, 3])).to eq([2, 4, 6])
    end
  end

  context '#nth' do
    it 'from docs' do
      list = %w[foo bar baz quux]
      expect(r.nth(1, list)).to eq('bar')
      expect(r.nth(-1, list)).to eq('quux')
      expect(r.nth(-99, list)).to be_nil

      expect(r.nth(2, 'abc')).to eq('c')
      expect(r.nth(3, 'abc')).to eq('')
    end
  end

  context '#pluck' do
    it 'from docs' do
      expect(r.pluck(:a).call([{ a: 1 }, { a: 2 }])).to eq([1, 2])
      expect(r.pluck(0).call([[1, 2], [3, 4]])).to eq([1, 3])
    end
  end

  context '#prepend' do
    it 'from docs' do
      expect(r.prepend('fee', %w[fi fo fum])).to eq(%w[fee fi fo fum])
    end
  end

  context '#range' do
    it 'from docs' do
      expect(r.range(1, 5)).to eq([1, 2, 3, 4])
      expect(r.range(50, 53)).to eq([50, 51, 52])
    end
  end

  context '#reduce' do
    it 'from docs' do
      # ((((0 - 1) - 2) - 3) - 4) = -10
      expect(r.reduce(R.subtract, 0, [1, 2, 3, 4])).to be(-10)
    end
  end

  xcontext '#reduce_right' do
    it 'from docs' do
      # (1 - (2 - (3 - (4 - 0)))))
      expect(r.reduce_right(R.subtract, 0, [1, 2, 3, 4])).to be(-2)
    end
  end

  context '#reverse' do
    it 'from docs' do
      expect(r.reverse([1, 2, 3])).to eq([3, 2, 1])
      expect(r.reverse([1, 2])).to eq([2, 1])
      expect(r.reverse([1])).to eq([1])
      expect(r.reverse([])).to eq([])

      expect(r.reverse('abc')).to eq('cba')
      expect(r.reverse('ab')).to eq('ba')
      expect(r.reverse('a')).to eq('a')
      expect(r.reverse('')).to eq('')
    end
  end

  context '#reject' do
    it 'from docs' do
      is_odd = ->(n) { n.odd? }

      expect(r.reject(is_odd, [1, 2, 3, 4])).to eq([2, 4])
      expect(r.reject(is_odd, a: 1, b: 2, c: 3, d: 4)).to eq(b: 2, d: 4)
    end
  end

  context '#sort' do
    it 'from docs' do
      diff = ->(a, b) { a - b }
      expect(r.sort(diff, [4, 2, 7, 5])).to eq([2, 4, 5, 7])
    end
  end

  context '#tail' do
    it 'from docs' do
      expect(r.tail([1, 2, 3])).to eq([2, 3])
      expect(r.tail([1, 2])).to eq([2])
      expect(r.tail([1])).to eq([])
      expect(r.tail([])).to eq([])

      expect(r.tail('abc')).to eq('bc')
      expect(r.tail('ab')).to eq('b')
      expect(r.tail('a')).to eq('')
      expect(r.tail('')).to eq('')
    end
  end
end

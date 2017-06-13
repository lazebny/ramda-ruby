require 'spec_helper'

describe Ramda::Function do
  let(:r) { described_class }

  context '#always' do
    it 'test' do
      str = 'Tee'
      expect(r.always(str).call).to be(str)
    end

    it 'is curried' do
      str = 'Tee'
      expect(r.always.call(str).call).to be(str)
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

  context '#curry' do
    it 'from docs' do
      add_four_numbers = ->(a, b, c, d) { a + b + c + d }

      curried_add_four_numbers = r.curry(add_four_numbers)
      f = curried_add_four_numbers.call(1, 2)
      g = f.call(3)
      expect(g.call(4)).to be(10)
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
end

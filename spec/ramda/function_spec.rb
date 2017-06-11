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

  xcontext '#comparator' do
    it 'from docs' do
      sort_rule = r.comparator(->(a, b) { a <=> b })
      numbers = [30, 25, 21]
      expect(numbers.sort_by { |a, b| a <=> b }).to eq(numbers.sort_by(&sort_rule))
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

  xcontext '#flip' do
    it 'from docs' do
      merge_tree = ->(a, b, c) { [a, b, c] }

      expect(merge_tree.call(1, 2, 3)).to eq([1, 2, 3])
      expect(R.flip(merge_tree).call(1, 2, 3)).to eq([2, 1, 3])
    end
  end
end

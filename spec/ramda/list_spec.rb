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
end

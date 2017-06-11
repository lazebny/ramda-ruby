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
end

require 'spec_helper'

describe Ramda::Math do
  let(:r) { described_class }

  context '#add' do
    it 'from docs' do
      expect(r.add(2, 3)).to be(5)
    end

    it 'is curried' do
      expect(r.add(2).call(3)).to be(5)
    end
  end

  context '#divide' do
    it 'from docs' do
      expect(r.divide(71, 100)).to be(0.71)
    end

    it 'is curried' do
      expect(r.divide(1).call(4)).to be(0.25)
    end
  end

  context '#multipy' do
    it 'from docs' do
      triple = r.multiply(3)

      expect(triple.call(4)).to be(12)
      expect(r.multiply(2, 5)).to be(10)
    end

    it '#curried' do
      expect(r.multiply(2).call(5)).to eq(10)
    end
  end
end

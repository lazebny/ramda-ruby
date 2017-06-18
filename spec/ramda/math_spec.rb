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

  context '#dec' do
    it 'from docs' do
      expect(r.dec(42)).to eq(41)
    end
  end

  context '#divide' do
    it 'from docs' do
      expect(r.divide(71, 100)).to eq(0.71)
    end

    it 'is curried' do
      expect(r.divide(1).call(4)).to eq(0.25)
    end
  end

  context '#inc' do
    it 'from docs' do
      expect(r.inc(42)).to eq(43)
    end
  end

  context '#modulo' do
    it 'from docs' do
      expect(r.modulo(0, 3)).to be(0)
      expect(r.modulo(42, 2)).to be(0)
      expect(r.modulo(21, 2)).to be(1)
      expect(r.modulo(17, 3)).to be(2)
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

  context '#product' do
    it 'from docs' do
      expect(r.product([2, 4, 6, 8, 100, 1])).to be(38_400)
    end
  end

  context '#subsctrcat' do
    it 'from docs' do
      expect(r.subtract(10, 8)).to be(2)

      minus5 = r.subtract(17)
      expect(minus5.call(5)).to be(12)

      complementary_angel = r.subtract(90)
      expect(complementary_angel.call(30)).to be(60)
      expect(complementary_angel.call(72)).to be(18)
    end
  end

  context '#sum' do
    it 'from docs' do
      expect(r.sum([2, 4, 6, 8, 100, 1])).to be(121)
    end
  end
end

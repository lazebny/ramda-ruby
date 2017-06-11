require 'spec_helper'

describe Ramda::Math do
  let(:r) { described_class }

  it '#add' do
    expect(r.add.call(2, 3)).to be(5)
    expect(r.add.call(2).call(3)).to be(5)
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

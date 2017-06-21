require 'spec_helper'

describe Ramda::Internal::CurriedMethod do
  let(:instance) { Class.new { extend Ramda::Internal::CurriedMethod } }

  context '#curried_method' do
    it 'without placeholder' do
      instance.curried_method(:g) do |a, b, c|
        a + b + c
      end

      # expect(instance.sample_method.origin_arity).to be(3)
      expect(instance.g.call(1).call(2).call(3)).to be(6)
      expect(instance.g(1).call(2).call(3)).to be(6)
      expect(instance.g(1, 2).call(3)).to be(6)
      expect(instance.g(1, 2, 3)).to be(6)
    end

    it 'with placeholder' do
      instance.curried_method(:g) do |a, b, c|
        a + b + c
      end

      expect(instance.g(1, 2, 3)).to eq(6)
      expect(instance.g(R.__, 2, 3).call(1)).to eq(6)
      expect(instance.g(R.__, R.__, 3).call(1).call(2)).to eq(6)
      expect(instance.g(R.__, R.__, 3).call(1, 2)).to eq(6)
      expect(instance.g(R.__, 2, R.__).call(1, 3)).to eq(6)
      # expect(instance.g(R.__, 2).call(1).call(3)).to eq(6)
      # expect(instance.g(R.__, 2).call(1, 3)).to eq(6)
      # expect(instance.g(R.__, 2).call(R.__, 3).call(1)).to eq(6)
    end
  end
end

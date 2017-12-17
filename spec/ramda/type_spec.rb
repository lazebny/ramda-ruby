require 'spec_helper'

describe Ramda::Type do
  let(:r) { Ramda }

  context '#is' do
    it 'from docs' do
      expect(r.is(Hash, {})).to be_truthy
      expect(r.is(Integer, 1)).to be_truthy
      expect(r.is(Hash, 1)).to be_falsey
      expect(r.is(String, 's')).to be_truthy
      expect(r.is(String, '')).to be_truthy
      expect(r.is(Hash, 's')).to be_falsey
      expect(r.is(Integer, {})).to be_falsey
    end
  end

  context '#is_nil' do
    it 'from docs' do
      expect(r.is_nil(nil)).to be_truthy
      expect(r.is_nil(0)).to be_falsey
      expect(r.is_nil([])).to be_falsey
      expect(r.is_nil('')).to be_falsey
    end
  end

  context '#prop_is' do
    it 'from docs' do
      expect(R.prop_is(Integer, :x, {x: 1, y: 2})).to be_truthy
      expect(R.prop_is(Integer, :x, {x: 'foo'})).to be_falsey
      expect(R.prop_is(Integer, :x, {})).to be_falsey
    end
  end

  context '#type' do
    it 'from docs' do
      expect(r.type({})).to be(Hash)
      expect(r.type(false)).to be(FalseClass)
      expect(r.type('s')).to be(String)
      expect(r.type(nil)).to be(NilClass)
      expect(r.type([])).to be(Array)
      expect(r.type(/[A-z]/)).to be(Regexp)
      expect(r.type(-> {})).to be(Proc)
    end
  end
end

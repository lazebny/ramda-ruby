require 'spec_helper'

describe Ramda::Relation do
  let(:r) { described_class }

  it '#lt' do
    expect(r.lt(2).call(1)).to be_falsey
    expect(r.lt(2).call(2)).to be_falsey
    expect(r.lt(2).call(3)).to be_truthy
    expect(r.lt('a').call('z')).to be_truthy
    expect(r.lt('z').call('a')).to be_falsey
  end
end

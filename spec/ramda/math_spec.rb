require 'spec_helper'

describe Ramda::Math do
  let(:r) { described_class }

  it '#add' do
    expect(r.add.call(2, 3)).to be(5)
    expect(r.add.call(2).call(3)).to be(5)
  end
end

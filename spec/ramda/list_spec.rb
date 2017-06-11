require 'spec_helper'

describe Ramda::List do
  let(:r) { described_class }

  it '#all' do
    equals3 = R.equals(3)

    expect(r.all(equals3).call([3, 3, 3, 3])).to be_truthy
    expect(r.all(equals3).call([3, 3, 1, 3])).to be_falsey
  end

  it '#any' do
    # var lessThan0 = R.flip(R.lt)(0);
    # var lessThan2 = R.flip(R.lt)(2);

    greater_than0 = R.lt(1)
    greater_than2 = R.lt(2)

    expect(r.any(greater_than0)[[0, 1]]).to be_falsey
    expect(r.any(greater_than2)[[2, 3]]).to be_truthy
  end
end

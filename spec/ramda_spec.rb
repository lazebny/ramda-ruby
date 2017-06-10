require 'spec_helper'
require 'pry'

RSpec.describe Ramda do
  R = described_class

  it 'has a version number' do
    expect(Ramda::VERSION).not_to be nil
  end

  it '#add' do
    expect(R.add.call(2, 3)).to be(5)
    expect(R.add.call(2).call(3)).to be(5)
  end

  it '#all' do
    equals3 = R.equals(3)

    expect(R.all(equals3).call([3, 3, 3, 3])).to be_truthy
    expect(R.all(equals3).call([3, 3, 1, 3])).to be_falsey
  end

  it '#allPass' do
    is_queen = R.prop_eq(:rank, 'Queen')
    is_spade = R.prop_eq(:suit, 'Spade')

    is_queen_of_spades = R.all_pass(is_queen, is_spade)

    expect(is_queen_of_spades.call(rank: 'King', suit: 'Spade')).to be_falsey
    expect(is_queen_of_spades.call(rank: 'Queen', suit: 'Spade')).to be_truthy
  end

  it '#always' do
    str = 'Tee'
    expect(R.always(str).call).to be(str)
  end

  it '#and' do
    expect(R.and(true, true)).to be_truthy
    expect(R.and(true, false)).to be_falsey
    expect(R.and(false, true)).to be_falsey
    expect(R.and(false, false)).to be_falsey
  end

  it '#any' do
    # var lessThan0 = R.flip(R.lt)(0);
    # var lessThan2 = R.flip(R.lt)(2);

    greater_than0 = R.lt(1)
    greater_than2 = R.lt(2)

    expect(R.any(greater_than0)[[0, 1]]).to be_falsey
    expect(R.any(greater_than2)[[2, 3]]).to be_truthy
  end

  it '#any_pass' do
    is_club = R.prop_eq(:suit, 'club')
    is_spade = R.prop_eq(:suit, 'spade')
    is_black_card = R.any_pass(is_club, is_spade)

    expect(is_black_card.call(rank: '10', suit: 'club')).to be_truthy
    expect(is_black_card.call(rank: 'Q', suit: 'spade')).to be_truthy
    expect(is_black_card.call(rank: 'Q', suit: 'diamond')).to be_falsey
  end

  # it '#flip' do
  #   merge_tree = -> (a, b, c) { [a, b, c] }
  #
  #   expect(merge_tree.(1, 2, 3)).to eq([1, 2, 3])
  #   expect(R.flip(merge_tree).(1, 2, 3)).to eq([2, 1, 3])
  # end

  # FEATURE --------------------------------------------------------------------

  it '#lt' do
    expect(R.lt(2).call(1)).to be_falsey
    expect(R.lt(2).call(2)).to be_falsey
    expect(R.lt(2).call(3)).to be_truthy
    expect(R.lt('a').call('z')).to be_truthy
    expect(R.lt('z').call('a')).to be_falsey
  end
end

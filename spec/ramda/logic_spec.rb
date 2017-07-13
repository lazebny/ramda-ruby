require 'spec_helper'

describe Ramda::Logic do
  let(:r) { Ramda }

  context '#all_pass' do
    it 'from docs' do
      is_queen = R.prop_eq(:rank, 'Queen')
      is_spade = R.prop_eq(:suit, 'Spade')

      is_queen_of_spades = r.all_pass([is_queen, is_spade])

      expect(is_queen_of_spades.call(rank: 'King', suit: 'Spade')).to be_falsey
      expect(is_queen_of_spades.call(rank: 'Queen', suit: 'Spade')).to be_truthy
    end
  end

  context '#and' do
    it 'from docs' do
      expect(r.and(true, true)).to be_truthy
      expect(r.and(true, false)).to be_falsey
      expect(r.and(false, true)).to be_falsey
      expect(r.and(false, false)).to be_falsey
    end
  end

  context '#any_pass' do
    it 'from docs' do
      is_club = R.prop_eq(:suit, 'club')
      is_spade = R.prop_eq(:suit, 'spade')
      is_black_card = r.any_pass([is_club, is_spade])

      expect(is_black_card.call(rank: '10', suit: 'club')).to be_truthy
      expect(is_black_card.call(rank: 'Q', suit: 'spade')).to be_truthy
      expect(is_black_card.call(rank: 'Q', suit: 'diamond')).to be_falsey
    end
  end

  context '#both' do
    it 'from docs' do
      gt10 = R.gt(R.__, 10)
      lt20 = R.lt(R.__, 20)
      f = R.both(gt10, lt20)
      expect(f.call(15)).to be_truthy
      expect(f.call(30)).to be_falsey
    end

    it 'accepts fantasy-land applicative functors' do
      some = Maybe::Some
      none = Maybe::None
      expect(R.both(some.new(true), some.new(true))). to eq(some.new(true))
      expect(R.both(some.new(true), some.new(false))).to eq(some.new(false))
      expect(R.both(some.new(true), none.new)).to eq(none.new)
      expect(R.both(none.new, some.new(false))).to eq(none.new)
      expect(R.both(none.new, none.new)).to eq(none.new)
    end
  end

  context '#complement' do
    it 'from docs' do
      is_not_nil = r.complement(R.is_nil)
      expect(R.is_nil(nil)).to be_truthy
      expect(is_not_nil.call(nil)).to be_falsey
      expect(R.is_nil(7)).to be_falsey
      expect(is_not_nil.call(7)).to be_truthy
    end

    it 'accepts fantasy-land functors' do
      some = Maybe::Some
      none = Maybe::None

      expect(R.complement(some.new(true))).to eq(some.new(false))
      expect(R.complement(some.new(false))).to eq(some.new(true))
      expect(R.complement(none.new)).to eq(none.new)
    end
  end

  context '#cond' do
    it 'from docs' do
      fn = R.cond([
                    [R.equals(0), R.always('water freezes at 0 C')],
                    [R.equals(100), R.always('water boils at 100 C')],
                    [R.T, ->(temp) { "nothing special happens at #{temp} C" }]
                  ])
      expect(fn.call(0)).to eq('water freezes at 0 C')
      expect(fn.call(50)).to eq('nothing special happens at 50 C')
      expect(fn.call(100)).to eq('water boils at 100 C')
    end
  end

  context '#default_to' do
    it 'from docs' do
      default_to42 = R.default_to(42)

      expect(default_to42.call(nil)).to eq(42)
      expect(default_to42.call('Ramda')).to eq('Ramda')
    end
  end

  context '#either' do
    it 'from docs' do
      gt10 = ->(x) { x > 10 }
      even = :even?.to_proc
      f = R.either(gt10, even)
      expect(f.call(101)).to be_truthy
      expect(f.call(8)).to be_truthy
    end

    it 'accepts fantasy-land applicative functors' do
      some = Maybe::Some
      none = Maybe::None
      expect(R.either(some.new(true), some.new(true))).to eq(some.new(true))
      expect(R.either(some.new(true), some.new(false))).to eq(some.new(true))
      expect(R.either(some.new(false), some.new(false))).to eq(some.new(false))
      expect(R.either(some.new(true), none.new)).to eq(none.new)
      expect(R.either(none.new, some.new(false))).to eq(none.new)
      expect(R.either(none.new, none.new)).to eq(none.new)
    end
  end

  context '#if_else' do
    it 'from docs' do
      inc_count = R.if_else(
        R.prop(:count),
        R.prop(:count),
        R.identity
      )
      expect(inc_count.call({})).to eq({})
      expect(inc_count.call(count: 1)).to eq(1)
    end
  end

  context '#is_empty' do
    it 'from docs' do
      expect(r.is_empty([1, 2, 3])).to be_falsey
      expect(r.is_empty([])).to be_truthy
      expect(r.is_empty('')).to be_truthy
      expect(r.is_empty(nil)).to be_falsey
      expect(r.is_empty({})).to be_truthy
      expect(r.is_empty(0)).to be_falsey
      expect(r.is_empty(length: 0)).to be_falsey
    end
  end

  context '#not' do
    it 'from docs' do
      expect(r.not(true)).to be_falsey
      expect(r.not(false)).to be_truthy
      expect(r.not(0)).to be_falsey
      expect(r.not(1)).to be_falsey
    end
  end

  context '#or' do
    it 'from docs' do
      expect(r.or(true, true)).to be_truthy
      expect(r.or(true, false)).to be_truthy
      expect(r.or(false, true)).to be_truthy
      expect(r.or(false, false)).to be_falsey
    end
  end
end

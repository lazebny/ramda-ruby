require 'spec_helper'

describe Ramda::Relation do
  let(:r) { described_class }

  context '#equals' do
    it 'from docs' do
      expect(r.equals(1, 1)).to be_truthy
      expect(r.equals(1, '1')).to be_falsey
      expect(r.equals([1, 2, 3], [1, 2, 3])).to be_truthy
      expect(r.equals({}, {})).to be_truthy
    end

    it 'is curried' do
      expect(r.equals(1).call(1)).to be_truthy
    end
  end

  context '#count_by' do
    it 'from docs' do
      letters = ['a', 'b', 'A', 'a', 'B', 'c']
      expect(r.count_by(R.to_lower).call(letters)).to eq('a' => 3, 'b' => 2, 'c' => 1)
    end
  end

  context '#difference' do
    it 'from docs' do
      expect(r.difference([1, 2, 3, 4], [7, 6, 5, 4, 3])).to eq([1, 2])
      expect(r.difference([7, 6, 5, 4, 3], [1, 2, 3, 4])).to eq([7, 6, 5])
      expect(r.difference([{ a: 1 }, { b: 2 }], [{ a: 1 }, { c: 3 }])).to eq([{ b: 2 }])
    end
  end

  context '#difference_with' do
    it 'from docs' do
      cmp = ->(x, y) { x.fetch(:a) == y.fetch(:a) }
      l1 = [{ a: 1, b: 1 }, { a: 2, b: 1 }, { a: 3, b: 1 }]
      l2 = [{ a: 3, b: 2 }, { a: 4, b: 2 }, { a: 5, b: 2 }]

      expect(r.difference_with(cmp, l1, l2)).to eq([{ a: 1, b: 1 }, { a: 2, b: 1 }])
    end
  end

  context '#eq_by' do
    it 'from docs' do
      size_fn = -> (x) { x.size }
      expect(r.eq_by(size_fn, ['abc'], [100])).to be_truthy
      expect(r.eq_by(size_fn, [1, 2], [1])).to be_falsey
    end
  end

  context '#gt' do
    it 'from docs' do
      expect(r.gt(2, 1)).to be_truthy
      expect(r.gt(2, 2)).to be_falsey
      expect(r.gt(2, 3)).to be_falsey
      expect(r.gt('a', 'z')).to be_falsey
      expect(r.gt('z', 'a')).to be_truthy
    end

    it 'is curried' do
      expect(r.gt(2).call(1)).to be_truthy
    end
  end

  context '#gte' do
    it 'from docs' do
      expect(r.gte(2, 1)).to be_truthy
      expect(r.gte(2, 2)).to be_truthy
      expect(r.gte(2, 3)).to be_falsey
      expect(r.gte('a', 'z')).to be_falsey
      expect(r.gte('z', 'a')).to be_truthy
    end

    it 'is curried' do
      expect(r.gte(2).call(1)).to be_truthy
    end
  end

  context '#intersection' do
    it 'from docs' do
      expect(r.intersection([1, 2, 3, 4], [7, 6, 5, 4, 3])).to eq([3, 4])
    end

    it 'is curried' do
      expect(r.intersection([1, 2, 3, 4]).call([7, 6, 5, 4, 3])).to match_array([3, 4])
    end
  end

  context '#lt' do
    it 'from docs' do
      expect(r.lt(2, 1)).to be_falsey
      expect(r.lt(2, 2)).to be_falsey
      expect(r.lt(2, 3)).to be_truthy
      expect(r.lt('a', 'z')).to be_truthy
      expect(r.lt('z', 'a')).to be_falsey
    end

    it 'is curried' do
      expect(r.lt(2).call(1)).to be_falsey
    end
  end

  context '#lte' do
    it 'from docs' do
      expect(r.lte(2, 1)).to be_falsey
      expect(r.lte(2, 2)).to be_truthy
      expect(r.lte(2, 3)).to be_truthy
      expect(r.lte('a', 'z')).to be_truthy
      expect(r.lte('z', 'a')).to be_falsey
    end

    it 'is curried' do
      expect(r.lt(2).call(1)).to be_falsey
    end
  end

  context '#max' do
    it 'from docs' do
      expect(r.max(789, 123)).to be(789)
      expect(r.max('a', 'b')).to eq('b')
    end
  end

  context '#min' do
    it 'from docs' do
      expect(r.min(789, 123)).to be(123)
      expect(r.min('a', 'b')).to eq('a')
    end
  end

  context '#prop_eq' do
    it 'from docs' do
      abby = { name: 'Abby', age: 7, hair: 'blond' }
      fred = { name: 'Fred', age: 12, hair: 'brown' }
      rusty = { name: 'Rusty', age: 10, hair: 'brown' }
      alois = { name: 'Alois', age: 15, disposition: 'surly' }
      kids = [abby, fred, rusty, alois]
      has_brown_hair = r.prop_eq(:hair, 'brown')
      expect(R.filter(has_brown_hair, kids)).to eq([fred, rusty])
    end
  end

  context '#sort_by' do
    it 'from docs 1' do
      sort_by_first_item = r.sort_by(R.prop(0))
      pairs = [[-1, 1], [-2, 2], [-3, 3]]
      expect(sort_by_first_item.call(pairs)).to eq([[-3, 3], [-2, 2], [-1, 1]])
    end

    it 'from docs 2' do
      alice = { name: 'ALICE', age: 101 }
      bob = { name: 'Bob', age: -10 }
      clara = { name: 'clara', age: 314.159 }
      people = [clara, bob, alice]
      sort_by_name_case_insensitive = r.sort_by(R.compose(R.to_lower, R.prop(:name)))
      expect(sort_by_name_case_insensitive.call(people)).to eq([alice, bob, clara])
    end
  end

  context '#union' do
    it 'from docs' do
      expect(r.union([1, 2, 3], [2, 3, 4])).to eq([1, 2, 3, 4])
    end
  end

  context '#union_with' do
    it 'from docs' do
      l1 = [{a: 1}, {a: 2}];
      l2 = [{a: 1}, {a: 4}];
      expect(r.union_with(R.prop(:a), l1, l2)).to eq([{a: 1}, {a: 2}, {a: 4}])
    end
  end
end

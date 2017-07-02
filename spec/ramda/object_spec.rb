require 'spec_helper'

describe Ramda::Object do
  let(:r) { Ramda }

  context '#assoc' do
    it 'from docs' do
      expect(r.assoc(:c, 3, a: 1, b: 2)).to eq(a: 1, b: 2, c: 3)
    end
  end

  context '#assoc_path' do
    it 'from docs' do
      expect(r.assoc_path([:a, :b, :c], 42, a: { b: { c: 0 } })).to eq(a: { b: { c: 42 } })
      expect(r.assoc_path([:a, :b, :c], 42, a: 5)).to eq(a: { b: { c: 42 } })
      expect(r.assoc_path([:a, :b, :c], 42, a: 5, d: 10)).to eq(a: { b: { c: 42 } }, d: 10)
    end

    it 'with object + array' do
      obj = { x: [{ y: 2, z: 3 }, { y: 4, z: 5 }] }
      expect(r.assoc_path([:x, 0, :y], 1, obj)).to eq(x: [{ y: 1, z: 3 }, { y: 4, z: 5 }])
    end

    it 'empty path replaces the the whole object' do
      expect(r.assoc_path([], 3, a: 1, b: 2)).to eq(3)
    end
  end

  context '#clone' do
    it 'from docs' do
      objects = [{}, {}, {}]
      objects_clone = r.clone(objects)
      expect(objects).not_to be(objects_clone)
      expect(objects[0]).not_to be(objects_clone[0])
    end

    it 'nested arrays' do
      obj = [1, [2, 2, [3, 3]]]

      cloned = r.clone(obj)
      cloned[1][2][0] = 100

      expect(cloned).not_to eq(obj)
      path = Ramda.path([1, 2])
      expect(path.call(obj)).to eq([3, 3])
      expect(path.call(cloned)).to eq([100, 3])
    end

    it 'nested objects' do
      obj = { a: { b: { c: 10 } } }

      cloned = r.clone(obj)
      cloned[:a][:b][:c] = 100

      expect(cloned).not_to eq(obj)

      path = Ramda.path([:a, :b])
      expect(path.call(obj)).to eq(c: 10)
      expect(path.call(cloned)).to eq(c: 100)
    end
  end

  context '#dissoc' do
    it 'from docs' do
      expect(r.dissoc(:b, a: 1, b: 2, c: 3)).to eq(a: 1, c: 3)
    end
  end

  context '#has' do
    it 'from docs' do
      has_name = r.has(:name)
      expect(has_name.call(name: 'alice')).to be_truthy
      expect(has_name.call(name: 'bob')).to be_truthy
      expect(has_name.call({})).to be_falsey
    end

    it 'with placeholder' do
      point = { x: 0, y: 0 }
      point_has = r.has(R.__, point)
      expect(point_has.call(:x)).to be_truthy
      expect(point_has.call(:y)).to be_truthy
      expect(point_has.call(:z)).to be_falsey
    end
  end

  context '#has_in' do
    it 'from docs' do
      square = Struct.new(:width, :area).new(2, 2)
      expect(r.has_in(:width, square)).to be_truthy
      expect(r.has_in(:area, square)).to be_truthy
      expect(r.has_in(:duration, square)).to be_falsey
    end
  end

  context '#eq_props' do
    it 'from docs' do
      o1 = { a: 1, b: 2, c: 3, d: 4 }
      o2 = { a: 10, b: 20, c: 3, d: 40 }

      expect(r.eq_props(:a, o1, o2)).to be_falsey
      expect(r.eq_props(:c, o1, o2)).to be_truthy
    end

    it 'curried' do
      o1 = { a: 1, b: 2, c: 3, d: 4 }
      o2 = { a: 10, b: 20, c: 3, d: 40 }

      expect(r.eq_props(:c).call(o1, o2)).to be_truthy
    end
  end

  context '#keys' do
    it 'from docs' do
      expect(r.keys(a: 1, b: 2, c: 3)).to eq([:a, :b, :c])
    end
  end

  xcontext '#keys_in' do
    it 'from docs' do
      obj = Class.new do |_x, _y|
        attr_reader :x
        attr_accessor :y
        attr_writer :z

        def test; end
      end.new

      expect(r.keys_in(obj)).to eq([:x, :y])
    end
  end

  context '#lens' do
    def x_lens
      r.lens(R.prop(:x), R.assoc(:x))
    end

    it 'with view' do
      expect(R.view(x_lens, x: 1, y: 2)).to eq(1)
    end

    it 'with set' do
      expect(R.set(x_lens, 4, x: 1, y: 2)).to eq(x: 4, y: 2)
    end

    it 'with over' do
      expect(R.over(x_lens, R.negate, x: 1, y: 2)).to eq(x: -1, y: 2)
    end
  end

  context '#lens_index' do
    it 'from docs' do
      head_lens = r.lens_index(0)

      expect(R.view(head_lens, ['a', 'b', 'c'])).to eq('a')
      expect(R.set(head_lens, 'x', ['a', 'b', 'c'])).to eq(['x', 'b', 'c'])
      expect(R.over(head_lens, R.to_upper, ['a', 'b', 'c'])).to eq(['A', 'b', 'c'])
    end
  end

  context '#lens_path' do
    it 'from docs' do
      x_head_y_lens = r.lens_path([:x, 0, :y])

      obj = { x: [{ y: 2, z: 3 }, { y: 4, z: 5 }] }

      expect(R.view(x_head_y_lens, obj)).to eq(2)
      expect(R.set(x_head_y_lens, 1, obj)).to eq(x: [{ y: 1, z: 3 }, { y: 4, z: 5 }])
      expect(R.over(x_head_y_lens, R.negate, obj)).to eq(x: [{ y: -2, z: 3 }, { y: 4, z: 5 }])

      expect(obj).to eq(x: [{ y: 2, z: 3 }, { y: 4, z: 5 }])
    end
  end

  context '#lens_prop' do
    it 'from docs' do
      x_lens = r.lens_prop(:x)

      expect(R.view(x_lens, x: 1, y: 2)).to eq(1)
      expect(R.set(x_lens, 4, x: 1, y: 2)).to eq(x: 4, y: 2)
      expect(R.over(x_lens, R.negate, x: 1, y: 2)).to eq(x: -1, y: 2)
    end
  end

  context 'view, over, and set' do
    let(:alice) do
      {
        name: 'Alice Jones',
        address: ['22 Walnut St', 'San Francisco', 'CA'],
        pets: { dog: 'joker', cat: 'batman' }
      }
    end
    let(:head_lens) { R.lens_index(0) }

    it 'may be applied to a lens created by `lens_path`' do
      dog_lens = R.lens_path([:pets, :dog])
      expect(r.view(dog_lens, alice)).to eq('joker')
    end

    it 'may be applied to a lens created by `lens_prop`' do
      name_lens = R.lens(R.prop(:name), R.assoc(:name))

      expect(r.view(name_lens, alice)).to eq('Alice Jones')

      expect(r.over(name_lens, R.to_upper, alice)).to eq(
        name: 'ALICE JONES',
        address: ['22 Walnut St', 'San Francisco', 'CA'],
        pets: { dog: 'joker', cat: 'batman' }
      )

      expect(r.set(name_lens, 'Alice Smith', alice)).to eq(
        name: 'Alice Smith',
        address: ['22 Walnut St', 'San Francisco', 'CA'],
        pets: { dog: 'joker', cat: 'batman' }
      )
    end

    it 'may be applied to a lens created by `lens_index`' do
      expect(R.view(head_lens, alice.fetch(:address))).to eq('22 Walnut St')

      expect(R.over(head_lens, R.to_upper, alice.fetch(:address)))
        .to eq(['22 WALNUT ST', 'San Francisco', 'CA'])

      expect(R.set(head_lens, '52 Crane Ave', alice.fetch(:address)))
        .to eq(['52 Crane Ave', 'San Francisco', 'CA'])
    end

    xit 'may be applied to composed lenses' do
      address_lens = R.lens_prop(:address)
      street_lens = R.compose(address_lens, head_lens)
      dog_lens = R.compose(R.lens_path([:pets]), R.lens_path([:dog]))

      expect(R.view(dog_lens, alice)).to eq(R.view(R.lens_path([:pets, :dog]), alice))

      expect(R.view(street_lens, alice)).to eq('22 Walnut St')

      expect(R.over(street_lens, R.to_upper, alice)).to eq(
        name: 'Alice Jones',
        address: ['22 WALNUT ST', 'San Francisco', 'CA'],
        pets: { dog: 'joker', cat: 'batman' }
      )

      expect(R.set(street_lens, '52 Crane Ave', alice)).to eq(
        name: 'Alice Jones',
        address: ['52 Crane Ave', 'San Francisco', 'CA'],
        pets: { dog: 'joker', cat: 'batman' }
      )
    end
  end

  context '#merge' do
    it 'from docs' do
      expect(r.merge({ name: 'fred', age: 10 }, age: 40))
        .to eq(name: 'fred', age: 40)
    end

    it 'is curried' do
      expect(r.merge(a: 1).call(b: 2)).to eq(a: 1, b: 2)
    end

    it 'supports placeholder' do
      reset_to_default = R.merge(R.__, x: 0)
      expect(reset_to_default.call(x: 5, y: 2)).to eq(x: 0, y: 2)
    end
  end

  context '#omit' do
    it 'from docs' do
      expect(r.omit([:a, :d], a: 1, b: 2, c: 3, d: 4)).to eq(b: 2, c: 3)
    end
  end

  context '#path' do
    it 'from docs' do
      expect(r.path([:a, :b], a: { b: 2 })).to eq(2)
      expect(r.path([:a, :b], c: { b: 2 })).to eq(nil)
    end

    it 'with object + array' do
      obj = { x: [{ y: 2, z: 3 }, { y: 4, z: 5 }] }
      expect(r.path([:x, 0, :y], obj)).to eq(2)
    end
  end

  context '#pick' do
    it 'from docs' do
      expect(r.pick([:a, :d], a: 1, b: 2, c: 3, d: 4)).to eq(a: 1, d: 4)
      expect(r.pick([:a, :e, :f], a: 1, b: 2, c: 3, d: 4)).to eq(a: 1)
    end
  end

  context '#pick_all' do
    it 'from docs' do
      expect(r.pick_all([:a, :d], a: 1, b: 2, c: 3, d: 4)).to eq(a: 1, d: 4)
      expect(r.pick_all([:a, :e, :f], a: 1, b: 2, c: 3, d: 4)).to eq(a: 1, e: nil, f: nil)
    end
  end

  context '#pick_by' do
    it 'from docs' do
      is_upper_case = ->(_, key) { key.upcase == key }
      expect(r.pick_by(is_upper_case, 'a' => 1, 'b' => 2, 'A' => 3, 'B' => 4))
        .to eq('A' => 3, 'B' => 4)
    end
  end

  context '#project' do
    it 'from docs' do
      abby = { name: 'Abby', age: 7, hair: 'blond', grade: 2 }
      fred = { name: 'Fred', age: 12, hair: 'brown', grade: 7 }
      kids = [abby, fred]

      expect(r.project([:name, :grade], kids))
        .to eq([{ name: 'Abby', grade: 2 }, { name: 'Fred', grade: 7 }])
    end
  end

  context '#prop' do
    it 'from docs' do
      expect(r.prop(:x, x: 100)).to be(100)
      expect(r.prop(:x, {})).to be_nil
    end
  end

  context '#prop_or' do
    it 'from docs' do
      alice = {
        name: 'ALICE',
        age: 101
      }
      favorite = R.prop('favoriteLibrary')
      favorite_with_default = r.prop_or('Ramda', 'favoriteLibrary')

      expect(favorite.call(alice)).to eq(nil)
      expect(favorite_with_default.call(alice)).to eq('Ramda')
    end
  end

  context '#props' do
    it 'from docs' do
      expect(r.props([:x, :y], x: 1, y: 2)).to eq([1, 2])
      expect(r.props([:c, :a, :b], b: 2, a: 1)).to eq([nil, 1, 2])

      full_name = R.compose(R.join(' '), r.props([:first, :last]))
      expect(full_name.call(last: 'Bullet-Tooth', age: 33, first: 'Tony'))
        .to eq('Tony Bullet-Tooth')
    end
  end

  context '#to_pairs' do
    it 'from docs' do
      expect(r.to_pairs(a: 1, b: 2, c: 3)).to eq([[:a, 1], [:b, 2], [:c, 3]])
    end
  end

  xcontext '#to_pairs_in' do
    it 'from docs' do
      # var F = function() { this.x = 'X'; };
      # F.prototype.y = 'Y';
      # var f = new F();
      # R.toPairsIn(f); //=> [['x','X'], ['y','Y']]
    end
  end

  context '#values' do
    it 'from docs' do
      expect(r.values(a: 1, b: 2, c: 3)).to eq([1, 2, 3])
    end
  end

  xcontext '#values_in' do
    it 'from docs' do
      obj = Class.new do |_x, _y|
        def initialize(x)
          @x = x
        end

        attr_reader :x
        attr_accessor :y
        attr_writer :z

        def test; end
      end.new(100)
      obj.y = 1000

      expect(r.values_in(obj)).to eq([100, 1000])
    end
  end

  context '#where' do
    it 'from docs' do
      pred = R.where(a: R.equals('foo'),
                     b: R.complement(R.equals('bar')),
                     x: R.gt(R.__, 10),
                     y: R.lt(R.__, 20))

      expect(pred.call(a: 'foo', b: 'xxx', x: 11, y: 19)).to be_truthy
      expect(pred.call(a: 'xxx', b: 'xxx', x: 11, y: 19)).to be_falsey
      expect(pred.call(a: 'foo', b: 'bar', x: 11, y: 19)).to be_falsey
      expect(pred.call(a: 'foo', b: 'xxx', x: 10, y: 19)).to be_falsey
      expect(pred.call(a: 'foo', b: 'xxx', x: 11, y: 20)).to be_falsey
    end
  end
end

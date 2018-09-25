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

  context '#dissoc_path' do
    it 'makes a shallow clone of an object, omitting only what is necessary for the path' do
      obj1 = {
        a: { b: 1, c: 2, d: { e: 3 } },
        f: [{ g: 4 }, { h: 5, i: 6, j: { k: 7, l: 8 } }],
        m: 9
      }
      obj2 = R.dissoc_path([:f, 1, :i], obj1)

      expect(obj2).to eq(a: { b: 1, c: 2, d: { e: 3 } },
                         f: [{ g: 4 }, { h: 5, j: { k: 7, l: 8 } }],
                         m: 9)
      expect(obj2[:a]).to be(obj1[:a])
      expect(obj2[:m]).to be(obj1[:m])
      expect(obj2[:f][0]).to be(obj1[:f][0])
      expect(obj2[:f][1][:h]).to be(obj1[:f][1][:h])
      expect(obj2[:f][1][:j]).to be(obj1[:f][1][:j])
    end

    it 'does not try to omit inner properties that do not exist' do
      obj1 = { a: 1, b: { c: 2, d: 3 }, e: 4, f: 5 }
      obj2 = R.dissoc_path([:x, 0, :z], obj1)

      expect(obj2).to eq(a: 1, b: { c: 2, d: 3 }, e: 4, f: 5)

      expect(obj2[:a]).to be(obj1[:a])
      expect(obj2[:b]).to be(obj1[:b])
      expect(obj2[:f]).to be(obj1[:f])
    end

    it 'leaves an empty object when all properties omitted' do
      obj1 = { a: 1, b: { c: 2 }, d: 3 }
      obj2 = R.dissoc_path([:b, :c], obj1)
      expect(obj2).to eq(a: 1, b: {}, d: 3)
    end

    it 'leaves an empty array when all indexes are omitted' do
      obj1 = { a: 1, b: [2], d: 3 }
      obj2 = R.dissoc_path([:b, 0], obj1)
      expect(obj2).to eq(a: 1, b: [], d: 3)
    end

    it 'accepts empty path' do
      expect(R.dissoc_path([], a: 1, b: 2)).to eq(a: 1, b: 2)
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

  context '#evolve' do
    it 'from docs' do
      tomato = {
        firstName: '  Tomato ',
        data: {
          elapsed: 100,
          remaining: 1400
        },
        id: 123
      }

      transformations = {
        firstName: R.trim,
        lastName: R.trim, # Will not get invoked.
        data: {
          elapsed: R.add(1),
          remaining: R.add(-1)
        }
      }

      expect(R.evolve(transformations, tomato))
        .to eq(firstName: 'Tomato', data: { elapsed: 101, remaining: 1399 }, id: 123)
    end
  end

  context '#invert' do
    it 'from docs' do
      race_results_by_first_name = {
        first: 'alice',
        second: 'jake',
        third: 'alice'
      }
      expect(R.invert(race_results_by_first_name))
        .to eq('alice' => [:first, :third], 'jake' => [:second])
    end

    it 'returns an empty object when applied to a primitive' do
      expect(R.invert(42)).to eq({})
      expect(R.invert('abc')).to eq({})
      expect(R.invert(nil)).to eq({})
    end

    it "returns the input's values as keys, and keys as values of an array" do
      expect(R.invert([:a, :b, :c])).to eq(a: [0], b: [1], c: [2])
      expect(R.invert(x: 'a', y: 'b', z: 'c')).to eq('a' => [:x], 'b' => [:y], 'c' => [:z])
    end
  end

  context '#invert_obj' do
    it 'from docs' do
      race_results = {
        first: 'alice',
        second: 'jake',
        third: 'alice'
      }
      expect(R.invert_obj(race_results)).to eq('alice' => :third, 'jake' => :second)

      race_results = ['alice', 'jake', 'alice']
      expect(R.invert_obj(race_results)).to eq('alice' => 2, 'jake' => 1)
    end

    it 'returns an empty object when applied to a primitive' do
      expect(R.invert(42)).to eq({})
      expect(R.invert('abc')).to eq({})
      expect(R.invert(nil)).to eq({})
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

  context '#map_obj_indexed' do
    def square_vowels(x, key, *)
      vowels = [:a, :e, :i, :o, :u]
      R.contains(key, vowels) ? x * x : x
    end

    it'works just like a normal mapObj' do
      times2 = ->(x, *) { x * 2 }

      expect(R.map_obj_indexed(times2, a: 1, b: 2, c: 3, d: 4))
        .to eq(a: 2, b: 4, c: 6, d: 8)
    end

    it 'passes the index as a second parameter to the callback' do
      add_indexed = ->(x, key, *) { [x, key].join }
      expect(R.map_obj_indexed(add_indexed, a: 8, b: 6, c: 7, d: 5, e: 3, f: 0, g: 9))
        .to eq(a: '8a', b: '6b', c: '7c', d: '5d', e: '3e', f: '0f', g: '9g')
    end

    it 'passes the entire list as a third parameter to the callback' do
      expect(R.map_obj_indexed(method(:square_vowels), a: 8, b: 6, c: 7, d: 5, e: 3, f: 0, g: 9))
        .to eq(a: 64, b: 6, c: 7, d: 5, e: 9, f: 0, g: 9)
    end

    it 'is curried' do
      make_square_vowels = R.map_obj_indexed(method(:square_vowels))
      expect(make_square_vowels.call(a: 8, b: 6, c: 7, d: 5, e: 3, f: 0, g: 9))
        .to eq(a: 64, b: 6, c: 7, d: 5, e: 9, f: 0, g: 9)
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

  context '#where_eq' do
    it 'from docs' do
      pred = R.where_eq(a: 1, b: 2)

      expect(pred.call(a: 1)).to be_falsey
      expect(pred.call(a: 1, b: 2)).to be_truthy
      expect(pred.call(a: 1, b: 2, c: 3)).to be_truthy
      expect(pred.call(a: 1, b: 1)).to be_falsey
    end

    it 'if hash includes nil value' do
      pred = R.where_eq(b: nil)

      expect(pred.call(a: 1)).to be_falsey
      expect(pred.call(a: 1, b: nil)).to be_truthy
      expect(pred.call(a: 1, b: nil, c: 3)).to be_truthy
      expect(pred.call(a: 1, b: 1)).to be_falsey
    end
  end
end

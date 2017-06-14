require 'spec_helper'

describe Ramda::Object do
  let(:r) { described_class }

  context '#clone' do
    it 'from docs' do
      objects = [{}, {}, {}]
      objects_clone = r.clone(objects)
      expect(objects).not_to be(objects_clone)
      expect(objects[0]).not_to be(objects_clone[0])
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
      expect(r.keys(a: 1, b: 2, c: 3)).to eq(%i[a b c])
    end
  end

  context '#merge' do
    it 'from docs' do
      expect(r.merge({ name: 'fred', age: 10 }, age: 40))
        .to eq(name: 'fred', age: 40)
    end

    xit 'curried' do
      # var resetToDefault = R.merge(R.__, {x: 0});
      # resetToDefault({x: 5, y: 2}); //=> {x: 0, y: 2}
    end
  end

  context '#omit' do
    it 'from docs' do
      expect(r.omit(%i[a d], a: 1, b: 2, c: 3, d: 4)).to eq(b: 2, c: 3)
    end
  end

  context '#pick' do
    it 'from docs' do
      expect(r.pick(%i[a d], a: 1, b: 2, c: 3, d: 4)).to eq(a: 1, d: 4)
      expect(r.pick(%i[a e f], a: 1, b: 2, c: 3, d: 4)).to eq(a: 1)
    end
  end

  context '#pick_all' do
    it 'from docs' do
      expect(r.pick_all(%i[a d], a: 1, b: 2, c: 3, d: 4)).to eq(a: 1, d: 4)
      expect(r.pick_all(%i[a e f], a: 1, b: 2, c: 3, d: 4)).to eq(a: 1, e: nil, f: nil)
    end
  end

  context '#project' do
    it 'from docs' do
      abby = { name: 'Abby', age: 7, hair: 'blond', grade: 2 }
      fred = { name: 'Fred', age: 12, hair: 'brown', grade: 7 }
      kids = [abby, fred]

      expect(r.project(%i[name grade], kids))
        .to eq([{ name: 'Abby', grade: 2 }, { name: 'Fred', grade: 7 }])
    end
  end

  context '#prop' do
    it 'from docs' do
      expect(r.prop(:x, x: 100)).to be(100)
      expect(r.prop(:x, {})).to be_nil
    end
  end

  context '#props' do
    it 'from docs' do
      expect(r.props(%i[x y], x: 1, y: 2)).to eq([1, 2])
      expect(r.props(%i[c a b], b: 2, a: 1)).to eq([nil, 1, 2])

      full_name = R.compose(R.join(' '), r.props(%i[first last]))
      expect(full_name.call(last: 'Bullet-Tooth', age: 33, first: 'Tony'))
        .to eq('Tony Bullet-Tooth')
    end
  end
end

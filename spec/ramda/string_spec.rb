require 'spec_helper'

describe Ramda::String do
  let(:r) { Ramda }

  context '#match' do
    it 'from docs' do
      expect(r.match(/([a-z]a)/, 'bananas')).to eq('ba')
      expect(r.match(/a/, 'b')).to eq(nil)
      expect { r.match(/a/, nil) }.to raise_error(ArgumentError)
    end
  end

  context '#replace' do
    it 'from docs' do
      expect(r.replace('foo', 'bar', 'test foo foo foo')).to eq('test bar bar bar')
      expect(r.replace(/foo/, 'bar', 'test foo foo foo')).to eq('test bar bar bar')
    end
  end

  context '#split' do
    it 'from docs' do
      path_components = r.split('/')

      expect(R.tail(path_components.call('/usr/local/bin/node')))
        .to eq(['usr', 'local', 'bin', 'node'])

      expect(r.split('.', 'a.b.c.xyz.d')).to eq(['a', 'b', 'c', 'xyz', 'd'])
    end
  end

  context '#to_upper' do
    it 'from docs' do
      expect(r.to_upper('abc')).to eq('ABC')
    end

    it 'curried' do
      expect(r.to_upper.call('abc')).to eq('ABC')
    end
  end

  context '#to_lower' do
    it 'from docs' do
      expect(r.to_lower('XYZ')).to eq('xyz')
    end

    it 'curried' do
      expect(r.to_lower.call('XYZ')).to eq('xyz')
    end
  end

  context '#trim' do
    it 'from docs' do
      expect(r.trim('   xyz  ')).to eq('xyz')
      expect(R.map(r.trim, R.split(',', 'x, y, z'))).to eq(['x', 'y', 'z'])
    end
  end
end

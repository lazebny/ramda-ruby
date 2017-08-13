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

  context '#test' do
    it 'from docs' do
      expect(R.test(/^x/, 'xyz')).to be_truthy
      expect(R.test(/^y/, 'xyz')).to be_falsey
    end
  end

  context '#to_string' do
    it 'returns the string representation of null' do
      expect(R.to_string(nil)).to eq('nil')
    end

    it 'returns the string representation of a Boolean primitive' do
      expect(R.to_string(true)).to eq('true')
      expect(R.to_string(false)).to eq('false')
    end

    it 'returns the string representation of a number primitive' do
      expect(R.to_string(0)).to eq('0')
      expect(R.to_string(1.23)).to eq('1.23')
      expect(R.to_string(-1.23)).to eq('-1.23')
    end

    it 'returns the string representation of a string primitive' do
      expect(R.to_string('abc')).to eq('"abc"')
      expect(R.to_string('x "y" z')).to eq('"x \\"y\\" z"')
      expect(R.to_string("' '")).to eq('"\' \'"')
      expect(R.to_string('" "')).to eq('"\\" \\""')
      expect(R.to_string('\b \b')).to eq('"\\\\b \\\\b"')
      expect(R.to_string('\f \f')).to eq('"\\\\f \\\\f"')
      expect(R.to_string('\n \n')).to eq('"\\\\n \\\\n"')
      expect(R.to_string('\r \r')).to eq('"\\\\r \\\\r"')
      expect(R.to_string('\t \t')).to eq('"\\\\t \\\\t"')
      expect(R.to_string('\v \v')).to eq('"\\\\v \\\\v"')
      expect(R.to_string('\0 \0')).to eq('"\\\\0 \\\\0"')
      expect(R.to_string('\\ \\')).to eq('"\\\\ \\\\"')
    end

    # it 'returns the string representation of a Date object' do
    #   expect(R.to_string(DateTime.parse('2001-02-03T04:05:06.000Z')))
    #     .to eq('DateTime.parse("2001-02-03T04:05:06.000Z")');
    #   expect(R.to_string(DateTime.parse('XXX'))).to eq('new Date(NaN)');
    # end

    it 'returns the string representation of a RegExp object' do
      expect(R.to_string(/(?:)/)).to eq('/(?:)/')
      expect(R.to_string(%r{/}i)).to eq('/\\//i')
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

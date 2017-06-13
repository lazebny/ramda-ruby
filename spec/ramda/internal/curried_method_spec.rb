require 'spec_helper'

describe Ramda::Internal::CurriedMethod do
  let(:instance) { Class.new { extend Ramda::Internal::CurriedMethod } }

  it '#curried_method' do
    instance.curried_method(:sample_method) do |a, b, c|
      a + b + c
    end

    expect(instance.sample_method.call(1).call(2).call(3)).to be(6)
    expect(instance.sample_method(1).call(2).call(3)).to be(6)
    expect(instance.sample_method(1, 2).call(3)).to be(6)
    expect(instance.sample_method(1, 2, 3)).to be(6)
  end
end

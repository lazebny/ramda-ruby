require 'spec_helper'

describe Ramda do
  it 'has a version number' do
    expect(Ramda::VERSION).not_to be nil
  end

  def self.test_ramda(method)
    it "Ramda.#{method}" do
      expect(described_class).to be_respond_to(method)
    end
  end

  test_ramda(:add)
  test_ramda(:all)
  test_ramda(:all_pass)
  test_ramda(:always)
  test_ramda(:and)
  test_ramda(:any)
  test_ramda(:any_pass)
  test_ramda(:append)
  test_ramda(:clone)
  test_ramda(:compose)
  test_ramda(:equals)
  test_ramda(:lt)
  test_ramda(:multiply)
  test_ramda(:prop_eq)
  test_ramda(:to_upper)
end

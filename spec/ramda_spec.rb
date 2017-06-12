require 'spec_helper'

describe Ramda do
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
  test_ramda(:concat)
  test_ramda(:contains)
  test_ramda(:count_by)
  test_ramda(:curry)
  test_ramda(:difference)
  test_ramda(:difference_with)
  test_ramda(:divide)
  test_ramda(:drop)
  test_ramda(:eq_props)
  test_ramda(:equals)
  test_ramda(:filter)
  test_ramda(:find)
  test_ramda(:flatten)
  test_ramda(:flip)
  test_ramda(:lt)
  test_ramda(:multiply)
  test_ramda(:prop_eq)
  test_ramda(:to_lower)
  test_ramda(:to_upper)
end

require 'spec_helper'

describe Ramda do
  it 'has a version number' do
    expect(Ramda::VERSION).not_to be nil
  end

  it 'respond to methods' do
    %i[
      always
      all
      any
      append
      all_pass
      and
      any_pass
      add
      equals
      lt
      prop_eq
    ].each do |method|
      expect(described_class).to be_respond_to(method)
    end
  end
end

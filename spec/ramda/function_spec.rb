require 'spec_helper'

describe Ramda::Function do
  let(:r) { described_class }

  context '#always' do
    it 'test' do
      str = 'Tee'
      expect(r.always(str).call).to be(str)
    end

    it 'is curried' do
      str = 'Tee'
      expect(r.always.call(str).call).to be(str)
    end
  end

  # it '#flip' do
  #   merge_tree = -> (a, b, c) { [a, b, c] }
  #
  #   expect(merge_tree.(1, 2, 3)).to eq([1, 2, 3])
  #   expect(R.flip(merge_tree).(1, 2, 3)).to eq([2, 1, 3])
  # end
end

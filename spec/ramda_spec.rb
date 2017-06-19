require 'spec_helper'

describe Ramda do
  def self.r(method)
    it "Ramda.#{method}" do
      expect(described_class).to be_respond_to(method)
    end
  end

  r(:add)
  r(:all)
  r(:all_pass)
  r(:always)
  r(:and)
  r(:any)
  r(:any_pass)
  r(:ap)
  r(:append)
  r(:assoc)
  r(:clone)
  r(:comparator)
  r(:complement)
  r(:compose)
  r(:concat)
  r(:construct)
  r(:contains)
  r(:converge)
  r(:count_by)
  r(:curry)
  r(:dec)
  r(:difference)
  r(:difference_with)
  r(:dissoc)
  r(:divide)
  r(:drop)
  r(:eq_by)
  r(:eq_props)
  r(:equals)
  r(:filter)
  r(:find)
  r(:find_index)
  r(:find_last)
  r(:find_last_index)
  r(:flatten)
  r(:flip)
  r(:for_each)
  r(:group_by)
  r(:gt)
  r(:gte)
  r(:head)
  r(:identity)
  r(:if_else)
  r(:inc)
  r(:index_of)
  r(:insert)
  r(:intersection)
  r(:invoker)
  r(:is_empty)
  r(:is_nil)
  r(:join)
  r(:juxt)
  r(:keys)
  # r(:keys_in)
  r(:last)
  r(:last_index_of)
  r(:length)
  r(:lt)
  r(:lte)
  r(:map)
  r(:match)
  r(:max)
  r(:memoize)
  r(:merge)
  r(:min)
  r(:modulo)
  r(:multiply)
  r(:n_ary)
  r(:not)
  r(:nth)
  r(:omit)
  r(:once)
  r(:or)
  r(:partition)
  r(:path)
  r(:pick)
  r(:pick_all)
  r(:pipe)
  r(:pluck)
  r(:prepend)
  r(:product)
  r(:project)
  r(:prop)
  r(:prop_eq)
  r(:props)
  r(:range)
  r(:reduce)
  r(:reduce_right)
  r(:reject)
  r(:remove)
  r(:repeat)
  r(:reverse)
  r(:slice)
  r(:sort)
  r(:sort_by)
  r(:split)
  r(:subtract)
  r(:sum)
  r(:tail)
  r(:take)
  r(:take_while)
  r(:tap)
  r(:times)
  r(:to_lower)
  r(:to_upper)
  r(:unary)
  r(:union)
  r(:union_with)
  r(:uniq)
  r(:uniq_with)
  r(:use_with)
  r(:values)
  # r(:values_in)
  r(:where)
  r(:xprod)
  r(:zip)
  r(:zip_with)
end

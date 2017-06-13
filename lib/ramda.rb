require 'ramda/version'
require 'ramda/function'
require 'ramda/list'
require 'ramda/logic'
require 'ramda/math'
require 'ramda/object'
require 'ramda/relation'
require 'ramda/string'

# Ramda library implementation, source: http://ramdajs.com/
module Ramda
  extend SingleForwardable

  def_delegators Ramda::Function,
                 :always,
                 :comparator,
                 :compose,
                 :construct,
                 :curry,
                 :flip,
                 :identity,
                 :invoker,
                 :memoize,
                 :once,
                 :pipe

  def_delegators Ramda::List,
                 :all,
                 :any,
                 :append,
                 :concat,
                 :contains,
                 :drop,
                 :filter,
                 :find,
                 :flatten,
                 :group_by,
                 :head,
                 :index_of,
                 :join,
                 :last_index_of,
                 :sort,
                 :map,
                 :nth,
                 :pluck

  def_delegators Ramda::Logic,
                 :all_pass,
                 :and,
                 :any_pass,
                 :is_empty,
                 :not,
                 :or

  def_delegators Ramda::Math,
                 :add,
                 :divide,
                 :multiply

  def_delegators Ramda::Object,
                 :clone,
                 :eq_props,
                 :keys,
                 :merge,
                 :omit,
                 :pick,
                 :pick_all

  def_delegators Ramda::Relation,
                 :count_by,
                 :difference,
                 :difference_with,
                 :equals,
                 :gt,
                 :gte,
                 :intersection,
                 :lt,
                 :lte,
                 :max,
                 :min,
                 :prop_eq

  def_delegators Ramda::String,
                 :match,
                 :to_lower,
                 :to_upper
end

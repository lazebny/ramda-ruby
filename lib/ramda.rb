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
                 :invoker

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
                 :sort

  def_delegators Ramda::Logic,
                 :all_pass,
                 :and,
                 :any_pass,
                 :is_empty

  def_delegators Ramda::Math,
                 :add,
                 :divide,
                 :multiply

  def_delegators Ramda::Object,
                 :clone,
                 :eq_props,
                 :keys

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
                 :prop_eq

  def_delegators Ramda::String,
                 :to_lower,
                 :to_upper
end

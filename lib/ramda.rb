require 'forwardable'

require 'ramda/version'
require 'ramda/function'
require 'ramda/list'
require 'ramda/logic'
require 'ramda/math'
require 'ramda/object'
require 'ramda/relation'
require 'ramda/string'
require 'ramda/type'

# Ramda library implementation, source: http://ramdajs.com/
# rubocop:disable Metrics/ModuleLength
module Ramda
  extend SingleForwardable

  def_delegators Ramda::Function,
                 :always,
                 :comparator,
                 :compose,
                 :construct,
                 :converge,
                 :curry,
                 :flip,
                 :identity,
                 :invoker,
                 :memoize,
                 :n_ary,
                 :once,
                 :pipe,
                 :tap,
                 :use_with

  def_delegators Ramda::List,
                 :all,
                 :any,
                 :append,
                 :concat,
                 :contains,
                 :drop,
                 :filter,
                 :find,
                 :find_index,
                 :find_last,
                 :find_last_index,
                 :flatten,
                 :for_each,
                 :group_by,
                 :head,
                 :index_of,
                 :join,
                 :last_index_of,
                 :length,
                 :sort,
                 :map,
                 :nth,
                 :pluck,
                 :prepend,
                 :range,
                 :reduce,
                 :reduce_right,
                 :reject,
                 :repeat,
                 :reverse,
                 :tail,
                 :take,
                 :take_while,
                 :uniq,
                 :xprod,
                 :zip,
                 :zip_with

  def_delegators Ramda::Logic,
                 :all_pass,
                 :and,
                 :any_pass,
                 # :complement,
                 :if_else,
                 :is_empty,
                 :not,
                 :or

  def_delegators Ramda::Math,
                 :add,
                 :dec,
                 :divide,
                 :inc,
                 :modulo,
                 :multiply,
                 :product,
                 :subtract,
                 :sum

  def_delegators Ramda::Object,
                 :assoc,
                 :clone,
                 :dissoc,
                 :eq_props,
                 :keys,
                 :merge,
                 :omit,
                 :pick,
                 :pick_all,
                 :project,
                 :prop,
                 :props,
                 :values,
                 :where

  def_delegators Ramda::Relation,
                 :count_by,
                 :difference,
                 :difference_with,
                 :eq_by,
                 :equals,
                 :gt,
                 :gte,
                 :intersection,
                 :lt,
                 :lte,
                 :max,
                 :min,
                 :prop_eq,
                 :sort_by,
                 :union,
                 :union_with

  def_delegators Ramda::String,
                 :match,
                 :split,
                 :to_lower,
                 :to_upper

  def_delegators Ramda::Type,
                 :is_nil
end

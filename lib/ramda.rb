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
                 :ap,
                 :binary,
                 :comparator,
                 :compose,
                 :construct,
                 :construct_n,
                 :converge,
                 :curry,
                 :curry_n,
                 :empty,
                 :flip,
                 :identity,
                 :invoker,
                 :juxt,
                 :memoize,
                 :n_ary,
                 :of,
                 :once,
                 :pipe,
                 :tap,
                 :unary,
                 :use_with

  def_delegators Ramda::List,
                 :all,
                 :any,
                 :append,
                 :chain,
                 :concat,
                 :contains,
                 :drop,
                 :filter,
                 :from_pairs,
                 :find,
                 :find_index,
                 :find_last,
                 :find_last_index,
                 :flatten,
                 :for_each,
                 :group_by,
                 :head,
                 :index_of,
                 :insert,
                 :join,
                 :last,
                 :last_index_of,
                 :length,
                 :slice,
                 :sort,
                 :map,
                 :nth,
                 :partition,
                 :pluck,
                 :prepend,
                 :range,
                 :reduce,
                 :reduce_right,
                 :reject,
                 :remove,
                 :repeat,
                 :reverse,
                 :tail,
                 :take,
                 :take_while,
                 :times,
                 :uniq,
                 :uniq_with,
                 :unnest,
                 :xprod,
                 :zip,
                 :zip_obj,
                 :zip_with

  def_delegators Ramda::Logic,
                 :all_pass,
                 :and,
                 :any_pass,
                 :complement,
                 :if_else,
                 :is_empty,
                 :not,
                 :or

  def_delegators Ramda::Math,
                 :add,
                 :dec,
                 :divide,
                 :inc,
                 # :math_mod,
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
                 # :keys_in,
                 :merge,
                 :omit,
                 :path,
                 :pick,
                 :pick_all,
                 :project,
                 :prop,
                 :props,
                 :to_pairs,
                 # :to_pairs_in,
                 :values,
                 # :values_in,
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
                 :replace,
                 :split,
                 :to_lower,
                 :to_upper

  def_delegators Ramda::Type,
                 :is,
                 :is_nil
end

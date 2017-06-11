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
                 :compose,
                 :curry

  def_delegators Ramda::List,
                 :all,
                 :any,
                 :append,
                 :concat,
                 :contains,
                 :drop

  def_delegators Ramda::Logic,
                 :all_pass,
                 :and,
                 :any_pass

  def_delegators Ramda::Math,
                 :add,
                 :divide,
                 :multiply

  def_delegators Ramda::Object,
                 :clone,
                 :eq_props

  def_delegators Ramda::Relation,
                 :equals,
                 :lt,
                 :prop_eq,
                 :count_by,
                 :difference,
                 :difference_with

  def_delegators Ramda::String,
                 :to_lower,
                 :to_upper
end

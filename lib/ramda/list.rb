require_relative 'internal/curried_method'
require_relative 'internal/dispatchable'
require_relative 'internal/transducers'

module Ramda
  # List functions
  # rubocop:disable Metrics/ModuleLength
  module List
    extend ::Ramda::Internal::CurriedMethod
    extend ::Ramda::Internal::Dispatchable

    Trans = ::Ramda::Internal::Transducers

    # Applies a function to the value at the given index of an array,
    # returning a new copy of the array with the element at the given
    # index replaced with the result of the function application.
    #
    # (a -> a) -> Number -> [a] -> [a]
    #
    curried_method(:adjust) do |f, idx, xs|
      xs.dup.tap { |a| a[idx] = f.call(a[idx]) }
    end

    # Returns true if all elements of the list match the predicate,
    # false if there are any that don't.
    #
    # Dispatches to the all method of the second argument, if present.
    #
    # Acts as a transducer if a transformer is given in list position.
    #
    # (a -> Boolean) -> [a] -> Boolean
    #
    curried(:all, &dispatchable(:all, ::Array) do |f, xs|
      xs.all?(&f)
    end)

    # Returns true if at least one of elements of the list match the predicate,
    # false otherwise.
    #
    # Dispatches to the any method of the second argument, if present.
    #
    # Acts as a transducer if a transformer is given in list position.
    #
    # (a -> Boolean) -> [a] -> Boolean
    #
    curried(:any, &dispatchable(:any, ::Array) do |f, xs|
      xs.any?(&f)
    end)

    # Returns a new list, composed of n-tuples of consecutive elements.
    # If n is greater than the length of the list, an empty list is returned.
    #
    # Acts as a transducer if a transformer is given in list position.
    #
    # Number -> [a] -> [[a]]
    #
    curried_method(:aperture) do |n, xs|
      xs.each_cons(n).to_a
    end

    # Returns a new list containing the contents of the given list,
    # followed by the given element.
    #
    # a -> [a] -> [a]
    #
    curried_method(:append) do |x, xs|
      xs + [x]
    end

    # chain maps a function over a list and concatenates the results. chain is
    # also known as flatMap in some libraries
    #
    # Dispatches to the chain or bind method of the second argument, if present,
    # according to the FantasyLand Chain spec.
    #
    # Chain m => (a -> m b) -> m a -> m b
    #
    curried(:chain, &dispatchable([:chain, :bind, :'>'], ::Array) do |f, xs|
      xs.flat_map(&f)
    end)

    # Returns the result of concatenating the given lists or strings.
    #
    # Dispatches to the concat method of the first argument, if present.
    #
    # String -> String -> String
    # List -> List -> List
    #
    curried(:concat, &dispatchable(:concat, [::Array, ::String, ::Symbol]) do |list_a, list_b|
      if list_b.is_a?(::Array)
        list_a + list_b
      else
        [list_a, list_b].join('')
      end
    end)

    # Returns true if the specified value is equal, in R.equals terms,
    # to at least one element of the given list; false otherwise.
    #
    # a -> [a] -> Boolean
    #
    curried_method(:contains) do |x, xs|
      xs.include?(x)
    end

    # Returns all but the first n elements of the given list, string,
    # or transducer/transformer (or object with a drop method).
    #
    # Dispatches to the drop method of the second argument, if present.
    #
    # Number -> [a] -> [a]
    # Number -> String -> String
    #
    curried(:drop, &dispatchable(:drop, [::Array, ::String]) do |num, xs|
      xs[num..-1] || xs.class.new
    end)

    # Number -> [a] -> [a]
    # Number -> String -> String
    #
    # Returns a list containing all but the last n elements of the given list.
    #
    curried(:drop_last) do |x, xs|
      xs[0...-x]
    end

    # (a -> Boolean) -> [a] -> [a]
    # (a -> Boolean) -> String -> String
    #
    # Returns a new list excluding all the tailing elements of a given list
    # which satisfy the supplied predicate function.
    # It passes each value from the right to the supplied predicate function,
    # skipping elements until the predicate function returns a falsy value.
    # The predicate function is applied to one argument: (value).
    #
    curried(:drop_last_while) do |fn, xs|
      lxs =
        case xs
        when ::String
          xs.chars.to_a
        else
          xs
        end

      index = lxs.reverse.index { |x| !fn.call(x) } || 0
      xs[0...-index]
    end

    # Returns a new list without any consecutively repeating elements.
    # R.equals is used to determine equality.
    #
    # Acts as a transducer if a transformer is given in list position.
    #
    # [a] -> [a]
    #
    curried_method(:drop_repeats,
                   &dispatchable1([], ::Array, Trans::DropRepeatsTransducer.new) do |xs|
                      xs.chunk { |n| n }.map(&:first)
                    end)

    # Returns a new list without any consecutively repeating elements.
    # Equality is determined by applying the supplied predicate to each
    # pair of consecutive elements.
    # The first element in a series of equal elements will be preserved.
    #
    # Acts as a transducer if a transformer is given in list position.
    #
    # (a, a -> Boolean) -> [a] -> [a]
    #
    curried_method(:drop_repeats_with,
                   &dispatchable([], [::Array], Trans::DropRepeatsWithTransducer.new) do |f, xs|
                      xs.each_with_object([]) do |a, acc|
                        acc.push(a) unless acc.any? && f.call(acc.last, a)
                      end
                    end)

    # Returns a new list excluding the leading elements of a given list which
    # satisfy the supplied predicate function. It passes each value to the
    # supplied predicate function, skipping elements while the predicate
    # function returns true. The predicate function is applied
    # to one argument: (value).
    #
    # Dispatches to the dropWhile method of the second argument, if present.
    #
    # Acts as a transducer if a transformer is given in list position.
    #
    # (a -> Boolean) -> [a] -> [a]
    #
    curried(:drop_while, &dispatchable(:drop_while, ::Array) do |f, xs|
      xs.drop_while(&f)
    end)

    # Takes a predicate and a Filterable, and returns a new filterable of the same
    # type containing the members of the given filterable which satisfy the given
    # predicate. Filterable objects include plain objects or any object that
    # has a filter method such as Array.
    #
    # Dispatches to the filter method of the second argument, if present.
    #
    # Filterable f => (a -> Boolean) -> f a -> f a
    #
    curried(:filter,
            &dispatchable(:filter, [::Array, ::Hash], Trans::FilterTransducer.new) do |f, xs|
               if xs.is_a?(Hash)
                 xs.select { |_, value| f.call(value) }
               else
                 xs.select(&f)
               end
             end)

    # Creates a new object from a list key-value pairs. If a key appears in
    # multiple pairs, the rightmost pair is included in the object.
    #
    # [[k,v]] -> {k: v}
    #
    curried_method(:from_pairs) do |xs|
      Hash[xs]
    end

    # Returns the first element of the list which matches the predicate,
    # or undefined if no element matches.
    #
    # Dispatches to the find method of the second argument, if present.
    #
    # (a -> Boolean) -> [a] -> a | NilClass
    #
    curried(:find, &dispatchable(:find, ::Array) do |f, xs|
      xs.find(&f)
    end)

    # Returns the index of the first element of the list which matches the predicate,
    # or nil if no element matches.
    #
    # (a -> Boolean) -> [a] -> Number | NilClass
    #
    curried_method(:find_index) do |f, xs|
      xs.index(&f)
    end

    # Returns the last element of the list which matches the predicate,
    # or nil if no element matches.
    #
    # (a -> Boolean) -> [a] -> a | NilClass
    #
    curried_method(:find_last) do |f, xs|
      index = xs.rindex(&f)
      xs[index] unless index.nil?
    end

    # Returns the index of the last element of the list which matches the
    # predicate, or nil if no element matches.
    #
    # (a -> Boolean) -> [a] -> Number | NilClass
    #
    curried_method(:find_last_index) do |f, xs|
      xs.rindex(&f)
    end

    # Returns a new list by pulling every item out of it (and all its sub-arrays)
    # and putting them in a new array, depth-first.
    #
    # [a] -> [b]
    #
    curried_method(:flatten, &:flatten)

    # Iterate over an input list, calling a provided function fn for each element
    # in the list.
    #
    # Dispatches to the forEach method of the second argument, if present.
    #
    # (a -> *) -> [a] -> [a]
    #
    curried(:for_each, &dispatchable(:for_each, ::Array) do |f, xs|
      xs.each(&f)
    end)

    # Splits a list into sub-lists stored in an object, based on the result of
    # calling a String-returning function on each element, and grouping the
    # results according to values returned.
    #
    # Dispatches to the groupBy method of the second argument, if present.
    #
    #
    # (a -> String) -> [a] -> {String: [a]}
    #
    curried(:group_by, &dispatchable(:group_by, ::Array) do |f, xs|
      xs.group_by(&f)
    end)

    # Returns the first element of the given list or string. In some libraries
    # this function is named first.
    #
    # [a] -> a | NilClass
    # String -> String
    #
    curried_method(:head) do |xs|
      case xs
      when ::String
        xs[0] || ''
      else
        xs[0]
      end
    end

    # Returns the position of the first occurrence of an item in an array,
    # or nil if the item is not included in the array.
    #
    # a -> [a] -> Number | NilClass
    #
    curried_method(:index_of) do |x, xs|
      xs.index(x)
    end

    # Returns all but the last element of the given list or string.
    #
    # [a] -> [a]
    # String -> String
    #
    curried_method(:init) do |xs|
      xs[0..-2]
    end

    # Inserts the supplied element into the list, at the specified index.
    # Note that this is not destructive: it returns a copy of the list with
    # the changes. No lists have been harmed in the application of this function.
    #
    # Number -> a -> [a] -> [a]
    #
    curried_method(:insert) do |idx, x, xs|
      xs.dup.insert(idx, x)
    end

    # Inserts the sub-list into the list, at the specified index.
    # Note that this is not destructive: it returns a copy of the list
    # with the changes. No lists have been harmed in the application of this function.
    #
    # Number -> [a] -> [a] -> [a]
    #
    curried_method(:insert_all) do |index, elts, xs|
      xs.dup.insert(index, *elts)
    end

    # Creates a new list with the separator interposed between elements.
    #
    # Dispatches to the intersperse method of the second argument, if present.
    #
    # a -> [a] -> [a]
    #
    curried_method(:intersperse, &dispatchable([:intersperse], ::Array) do |sep, xs|
      xs.reduce([]) do |acc, a|
        acc << sep if acc.any?
        acc << a
      end
    end)

    # Transforms the items of the list with the transducer and appends
    # the transformed items to the accumulator using an appropriate iterator
    # function based on the accumulator type.
    #
    # The accumulator can be an array, string, object or a transformer.
    # Iterated items will be appended to arrays and concatenated to strings.
    # Objects will be merged directly.
    #
    # The accumulator can also be a transformer object that provides a 2-arity
    # reducing iterator function, step, 0-arity initial value function,
    # init, and 1-arity result extraction function result.
    # The step function is used as the iterator function in reduce. The result
    # function is used to convert the final accumulator into the return type
    # and in most cases is R.identity. The init function is used to provide
    # the initial accumulator.
    #
    # The iteration is performed with R.reduce after initializing the transducer.
    #
    # a -> (b -> b) -> [c] -> a
    #
    curried_method(:into) do |acc, xf, xs|
      rx = case acc
           when ::Array
             ->(arr, x) { arr << x }
           when ::String
             ->(str, x) { "#{str}#{x}" }
           when ::Object
             ->(obj, x) { obj.merge(x) }
           else
             raise ArgumetError, "Cannot create default transformer for #{acc}"
           end
      xs.reduce(acc, &xf.call(rx))
    end

    # Returns a string made by inserting the separator between each element and
    # concatenating all the elements into a single string.
    #
    # String -> [a] -> String
    #
    curried_method(:join) do |separator, xs|
      xs.join(separator)
    end

    # Returns the position of the last occurrence of an item in an array,
    # or nil if the item is not included in the array.
    #
    # a -> [a] -> Number | NilClass
    #
    curried_method(:last_index_of) do |x, xs|
      xs.rindex(x)
    end

    curried_method(:last) do |xs|
      case xs
      when ::String
        xs[-1] || ''
      else
        xs[-1]
      end
    end

    # Returns the number of elements in the array by returning list.length
    #
    # [a] -> Number
    #
    curried_method(:length, &:size)

    # Takes a function and a functor, applies the function to each of the
    # functor's values, and returns a functor of the same shape.
    # Ramda provides suitable map implementations for Array and Object,
    # so this function may be applied to [1, 2, 3] or {x: 1, y: 2, z: 3}.
    #
    # Also treats functions as functors and will compose them together.
    #
    # Functor f => (a -> b) -> f a -> f b
    #
    curried(:map,
            &dispatchable([:map, :fmap], [::Hash, ::Array], Trans::MapTransducer.new) do |f, xs|
               case xs
               when ::Hash
                 Hash[xs.map { |k, v| [k, f.call(v)] }]
               when ::Array
                 xs.map(&f)
               end
             end)

    # The mapAccum function behaves like a combination of map and reduce;
    # it applies a function to each element of a list, passing
    # an accumulating parameter from left to right, and returning
    # a final value of this accumulator together with the new list.
    #
    # The iterator function receives two arguments, acc and value,
    # and should return a tuple [acc, value].
    #
    # (acc -> x -> (acc, y)) -> acc -> [x] -> (acc, [y])
    #
    # curried_method(:map_accum) do |fn, acc, xs|
    #
    # end

    # Merges a list of objects together into one object.
    #
    # [{k: v}] -> {k: v}
    #
    curried_method(:merge_all) do |xs|
      xs.reduce(&:merge)
    end

    # Returns true if no elements of the list match the predicate, false otherwise.
    #
    # Dispatches to the none? method of the second argument, if present.
    #
    # (a -> Boolean) -> [a] -> Boolean
    #
    curried_method(:none) do |f, xs|
      xs.none?(&f)
    end

    # Returns the nth element of the given list or string. If n is negative
    # the element at index length + n is returned.
    #
    # Number -> [a] -> a | NilClass
    # Number -> String -> String
    #
    curried_method(:nth) do |index, xs|
      case xs
      when ::String
        xs[index] || ''
      when ::Array, ::Hash
        xs[index]
      else
        type_error(xs, :nth)
      end
    end

    # Takes a predicate and a list or other Filterable object and returns
    # the pair of filterable objects of the same type of elements which do
    # and do not satisfy, the predicate, respectively.
    #
    # Filterable f => (a -> Boolean) -> f a -> [f a, f a]
    #
    curried_method(:partition) do |f, xs|
      ::Ramda.juxt([::Ramda.filter, ::Ramda.reject]).call(f, xs)
    end

    # Returns a new list by plucking the same named property off all objects
    # in the list supplied.
    #
    # Pluck will work on any functor in addition to arrays, as it is equivalent
    # to R.map(R.prop(k), f).
    #
    # Functor f => k -> f {k: v} -> f v
    #
    curried_method(:pluck) do |key, xs|
      Ramda.map(->(x) { x[key] }, xs)
    end

    # Returns a new list with the given element at the front, followed by the
    # contents of the list.
    #
    # a -> [a] -> [a]
    #
    curried_method(:prepend) do |x, xs|
      [x] + xs.dup
    end

    # Returns a list of numbers from from (inclusive) to to (exclusive).
    #
    # Number -> Number -> [Number]
    #
    curried_method(:range) do |a, b|
      (a...b).to_a
    end

    # Returns a single item by iterating through the list, successively
    # calling the iterator function and passing it an accumulator value
    # and the current value from the array, and then passing the result
    # to the next call.
    #
    # The iterator function receives two values: (value, acc),
    # while the arguments' order of reduce's iterator function is (acc, value).
    #
    # ((a, b) -> a) -> a -> [b] -> a
    #
    curried_method(:reduce) do |f, acc, xs|
      xs.reduce(acc) do |loc_acc, x|
        res = f.call(loc_acc, x)
        break res.value if res.is_a?(::Ramda::Internal::Transducers::Transducer) && res.reduced
        res
      end
    end

    # Returns a single item by iterating through the list, successively
    # calling the iterator function and passing it an accumulator value
    # and the current value from the array, and then passing the result
    # to the next call.
    # Similar to reduce, except moves through the input list from the
    # right to the left.
    #
    # The iterator function receives two values: (value, acc),
    # while the arguments' order of reduce's iterator function is (acc, value).
    #
    # ((a, b) -> a) -> a -> [b] -> a
    #
    curried_method(:reduce_right) do |f, acc_arg, xs|
      xs.reverse.reduce(acc_arg) do |acc, x|
        res = f.call(x, acc)
        break res.value if res.is_a?(::Ramda::Internal::Transducers::Transducer) && res.reduced
        res
      end
    end

    # Returns a value wrapped to indicate that it is the final value of
    # the reduce and transduce functions. The returned value should be
    # considered a black box: the internal structure is not guaranteed
    # to be stable.
    #
    # Note: this optimization is unavailable to functions not explicitly
    # listed above.
    #
    # a -> *
    #
    curried_method(:reduced) do |x|
      t = ::Ramda::Internal::Transducers::Transducer.new
      t.reduced = true
      t.value = x
      t
    end

    # Returns a new list or string with the elements or characters in reverse order.
    #
    # [a] -> [a]
    # String -> String
    #
    curried_method(:reverse, &:reverse)

    # The complement of filter.
    # Acts as a transducer if a transformer is given in list position.
    # Filterable objects include plain objects or any object that has a
    # filter method such as Array.
    #
    # Filterable f => (a -> Boolean) -> f a -> f a
    #
    curried_method(:reject) do |f, xs|
      case xs
      when ::Hash
        xs.reject { |_, value| f.call(value) }
      else
        xs.reject(&f)
      end
    end

    curried_method(:remove) do |from, n, xs|
      xs[0...from] + xs[from + n..-1]
    end

    # Returns a fixed list of size n containing a specified identical value.
    #
    # a -> n -> [a]
    #
    curried_method(:repeat) do |a, n|
      ::Array.new(n, a)
    end

    # Scan is similar to reduce, but returns a list of successively
    # reduced values from the left
    #
    # (a,b -> a) -> a -> [b] -> [a]
    #
    curried_method(:scan) do |f, acc0, xs|
      xs.reduce([acc0]) { |acc, x| acc << f.call(acc[-1], x) }
    end

    # Returns the elements of the given list or string
    # from fromIndex (inclusive) to toIndex (exclusive).
    #
    # Number -> Number -> [a] -> [a]
    # Number -> Number -> String -> String
    #
    curried(:slice, &dispatchable(:slice, [::Array, ::String]) do |from, to, xs|
      xs[from...to]
    end)

    # Returns a copy of the list, sorted according to the comparator function,
    # which should accept two values at a time and return a negative number
    # if the first value is smaller, a positive number if it's larger, and
    # zero if they are equal. Please note that this is a copy of the list.
    # It does not modify the original.

    curried_method(:sort) do |comparator, xs|
      xs.sort(&comparator)
    end

    # Number -> [a] -> [[a]]
    # Number -> String -> [String]
    #
    # Splits a collection into slices of the specified length.
    #
    curried(:split_every) do |num, xs|
      case xs
      when ::Array
        xs
          .each_slice(num)
          .to_a
      when ::String
        xs
          .chars
          .each_slice(num)
          .to_a
          .map(&:join)
      else
        type_error(xs, :split_every)
      end
    end

    # Returns all but the first element of the given list or string
    # (or object with a tail method).
    #
    # [a] -> [a]
    # String -> String
    #
    curried_method(:tail) do |xs|
      ::Ramda.drop(1, xs)
    end

    # Returns the first n elements of the given list, string.
    #
    # Dispatches to the take method of the second argument, if present.
    #
    # Number -> [a] -> [a]
    # Number -> String -> String
    #
    curried(:take,
            &dispatchable(:take, [::Array, ::String], Trans::TakeTransducer.new) do |num, xs|
               xs[0, num]
             end)

    # Number -> [a] -> [a]
    # Number -> String -> String
    #
    # Returns a new list containing the last n elements of the given list.
    # If n > list.length, returns a list of list.length elements.
    #
    curried(:take_last) do |n, xs|
      xs[-(n > xs.size ? xs.size : n)..-1]
    end

    # Number -> [a] -> [a]
    # Number -> String -> String
    #
    # Returns a new list containing the last n elements of the given list.
    # If n > list.length, returns a list of list.length elements.
    #
    curried(:take_last_while) do |f, xs|
      lxs =
        case xs
        when ::String
          xs.chars.to_a
        else
          xs
        end

      index = lxs.reverse.index { |x| !f.call(x) } || lxs.size
      xs[-index..-1]
    end

    # Returns a new list containing the first n elements of a given list,
    # passing each value to the supplied predicate function, and terminating
    # when the predicate function returns false. Excludes the element that
    # caused the predicate function to fail.
    # The predicate function is passed one argument: (value).
    #
    # (a -> Boolean) -> [a] -> [a]
    #
    curried(:take_while, &dispatchable(:take_while, ::Array) do |f, xs|
      xs[0, xs.index { |x| !f.call(x) } || xs.size]
    end)

    # Calls an input function n times, returning an array containing the results
    # of those function calls.
    # fn is passed one argument: The current value of n, which begins at 0
    # and is gradually incremented to n - 1.
    #
    # (Number -> a) -> Number -> [a]
    #
    curried_method(:times) do |f, n|
      n.times.to_a.map(&f)
    end

    # Returns a single item by iterating through the list, successively
    # calling the iterator function and passing it an accumulator value
    # and the current value from the array, and then passing the result
    # to the next call.
    #
    # The iterator function receives two values: (acc, value).
    # It may use R.reduced to shortcut the iteration.
    #
    # The arguments' order of reduceRight's iterator function is (value, acc).
    #
    # Dispatches to the reduce method of the third argument, if present.
    # When doing so, it is up to the user to handle the R.reduced shortcuting,
    # as this is not implemented by reduce.
    #
    # ((a, b) -> a) -> a -> [b] -> a
    #
    curried_method(:transduce) do |xf, rx, acc, xs|
      f = xf.call(rx)
      xs.reduce(acc) do |loc_acc, x|
        res = f.call(loc_acc, x)
        break res.value if res.is_a?(::Ramda::Internal::Transducers::Transducer) && res.reduced
        res
      end
    end

    # Builds a list from a seed value. Accepts an iterator function, which
    # returns either false to stop iteration or an array of length 2
    # containing the value to add to the resulting list and the seed
    # to be used in the next call to the iterator function.
    #
    # The iterator function receives one argument: (seed).
    #
    # (a -> [b]) -> * -> [b]
    #
    curried_method(:unfold) do |f, n|
      xs = []
      loop do
        res = f.call(n)

        break if res.is_a?(FalseClass)

        xs << res[0]
        n = res[1]
      end
      xs
    end

    # Returns a new list containing only one copy of each element in the original list.
    #
    # [a] -> [a]
    #
    curried_method(:uniq, &:uniq)

    # (a -> b) -> [a] -> [a]
    #
    # Returns a new list containing only one copy of each element in the original list,
    # based upon the value returned by applying the supplied function to each list element.
    # Prefers the first item if the supplied function produces the same value on two items.
    # R.equals is used for comparison.
    #
    curried(:uniq_by) do |f, xs|
      xs.uniq(&f)
    end

    # Returns a new list containing only one copy of each element in the original list,
    # based upon the value returned by applying the supplied predicate to each list
    # element.
    curried_method(:uniq_with) do |f, xs|
      xs.uniq(&f)
    end

    # Shorthand for R.chain(R.identity), which removes one level of nesting from any Chain.
    #
    # Chain c => c (c a) -> c a
    #
    curried_method(:unnest) do |xs|
      ::Ramda.chain(::Ramda.identity, xs)
    end

    # Returns a new copy of the array with the element at the provided
    # index replaced with the given value.
    #
    # Number -> a -> [a] -> [a]
    #
    curried_method(:update) do |idx, x, xs|
      xs.dup.tap { |a| a[idx] = x }
    end

    # Creates a new list out of the two supplied by creating each possible pair
    # from the lists.
    #
    # [a] -> [b] -> [[a,b]]
    #
    curried_method(:xprod) do |xs1, xs2|
      xs1.product(xs2)
    end

    # Creates a new list out of the two supplied by pairing up equally-positioned
    # items from both lists. The returned list is truncated to the length of the
    # shorter of the two input lists.
    # Note: zip is equivalent to zip_with(->(a, b) { [a, b] }).
    #
    # [a] -> [b] -> [[a,b]]
    #
    curried_method(:zip) do |xs1, xs2|
      xs1.zip(xs2)
    end

    # Creates a new object out of a list of keys and a list of values. Key/value
    # pairing is truncated to the length of the shorter of the two lists. Note:
    # zipObj is equivalent to pipe(zip_with(pair), from_pairs).
    #
    # [String] -> [*] -> {String: *}
    #
    curried_method(:zip_obj) do |xs1, xs2|
      Hash[xs1.zip(xs2)]
    end

    # Creates a new list out of the two supplied by applying the function to each
    # equally-positioned pair in the lists. The returned list is truncated to the
    # length of the shorter of the two input lists.
    #
    # (a,b -> c) -> [a] -> [b] -> [c]
    #
    curried_method(:zip_with) do |f, xs1, xs2|
      xs1.zip(xs2).map { |(a, b)| f.call(a, b) }
    end

    # TODO: Extract from this module
    def self.type_error(object, method)
      raise ArgumentError, "Unexpected type #{object.class} in method: #{method}"
    end
  end
end

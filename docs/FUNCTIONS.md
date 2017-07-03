* (pending) compose_p
* (pending) keys_in
* (pending) map_accum
* (pending) map_accum_right
* (pending) math_mod
* (pending) pipe_p
* (pending) to_pairs_in
* (pending) values_in

Function
------------

* [F](http://ramdajs.com/docs/#F)
* [T](http://ramdajs.com/docs/#T)
* [`__`](http://ramdajs.com/docs/) - first function call should have all arguments `g(__2, __)(1, 3)`, this means that it doesn't support `g(__, 2)(1)(3)`, `g(__, 2)(1, 3)` and `g(__, 2)(__, 3)(1)`
* [always](http://ramdajs.com/docs/#always)
* [ap](http://ramdajs.com/docs/#ap)
* [apply](http://ramdajs.com/docs/#apply)
* [binary](http://ramdajs.com/docs/#binary)
* [bind](http://ramdajs.com/docs/#bind)
* [call](http://ramdajs.com/docs/#call)
* [comparator](http://ramdajs.com/docs/#comparator)
* [compose](http://ramdajs.com/docs/#compose)
* [construct](http://ramdajs.com/docs/#construct)
* [construct_n](http://ramdajs.com/docs/#constructN)
* [converge](http://ramdajs.com/docs/#converge)
* [curry](http://ramdajs.com/docs/#curry)
* [curry_n](http://ramdajs.com/docs/#curryN)
* [empty](http://ramdajs.com/docs/#empty) - uses x.class.new for defining new empty object if empty method does not exist
* [flip](http://ramdajs.com/docs/#flip)
* [identity](http://ramdajs.com/docs/#identity)
* [invoker](http://ramdajs.com/docs/#invoker)
* [juxt](http://ramdajs.com/docs/#juxt)
* [lift](http://ramdajs.com/docs/#lift)
* [lift_n](http://ramdajs.com/docs/#liftN)
* [memoize](http://ramdajs.com/docs/#memoize)
* [n_ary](http://ramdajs.com/docs/#nAry)
* [nth_arg](http://ramdajs.com/docs/#nthArg)
* [of](http://ramdajs.com/docs/#cond)
* [once](http://ramdajs.com/docs/#once)
* [partial](http://ramdajs.com/docs/#partial)
* [partial_right](http://ramdajs.com/docs/#partialRight)
* [pipe](http://ramdajs.com/docs/#pipe)
* [tap](http://ramdajs.com/docs/#tap)
* [unapply](http://ramdajs.com/docs/#unapply)
* [unary](http://ramdajs.com/docs/#unary)
* [use_with](http://ramdajs.com/docs/#useWith)

List
------------

* [all](http://ramdajs.com/docs/#all)
* [any](http://ramdajs.com/docs/#any)
* [append](http://ramdajs.com/docs/#append)
* [chain](http://ramdajs.com/docs/#chain)
* [concat](http://ramdajs.com/docs/#concat)
* [contains](http://ramdajs.com/docs/#contains)
* [drop](http://ramdajs.com/docs/#drop)
* [drop_while](http://ramdajs.com/docs/#dropWhile)
* [filter](http://ramdajs.com/docs/#filter)
* [find](http://ramdajs.com/docs/#find)
* [find_index](http://ramdajs.com/docs/#findIndex) - returns nil if index doesn't exist
* [find_last](http://ramdajs.com/docs/#findLast)
* [find_last_index](http://ramdajs.com/docs/#findLastIndex) - returns nil if index doesn't exist
* [flatten](http://ramdajs.com/docs/#flatten)
* [for_each](http://ramdajs.com/docs/#forEach)
* [from_pairs](http://ramdajs.com/docs/#fromPairs)
* [group_by](http://ramdajs.com/docs/#groupBy)
* [head](http://ramdajs.com/docs/#head)
* [index_of](http://ramdajs.com/docs/#indexOf) - returns nil if index doesn't exist
* [init](http://ramdajs.com/docs/#init)
* [insert](http://ramdajs.com/docs/#insert)
* [insert_all](http://ramdajs.com/docs/#insertAll)
* [join](http://ramdajs.com/docs/#join)
* [last](http://ramdajs.com/docs/#last)
* [last_index_of](http://ramdajs.com/docs/#lastIndexOf) - returns nil if index doesn't exist
* [length](http://ramdajs.com/docs/#length)
* [map](http://ramdajs.com/docs/#map)
* [map_obj_indexed](http://ramdajs.com/docs/#mapObjIndexed)
* [merge_all](http://ramdajs.com/docs/#mergeAll)
* [nth](http://ramdajs.com/docs/#nth)
* [partition](http://ramdajs.com/docs/#partition)
* [pluck](http://ramdajs.com/docs/#pluck)
* [prepend](http://ramdajs.com/docs/#prepend)
* [range](http://ramdajs.com/docs/#range)
* [reduce](http://ramdajs.com/docs/#reduce)
* [reduce_right](http://ramdajs.com/docs/#reduceRight)
* [reject](http://ramdajs.com/docs/#reject)
* [remove](http://ramdajs.com/docs/#remove)
* [repeat](http://ramdajs.com/docs/#repeat)
* [reverse](http://ramdajs.com/docs/#reverse)
* [scan](http://ramdajs.com/docs/#scan)
* [slice](http://ramdajs.com/docs/#slice)
* [sort](http://ramdajs.com/docs/#sort)
* [sort_by](http://ramdajs.com/docs/#sortBy)
* [tail](http://ramdajs.com/docs/#tail)
* [take](http://ramdajs.com/docs/#take)
* [take_while](http://ramdajs.com/docs/#takeWhile)
* [times](http://ramdajs.com/docs/#times)
* [unfold](http://ramdajs.com/docs/#unfold)
* [uniq](http://ramdajs.com/docs/#uniq)
* [uniq_with](http://ramdajs.com/docs/#uniqWith) - first argument is a function with 1 arity which transforms each list element and applies uniq function to results
* [unnest](http://ramdajs.com/docs/#unnest)
* [update](http://ramdajs.com/docs/#update)
* [xprod](http://ramdajs.com/docs/#xprod)
* [zip](http://ramdajs.com/docs/#zip)
* [zip_obj](http://ramdajs.com/docs/#zipObj)
* [zip_with](http://ramdajs.com/docs/#zipWith)

Logic
------------

* [all_pass](http://ramdajs.com/docs/#allPass)
* [and](http://ramdajs.com/docs/#and)
* [any_pass](http://ramdajs.com/docs/#anyPass)
* [complement](http://ramdajs.com/docs/#complement)
* [cond](http://ramdajs.com/docs/#cond)
* [default_to](http://ramdajs.com/docs/#defaultTo)
* [if_else](http://ramdajs.com/docs/#ifElse)
* [is_empty](http://ramdajs.com/docs/#isEmpty)
* [not](http://ramdajs.com/docs/#not)
* [or](http://ramdajs.com/docs/#or)

Math
------------

* [add](http://ramdajs.com/docs/#add)
* [dec](http://ramdajs.com/docs/#dec)
* [divide](http://ramdajs.com/docs/#divide)
* [inc](http://ramdajs.com/docs/#inc)
* [modulo](http://ramdajs.com/docs/#modulo)
* [multiply](http://ramdajs.com/docs/#multiply)
* [negate](http://ramdajs.com/docs/#negate)
* [product](http://ramdajs.com/docs/#product)
* [subtract](http://ramdajs.com/docs/#substract)
* [sum](http://ramdajs.com/docs/#sum)

Object
------------

* [assoc](http://ramdajs.com/docs/#assoc)
* [assoc_path](http://ramdajs.com/docs/#assocPath)
* [clone](http://ramdajs.com/docs/#clone)
* [dissoc](http://ramdajs.com/docs/#dissoc)
* [eq_props](http://ramdajs.com/docs/#eqProps)
* [evolve](http://ramdajs.com/docs/#evolve)
* [has](http://ramdajs.com/docs/#has)
* [has_in](http://ramdajs.com/docs/#hasIn)
* [invert](http://ramdajs.com/docs/#invert)
* [invert_obj](http://ramdajs.com/docs/#invertObj)
* [keys](http://ramdajs.com/docs/#keys)
* [lens](http://ramdajs.com/docs/#lens) - composition does not work compose(lens1, lensb)
* [lens_index](http://ramdajs.com/docs/#lensIndex)
* [lens_path](http://ramdajs.com/docs/#lensPath)
* [lens_prop](http://ramdajs.com/docs/#lensProp)
* [merge](http://ramdajs.com/docs/#merge)
* [omit](http://ramdajs.com/docs/#omit)
* [over](http://ramdajs.com/docs/#over)
* [path](http://ramdajs.com/docs/#path)
* [pick](http://ramdajs.com/docs/#pick)
* [pick_all](http://ramdajs.com/docs/#pickAll)
* [pick_by](http://ramdajs.com/docs/#pickBy)
* [project](http://ramdajs.com/docs/#project)
* [prop](http://ramdajs.com/docs/#prop)
* [prop_or](http://ramdajs.com/docs/#propOr)
* [props](http://ramdajs.com/docs/#props)
* [set](http://ramdajs.com/docs/#set)
* [to_pairs](http://ramdajs.com/docs/#toPairs)
* [values](http://ramdajs.com/docs/#values)
* [view](http://ramdajs.com/docs/#view)
* [where](http://ramdajs.com/docs/#where)


Relation
------------

* [count_by](http://ramdajs.com/docs/#countBy)
* [difference](http://ramdajs.com/docs/#difference)
* [difference_with](http://ramdajs.com/docs/#differenceWith)
* [eq_by](http://ramdajs.com/docs/#eqBy)
* [equals](http://ramdajs.com/docs/#equals)
* [gt](http://ramdajs.com/docs/#gt)
* [gte](http://ramdajs.com/docs/#gte)
* [intersection](http://ramdajs.com/docs/#intersection)
* [lt](http://ramdajs.com/docs/#lt)
* [lte](http://ramdajs.com/docs/#lte)
* [max](http://ramdajs.com/docs/#max)
* [max_by](http://ramdajs.com/docs/#maxBy)
* [min](http://ramdajs.com/docs/#min)
* [min_by](http://ramdajs.com/docs/#minBy)
* [path_eq](http://ramdajs.com/docs/#pathEq)
* [prop_eq](http://ramdajs.com/docs/#propEq)
* [sort_by](http://ramdajs.com/docs/#sortBy)
* [union](http://ramdajs.com/docs/#union)
* [union_with](http://ramdajs.com/docs/#unionWith)

String
------------

* [match](http://ramdajs.com/docs/#math)
* [replace](http://ramdajs.com/docs/#replace) - it uses a gsub method and global replacement
* [split](http://ramdajs.com/docs/#split)
* [to_lower](http://ramdajs.com/docs/#toLower)
* [to_upper](http://ramdajs.com/docs/#toUpper)
* [trim](http://ramdajs.com/docs/#trim)

Type
------------

* [is](http://ramdajs.com/docs/#is)
* [is_nil](http://ramdajs.com/docs/#isNil)
* [type](http://ramdajs.com/docs/#type)

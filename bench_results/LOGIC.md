[Code](../bench/logic/and.rb)

```sh
$ ruby -v bench/logic/and.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
                  &&   196.491k i/100ms
           Ramda.and    66.865k i/100ms
         C Ramda.and    41.959k i/100ms
        CA Ramda.and    31.876k i/100ms
Calculating -------------------------------------
                  &&      5.220M (± 3.0%) i/s -     26.133M in   5.012316s
           Ramda.and    941.156k (± 2.9%) i/s -      4.747M in   5.048960s
         C Ramda.and    523.677k (± 3.2%) i/s -      2.643M in   5.053418s
        CA Ramda.and    366.177k (± 5.3%) i/s -      1.849M in   5.066236s

Comparison:
                  &&:  5219822.9 i/s
           Ramda.and:   941156.4 i/s - 5.55x  slower
         C Ramda.and:   523676.5 i/s - 9.97x  slower
        CA Ramda.and:   366176.8 i/s - 14.25x  slower


```

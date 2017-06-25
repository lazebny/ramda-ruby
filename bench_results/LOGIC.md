[Code](../bench/logic/and.rb)

```sh
$ ruby -v bench/logic/and.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
                  &&   208.706k i/100ms
           Ramda.and    55.526k i/100ms
         C Ramda.and    35.050k i/100ms
        CA Ramda.and    27.348k i/100ms
Calculating -------------------------------------
                  &&      5.316M (± 3.6%) i/s -     26.714M in   5.035792s
           Ramda.and    780.486k (± 6.1%) i/s -      3.887M in   5.008021s
         C Ramda.and    442.198k (± 9.0%) i/s -      2.208M in   5.052807s
        CA Ramda.and    330.006k (± 1.9%) i/s -      1.668M in   5.056902s

Comparison:
                  &&:  5315691.8 i/s
           Ramda.and:   780486.4 i/s - 6.81x  slower
         C Ramda.and:   442198.4 i/s - 12.02x  slower
        CA Ramda.and:   330005.9 i/s - 16.11x  slower


```

[Code](../bench/logic/and.rb)

```sh
$ ruby -v bench/logic/and.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
                  &&   210.775k i/100ms
           Ramda.and    73.229k i/100ms
         C Ramda.and    44.010k i/100ms
        CA Ramda.and    31.670k i/100ms
Calculating -------------------------------------
                  &&      5.255M (± 4.0%) i/s -     26.347M in   5.023458s
           Ramda.and      1.035M (± 2.3%) i/s -      5.199M in   5.025383s
         C Ramda.and    573.501k (± 3.2%) i/s -      2.905M in   5.070602s
        CA Ramda.and    401.015k (± 3.2%) i/s -      2.027M in   5.060016s

Comparison:
                  &&:  5255480.3 i/s
           Ramda.and:  1035226.8 i/s - 5.08x  slower
         C Ramda.and:   573501.5 i/s - 9.16x  slower
        CA Ramda.and:   401015.3 i/s - 13.11x  slower


```

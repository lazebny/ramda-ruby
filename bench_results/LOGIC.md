[Code](../bench/logic/and.rb)

```sh
$ ruby -v bench/logic/and.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
                  &&   202.393k i/100ms
           Ramda.and    59.582k i/100ms
         C Ramda.and    37.270k i/100ms
        CA Ramda.and    28.956k i/100ms
Calculating -------------------------------------
                  &&      5.279M (± 1.1%) i/s -     26.513M in   5.022770s
           Ramda.and    790.696k (± 0.6%) i/s -      3.992M in   5.048900s
         C Ramda.and    459.552k (± 0.7%) i/s -      2.311M in   5.028515s
        CA Ramda.and    335.046k (± 0.6%) i/s -      1.679M in   5.012756s

Comparison:
                  &&:  5279269.0 i/s
           Ramda.and:   790695.8 i/s - 6.68x  slower
         C Ramda.and:   459552.3 i/s - 11.49x  slower
        CA Ramda.and:   335046.5 i/s - 15.76x  slower


```

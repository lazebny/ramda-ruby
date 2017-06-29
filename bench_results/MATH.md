[Code](../bench/math/add.rb)

```sh
$ ruby -v bench/math/add.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
           Integer#+   214.059k i/100ms
           Ramda.add    58.595k i/100ms
         C Ramda.add    37.065k i/100ms
        CA Ramda.add    28.941k i/100ms
Calculating -------------------------------------
           Integer#+      5.278M (± 1.7%) i/s -     26.543M in   5.030668s
           Ramda.add    759.072k (± 2.6%) i/s -      3.809M in   5.021318s
         C Ramda.add    449.104k (± 4.0%) i/s -      2.261M in   5.043515s
        CA Ramda.add    330.077k (± 2.4%) i/s -      1.650M in   5.000667s

Comparison:
           Integer#+:  5277849.3 i/s
           Ramda.add:   759071.6 i/s - 6.95x  slower
         C Ramda.add:   449104.1 i/s - 11.75x  slower
        CA Ramda.add:   330077.0 i/s - 15.99x  slower


```

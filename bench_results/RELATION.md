[Code](../bench/relation/min.rb)

```sh
$ ruby -v bench/relation/min.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
           Array#min   137.007k i/100ms
           Ramda.min    48.705k i/100ms
         C Ramda.min    33.207k i/100ms
        CA Ramda.min    23.987k i/100ms
Calculating -------------------------------------
           Array#min      2.128M (± 5.2%) i/s -     10.687M in   5.038179s
           Ramda.min    577.912k (± 4.1%) i/s -      2.922M in   5.066666s
         C Ramda.min    378.735k (± 3.5%) i/s -      1.893M in   5.004407s
        CA Ramda.min    287.563k (± 2.6%) i/s -      1.439M in   5.008585s

Comparison:
           Array#min:  2128348.7 i/s
           Ramda.min:   577912.5 i/s - 3.68x  slower
         C Ramda.min:   378734.8 i/s - 5.62x  slower
        CA Ramda.min:   287563.3 i/s - 7.40x  slower


```

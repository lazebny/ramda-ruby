[Code](../bench/logic/and.rb)

```sh
$ ruby -v bench/logic/and.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
                  &&   216.500k i/100ms
           Ramda.and    57.351k i/100ms
         C Ramda.and    36.469k i/100ms
        CA Ramda.and    28.025k i/100ms
Calculating -------------------------------------
                  &&      5.298M (± 2.0%) i/s -     26.630M in   5.028544s
           Ramda.and    779.837k (± 0.8%) i/s -      3.900M in   5.001173s
         C Ramda.and    451.705k (± 4.7%) i/s -      2.261M in   5.019408s
        CA Ramda.and    328.110k (± 3.6%) i/s -      1.653M in   5.046319s

Comparison:
                  &&:  5298086.4 i/s
           Ramda.and:   779836.9 i/s - 6.79x  slower
         C Ramda.and:   451705.3 i/s - 11.73x  slower
        CA Ramda.and:   328110.3 i/s - 16.15x  slower


```

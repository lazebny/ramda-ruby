[Code](../bench/logic/and.rb)

```sh
$ ruby -v bench/logic/and.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
                  &&   216.356k i/100ms
           Ramda.and    59.407k i/100ms
         C Ramda.and    36.180k i/100ms
        CA Ramda.and    26.975k i/100ms
Calculating -------------------------------------
                  &&      5.169M (± 2.8%) i/s -     25.963M in   5.026709s
           Ramda.and    740.548k (± 1.7%) i/s -      3.743M in   5.055388s
         C Ramda.and    439.341k (± 4.0%) i/s -      2.207M in   5.032414s
        CA Ramda.and    321.324k (± 3.1%) i/s -      1.619M in   5.042235s

Comparison:
                  &&:  5169294.3 i/s
           Ramda.and:   740547.7 i/s - 6.98x  slower
         C Ramda.and:   439340.7 i/s - 11.77x  slower
        CA Ramda.and:   321324.0 i/s - 16.09x  slower


```

[Code](../bench/logic/and.rb)

```sh
$ ruby -v bench/logic/and.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
                  &&   197.957k i/100ms
           Ramda.and    72.431k i/100ms
         C Ramda.and    43.444k i/100ms
        CA Ramda.and    31.760k i/100ms
Calculating -------------------------------------
                  &&      5.093M (±11.5%) i/s -     25.141M in   5.033037s
           Ramda.and      1.055M (± 3.0%) i/s -      5.287M in   5.016179s
         C Ramda.and    542.569k (± 5.0%) i/s -      2.737M in   5.059053s
        CA Ramda.and    362.780k (± 7.0%) i/s -      1.810M in   5.024617s

Comparison:
                  &&:  5093048.9 i/s
           Ramda.and:  1055109.1 i/s - 4.83x  slower
         C Ramda.and:   542568.9 i/s - 9.39x  slower
        CA Ramda.and:   362779.6 i/s - 14.04x  slower


```

[Code](../bench/math/add.rb)

```sh
$ ruby -v bench/math/add.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
           Integer#+   202.596k i/100ms
           Ramda.add    57.145k i/100ms
         C Ramda.add    36.830k i/100ms
        CA Ramda.add    28.441k i/100ms
Calculating -------------------------------------
           Integer#+      5.385M (± 2.6%) i/s -     26.945M in   5.007705s
           Ramda.add    814.806k (± 0.9%) i/s -      4.114M in   5.050051s
         C Ramda.add    463.202k (± 5.6%) i/s -      2.320M in   5.030342s
        CA Ramda.add    336.496k (± 2.7%) i/s -      1.706M in   5.075392s

Comparison:
           Integer#+:  5384798.9 i/s
           Ramda.add:   814805.6 i/s - 6.61x  slower
         C Ramda.add:   463201.9 i/s - 11.63x  slower
        CA Ramda.add:   336495.6 i/s - 16.00x  slower


```

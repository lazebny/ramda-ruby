[Code](../bench/relation/min.rb)

```sh
$ ruby -v bench/relation/min.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
           Array#min   127.200k i/100ms
           Ramda.min    48.415k i/100ms
         C Ramda.min    31.621k i/100ms
        CA Ramda.min    25.211k i/100ms
Calculating -------------------------------------
           Array#min      2.192M (± 1.1%) i/s -     11.066M in   5.050042s
           Ramda.min    639.266k (± 4.0%) i/s -      3.195M in   5.008244s
         C Ramda.min    384.866k (± 6.0%) i/s -      1.929M in   5.034256s
        CA Ramda.min    291.539k (± 9.5%) i/s -      1.462M in   5.073676s

Comparison:
           Array#min:  2191600.3 i/s
           Ramda.min:   639266.0 i/s - 3.43x  slower
         C Ramda.min:   384866.2 i/s - 5.69x  slower
        CA Ramda.min:   291538.5 i/s - 7.52x  slower


```

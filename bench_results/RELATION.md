[Code](../bench/relation/min.rb)

```sh
$ ruby -v bench/relation/min.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
           Array#min   129.234k i/100ms
           Ramda.min    46.948k i/100ms
         C Ramda.min    31.756k i/100ms
        CA Ramda.min    25.203k i/100ms
Calculating -------------------------------------
           Array#min      2.199M (± 1.0%) i/s -     11.114M in   5.054288s
           Ramda.min    618.651k (± 0.8%) i/s -      3.099M in   5.008941s
         C Ramda.min    391.368k (± 1.2%) i/s -      1.969M in   5.031523s
        CA Ramda.min    295.198k (± 1.4%) i/s -      1.487M in   5.038173s

Comparison:
           Array#min:  2199177.6 i/s
           Ramda.min:   618651.4 i/s - 3.55x  slower
         C Ramda.min:   391367.7 i/s - 5.62x  slower
        CA Ramda.min:   295197.5 i/s - 7.45x  slower


```

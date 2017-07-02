[Code](../bench/type/is.rb)

```sh
$ ruby -v bench/type/is.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
        Object#is_a?   236.507k i/100ms
            Ramda.is    71.785k i/100ms
          C Ramda.is    42.919k i/100ms
         CA Ramda.is    30.524k i/100ms
Calculating -------------------------------------
        Object#is_a?      6.314M (± 7.3%) i/s -     31.455M in   5.018973s
            Ramda.is      1.032M (± 8.3%) i/s -      5.169M in   5.059860s
          C Ramda.is    522.732k (± 8.8%) i/s -      2.618M in   5.056747s
         CA Ramda.is    357.127k (±10.2%) i/s -      1.801M in   5.107361s

Comparison:
        Object#is_a?:  6314025.5 i/s
            Ramda.is:  1032426.5 i/s - 6.12x  slower
          C Ramda.is:   522731.9 i/s - 12.08x  slower
         CA Ramda.is:   357127.5 i/s - 17.68x  slower


```

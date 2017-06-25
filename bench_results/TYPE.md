[Code](../bench/type/is.rb)

```sh
$ ruby -v bench/type/is.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
        Object#is_a?   208.740k i/100ms
            Ramda.is    50.923k i/100ms
          C Ramda.is    35.256k i/100ms
         CA Ramda.is    27.414k i/100ms
Calculating -------------------------------------
        Object#is_a?      6.471M (± 0.6%) i/s -     32.355M in   5.000468s
            Ramda.is    740.801k (± 6.9%) i/s -      3.717M in   5.048026s
          C Ramda.is    440.135k (± 1.1%) i/s -      2.221M in   5.047121s
         CA Ramda.is    323.843k (± 1.3%) i/s -      1.645M in   5.079962s

Comparison:
        Object#is_a?:  6470604.4 i/s
            Ramda.is:   740800.6 i/s - 8.73x  slower
          C Ramda.is:   440135.1 i/s - 14.70x  slower
         CA Ramda.is:   323843.3 i/s - 19.98x  slower


```

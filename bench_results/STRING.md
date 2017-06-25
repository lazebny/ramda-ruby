[Code](../bench/string/match.rb)

```sh
$ ruby -v bench/string/match.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
        String#match   112.475k i/100ms
         Ramda.match    35.981k i/100ms
       C Ramda.match    26.745k i/100ms
      CA Ramda.match    21.381k i/100ms
Calculating -------------------------------------
        String#match      2.003M (± 5.4%) i/s -     10.010M in   5.020173s
         Ramda.match    546.263k (± 3.3%) i/s -      2.735M in   5.012657s
       C Ramda.match    352.129k (± 0.8%) i/s -      1.765M in   5.013205s
      CA Ramda.match    264.370k (± 7.3%) i/s -      1.326M in   5.048530s

Comparison:
        String#match:  2002651.2 i/s
         Ramda.match:   546263.1 i/s - 3.67x  slower
       C Ramda.match:   352128.5 i/s - 5.69x  slower
      CA Ramda.match:   264370.0 i/s - 7.58x  slower


```

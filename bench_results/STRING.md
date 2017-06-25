[Code](../bench/string/match.rb)

```sh
$ ruby -v bench/string/match.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
        String#match   117.001k i/100ms
         Ramda.match    36.782k i/100ms
       C Ramda.match    25.236k i/100ms
      CA Ramda.match    21.172k i/100ms
Calculating -------------------------------------
        String#match      2.012M (± 1.6%) i/s -     10.062M in   5.001155s
         Ramda.match    493.402k (± 0.9%) i/s -      2.501M in   5.069702s
       C Ramda.match    317.354k (± 0.7%) i/s -      1.590M in   5.010047s
      CA Ramda.match    255.147k (± 1.1%) i/s -      1.291M in   5.062388s

Comparison:
        String#match:  2012457.8 i/s
         Ramda.match:   493402.3 i/s - 4.08x  slower
       C Ramda.match:   317353.7 i/s - 6.34x  slower
      CA Ramda.match:   255146.6 i/s - 7.89x  slower


```

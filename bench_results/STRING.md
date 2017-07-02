[Code](../bench/string/match.rb)

```sh
$ ruby -v bench/string/match.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
        String#match   123.914k i/100ms
         Ramda.match    47.692k i/100ms
       C Ramda.match    29.559k i/100ms
      CA Ramda.match    21.728k i/100ms
Calculating -------------------------------------
        String#match      1.996M (± 2.2%) i/s -     10.037M in   5.031899s
         Ramda.match    628.551k (± 8.8%) i/s -      3.148M in   5.062769s
       C Ramda.match    386.282k (± 2.0%) i/s -      1.951M in   5.052474s
      CA Ramda.match    288.611k (± 7.6%) i/s -      1.434M in   5.013530s

Comparison:
        String#match:  1995666.6 i/s
         Ramda.match:   628551.3 i/s - 3.18x  slower
       C Ramda.match:   386282.0 i/s - 5.17x  slower
      CA Ramda.match:   288610.9 i/s - 6.91x  slower


```

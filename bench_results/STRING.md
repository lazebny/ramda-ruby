[Code](../bench/string/match.rb)

```sh
$ ruby -v bench/string/match.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
        String#match   126.591k i/100ms
         Ramda.match    41.413k i/100ms
       C Ramda.match    27.077k i/100ms
      CA Ramda.match    22.075k i/100ms
Calculating -------------------------------------
        String#match      1.966M (± 3.0%) i/s -      9.874M in   5.028084s
         Ramda.match    537.596k (± 2.8%) i/s -      2.692M in   5.011621s
       C Ramda.match    331.260k (± 1.9%) i/s -      1.679M in   5.069652s
      CA Ramda.match    255.061k (± 4.5%) i/s -      1.280M in   5.032187s

Comparison:
        String#match:  1965780.5 i/s
         Ramda.match:   537596.2 i/s - 3.66x  slower
       C Ramda.match:   331259.5 i/s - 5.93x  slower
      CA Ramda.match:   255061.1 i/s - 7.71x  slower


```

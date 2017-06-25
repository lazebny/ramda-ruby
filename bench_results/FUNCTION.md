[Code](../bench/function/compose.rb)

```sh
$ ruby -v bench/function/compose.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
        Ruby compose   201.181k i/100ms
       Ramda.compose    21.367k i/100ms
Calculating -------------------------------------
        Ruby compose      5.857M (± 3.4%) i/s -     29.372M in   5.022187s
       Ramda.compose    240.154k (± 3.9%) i/s -      1.218M in   5.080074s

Comparison:
        Ruby compose:  5856571.7 i/s
       Ramda.compose:   240153.8 i/s - 24.39x  slower


```

[Code](../bench/function/curry.rb)

```sh
$ ruby -v bench/function/curry.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
              Method   191.455k i/100ms
           Proc.call   150.454k i/100ms
         Proc.curry0    57.791k i/100ms
         Proc.curry1    38.183k i/100ms
       Method.curry0    39.514k i/100ms
       Method.curry1    26.761k i/100ms
       C Ramda.curry    13.519k i/100ms
      CA Ramda.curry    13.008k i/100ms
Calculating -------------------------------------
              Method      4.728M (± 3.7%) i/s -     23.740M in   5.029935s
           Proc.call      2.909M (± 1.4%) i/s -     14.594M in   5.018392s
         Proc.curry0    788.273k (± 1.8%) i/s -      3.988M in   5.060328s
         Proc.curry1    472.671k (± 1.7%) i/s -      2.367M in   5.010012s
       Method.curry0    499.253k (± 2.4%) i/s -      2.529M in   5.068320s
       Method.curry1    346.107k (± 2.5%) i/s -      1.739M in   5.028991s
       C Ramda.curry    165.219k (± 4.1%) i/s -    824.659k in   5.000145s
      CA Ramda.curry    139.484k (± 5.4%) i/s -    702.432k in   5.051358s

Comparison:
              Method:  4728199.2 i/s
           Proc.call:  2908721.3 i/s - 1.63x  slower
         Proc.curry0:   788273.2 i/s - 6.00x  slower
       Method.curry0:   499253.3 i/s - 9.47x  slower
         Proc.curry1:   472670.7 i/s - 10.00x  slower
       Method.curry1:   346106.8 i/s - 13.66x  slower
       C Ramda.curry:   165218.7 i/s - 28.62x  slower
      CA Ramda.curry:   139483.5 i/s - 33.90x  slower


```

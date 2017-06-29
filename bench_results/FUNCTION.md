[Code](../bench/function/compose.rb)

```sh
$ ruby -v bench/function/compose.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
        Ruby compose   200.956k i/100ms
       Ramda.compose    21.171k i/100ms
Calculating -------------------------------------
        Ruby compose      5.588M (± 2.9%) i/s -     27.933M in   5.003577s
       Ramda.compose    237.507k (± 2.7%) i/s -      1.207M in   5.084774s

Comparison:
        Ruby compose:  5588354.6 i/s
       Ramda.compose:   237506.7 i/s - 23.53x  slower


```

[Code](../bench/function/curry.rb)

```sh
$ ruby -v bench/function/curry.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
              Method   163.361k i/100ms
           Proc.call   132.871k i/100ms
         Proc.curry0    55.580k i/100ms
         Proc.curry1    37.201k i/100ms
       Method.curry0    40.259k i/100ms
       Method.curry1    28.994k i/100ms
       C Ramda.curry    14.127k i/100ms
      CA Ramda.curry    13.090k i/100ms
Calculating -------------------------------------
              Method      4.695M (± 2.9%) i/s -     23.524M in   5.015082s
           Proc.call      2.835M (± 2.6%) i/s -     14.217M in   5.018983s
         Proc.curry0    784.092k (± 2.5%) i/s -      3.946M in   5.036159s
         Proc.curry1    472.527k (± 2.6%) i/s -      2.381M in   5.042137s
       Method.curry0    493.926k (± 3.6%) i/s -      2.496M in   5.060243s
       Method.curry1    344.338k (± 4.2%) i/s -      1.740M in   5.061722s
       C Ramda.curry    161.708k (± 3.9%) i/s -    819.366k in   5.075216s
      CA Ramda.curry    139.641k (± 3.9%) i/s -    706.860k in   5.070310s

Comparison:
              Method:  4695476.3 i/s
           Proc.call:  2834866.5 i/s - 1.66x  slower
         Proc.curry0:   784092.0 i/s - 5.99x  slower
       Method.curry0:   493926.1 i/s - 9.51x  slower
         Proc.curry1:   472526.9 i/s - 9.94x  slower
       Method.curry1:   344337.9 i/s - 13.64x  slower
       C Ramda.curry:   161708.5 i/s - 29.04x  slower
      CA Ramda.curry:   139641.2 i/s - 33.63x  slower


```

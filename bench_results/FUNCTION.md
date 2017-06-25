[Code](../bench/function/compose.rb)

```sh
$ ruby -v bench/function/compose.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
        Ruby compose   210.151k i/100ms
       Ramda.compose    22.200k i/100ms
Calculating -------------------------------------
        Ruby compose      6.267M (± 3.1%) i/s -     31.312M in   5.002479s
       Ramda.compose    263.145k (± 5.2%) i/s -      1.332M in   5.078388s

Comparison:
        Ruby compose:  6266670.9 i/s
       Ramda.compose:   263145.1 i/s - 23.81x  slower


```

[Code](../bench/function/curry.rb)

```sh
$ ruby -v bench/function/curry.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
              Method   181.983k i/100ms
           Proc.call   142.373k i/100ms
         Proc.curry0    56.317k i/100ms
         Proc.curry1    39.747k i/100ms
       Method.curry0    40.605k i/100ms
       Method.curry1    28.923k i/100ms
       C Ramda.curry    15.155k i/100ms
      CA Ramda.curry    12.776k i/100ms
Calculating -------------------------------------
              Method      4.651M (± 6.1%) i/s -     23.294M in   5.031364s
           Proc.call      2.884M (± 4.2%) i/s -     14.522M in   5.049270s
         Proc.curry0    761.914k (± 6.6%) i/s -      3.830M in   5.052607s
         Proc.curry1    471.160k (± 4.9%) i/s -      2.385M in   5.075564s
       Method.curry0    486.689k (± 5.5%) i/s -      2.436M in   5.022438s
       Method.curry1    339.750k (± 5.6%) i/s -      1.706M in   5.041140s
       C Ramda.curry    159.935k (± 7.1%) i/s -    803.215k in   5.050074s
      CA Ramda.curry    138.637k (± 5.5%) i/s -    702.680k in   5.084751s

Comparison:
              Method:  4650886.8 i/s
           Proc.call:  2883564.6 i/s - 1.61x  slower
         Proc.curry0:   761913.7 i/s - 6.10x  slower
       Method.curry0:   486689.3 i/s - 9.56x  slower
         Proc.curry1:   471160.1 i/s - 9.87x  slower
       Method.curry1:   339749.6 i/s - 13.69x  slower
       C Ramda.curry:   159935.1 i/s - 29.08x  slower
      CA Ramda.curry:   138637.1 i/s - 33.55x  slower


```

[Code](../bench/function/compose.rb)

```sh
$ ruby -v bench/function/compose.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
        Ruby compose   199.701k i/100ms
       Ramda.compose    24.318k i/100ms
Calculating -------------------------------------
        Ruby compose      5.825M (± 3.1%) i/s -     29.156M in   5.012256s
       Ramda.compose    279.241k (± 3.1%) i/s -      1.410M in   5.056196s

Comparison:
        Ruby compose:  5824616.0 i/s
       Ramda.compose:   279241.0 i/s - 20.86x  slower


```

[Code](../bench/function/curry.rb)

```sh
$ ruby -v bench/function/curry.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
              Method   172.206k i/100ms
           Proc.call   135.288k i/100ms
          Proc.curry   105.389k i/100ms
       C Ramda.curry    61.773k i/100ms
      CA Ramda.curry    64.086k i/100ms
Calculating -------------------------------------
              Method      4.475M (± 2.8%) i/s -     22.387M in   5.006349s
           Proc.call      2.882M (± 2.5%) i/s -     14.476M in   5.027103s
          Proc.curry      1.814M (± 1.9%) i/s -      9.169M in   5.056599s
       C Ramda.curry    910.383k (± 2.5%) i/s -      4.571M in   5.024689s
      CA Ramda.curry    962.881k (± 1.7%) i/s -      4.871M in   5.059821s

Comparison:
              Method:  4475267.5 i/s
           Proc.call:  2881536.7 i/s - 1.55x  slower
          Proc.curry:  1813924.9 i/s - 2.47x  slower
      CA Ramda.curry:   962881.4 i/s - 4.65x  slower
       C Ramda.curry:   910382.6 i/s - 4.92x  slower


```

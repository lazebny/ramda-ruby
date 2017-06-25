[Code](../bench/list/all.rb)

```sh
$ ruby -v bench/list/all.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
           Array#all   145.987k i/100ms
           Ramda.all    49.424k i/100ms
         C Ramda.all    28.151k i/100ms
        CA Ramda.all    22.539k i/100ms
Calculating -------------------------------------
           Array#all      2.357M (± 7.9%) i/s -     11.825M in   5.055006s
           Ramda.all    618.618k (±13.0%) i/s -      3.064M in   5.066570s
         C Ramda.all    398.342k (± 5.9%) i/s -      1.999M in   5.038749s
        CA Ramda.all    292.930k (± 7.3%) i/s -      1.465M in   5.032354s

Comparison:
           Array#all:  2356717.6 i/s
           Ramda.all:   618618.3 i/s - 3.81x  slower
         C Ramda.all:   398342.2 i/s - 5.92x  slower
        CA Ramda.all:   292929.9 i/s - 8.05x  slower


```

[Code](../bench/list/any.rb)

```sh
$ ruby -v bench/list/any.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
           Array#any    27.375k i/100ms
           Ramda.any    20.286k i/100ms
         C Ramda.any    16.935k i/100ms
        CA Ramda.any    14.782k i/100ms
Calculating -------------------------------------
           Array#any    298.186k (± 2.9%) i/s -      1.506M in   5.053729s
           Ramda.any    230.083k (± 4.2%) i/s -      1.156M in   5.035318s
         C Ramda.any    180.753k (± 6.4%) i/s -    914.490k in   5.083309s
        CA Ramda.any    156.997k (± 6.5%) i/s -    783.446k in   5.013122s

Comparison:
           Array#any:   298186.2 i/s
           Ramda.any:   230083.3 i/s - 1.30x  slower
         C Ramda.any:   180752.8 i/s - 1.65x  slower
        CA Ramda.any:   156996.7 i/s - 1.90x  slower


```

[Code](../bench/list/append.rb)

```sh
$ ruby -v bench/list/append.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
             Array#+   147.021k i/100ms
        Ramda.append    46.018k i/100ms
      C Ramda.append    33.513k i/100ms
     CA Ramda.append    26.422k i/100ms
Calculating -------------------------------------
             Array#+      2.663M (± 3.3%) i/s -     13.379M in   5.028793s
        Ramda.append    599.286k (±10.0%) i/s -      2.991M in   5.064053s
      C Ramda.append    378.806k (± 6.8%) i/s -      1.910M in   5.069356s
     CA Ramda.append    300.665k (± 4.9%) i/s -      1.506M in   5.021776s

Comparison:
             Array#+:  2663389.4 i/s
        Ramda.append:   599285.8 i/s - 4.44x  slower
      C Ramda.append:   378806.2 i/s - 7.03x  slower
     CA Ramda.append:   300664.8 i/s - 8.86x  slower


```

[Code](../bench/list/map.rb)

```sh
$ ruby -v bench/list/map.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
           Array#map    16.467k i/100ms
           Ramda.map    13.412k i/100ms
         C Ramda.map    11.679k i/100ms
        CA Ramda.map    10.223k i/100ms
Calculating -------------------------------------
           Array#map    187.169k (± 4.1%) i/s -    938.619k in   5.025465s
           Ramda.map    143.213k (± 0.9%) i/s -    724.248k in   5.057549s
         C Ramda.map    120.462k (± 5.9%) i/s -    607.308k in   5.068714s
        CA Ramda.map    112.882k (± 1.6%) i/s -    572.488k in   5.072958s

Comparison:
           Array#map:   187169.5 i/s
           Ramda.map:   143213.3 i/s - 1.31x  slower
         C Ramda.map:   120461.5 i/s - 1.55x  slower
        CA Ramda.map:   112882.0 i/s - 1.66x  slower


```

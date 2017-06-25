[Code](../bench/list/all.rb)

```sh
$ ruby -v bench/list/all.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
           Array#all    77.401k i/100ms
           Ramda.all    27.392k i/100ms
         C Ramda.all    18.190k i/100ms
        CA Ramda.all    14.078k i/100ms
Calculating -------------------------------------
           Array#all      1.336M (± 4.8%) i/s -      6.734M in   5.053966s
           Ramda.all    353.765k (± 4.4%) i/s -      1.780M in   5.045097s
         C Ramda.all    217.545k (± 4.7%) i/s -      1.091M in   5.030257s
        CA Ramda.all    162.398k (± 1.3%) i/s -    816.524k in   5.028813s

Comparison:
           Array#all:  1336460.3 i/s
           Ramda.all:   353764.7 i/s - 3.78x  slower
         C Ramda.all:   217545.0 i/s - 6.14x  slower
        CA Ramda.all:   162398.3 i/s - 8.23x  slower


```

[Code](../bench/list/any.rb)

```sh
$ ruby -v bench/list/any.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
           Array#any    14.270k i/100ms
           Ramda.any    10.273k i/100ms
         C Ramda.any     8.640k i/100ms
        CA Ramda.any     7.705k i/100ms
Calculating -------------------------------------
           Array#any    152.847k (± 0.7%) i/s -    770.580k in   5.041731s
           Ramda.any    113.928k (± 0.7%) i/s -    575.288k in   5.049828s
         C Ramda.any     94.225k (± 0.9%) i/s -    475.200k in   5.043649s
        CA Ramda.any     83.198k (± 0.8%) i/s -    416.070k in   5.001284s

Comparison:
           Array#any:   152847.5 i/s
           Ramda.any:   113928.3 i/s - 1.34x  slower
         C Ramda.any:    94224.9 i/s - 1.62x  slower
        CA Ramda.any:    83198.3 i/s - 1.84x  slower


```

[Code](../bench/list/append.rb)

```sh
$ ruby -v bench/list/append.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
             Array#+    83.756k i/100ms
        Ramda.append    25.782k i/100ms
      C Ramda.append    18.050k i/100ms
     CA Ramda.append    14.551k i/100ms
Calculating -------------------------------------
             Array#+      1.554M (± 2.1%) i/s -      7.789M in   5.016231s
        Ramda.append    331.857k (± 1.4%) i/s -      1.676M in   5.050819s
      C Ramda.append    213.022k (± 1.3%) i/s -      1.083M in   5.084918s
     CA Ramda.append    166.543k (± 2.5%) i/s -    843.958k in   5.070777s

Comparison:
             Array#+:  1553585.5 i/s
        Ramda.append:   331857.1 i/s - 4.68x  slower
      C Ramda.append:   213022.0 i/s - 7.29x  slower
     CA Ramda.append:   166542.7 i/s - 9.33x  slower


```

[Code](../bench/list/map.rb)

```sh
$ ruby -v bench/list/map.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
           Array#map     7.974k i/100ms
           Ramda.map     6.374k i/100ms
         C Ramda.map     5.774k i/100ms
        CA Ramda.map     5.298k i/100ms
Calculating -------------------------------------
           Array#map     82.584k (± 1.2%) i/s -    414.648k in   5.021657s
           Ramda.map     67.571k (± 1.1%) i/s -    337.822k in   5.000119s
         C Ramda.map     61.159k (± 2.8%) i/s -    306.022k in   5.008188s
        CA Ramda.map     57.192k (± 4.5%) i/s -    286.092k in   5.014351s

Comparison:
           Array#map:    82584.4 i/s
           Ramda.map:    67571.4 i/s - 1.22x  slower
         C Ramda.map:    61159.2 i/s - 1.35x  slower
        CA Ramda.map:    57192.1 i/s - 1.44x  slower


```

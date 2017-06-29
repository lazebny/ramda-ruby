[Code](../bench/list/all.rb)

```sh
$ ruby -v bench/list/all.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
           Array#all    79.022k i/100ms
           Ramda.all    26.060k i/100ms
         C Ramda.all    15.856k i/100ms
        CA Ramda.all    13.141k i/100ms
Calculating -------------------------------------
           Array#all      1.250M (± 9.6%) i/s -      6.243M in   5.057933s
           Ramda.all    329.692k (± 8.9%) i/s -      1.642M in   5.035350s
         C Ramda.all    208.006k (± 6.6%) i/s -      1.046M in   5.059745s
        CA Ramda.all    154.820k (± 7.7%) i/s -    775.319k in   5.044023s

Comparison:
           Array#all:  1249684.1 i/s
           Ramda.all:   329691.7 i/s - 3.79x  slower
         C Ramda.all:   208005.9 i/s - 6.01x  slower
        CA Ramda.all:   154819.9 i/s - 8.07x  slower


```

[Code](../bench/list/any.rb)

```sh
$ ruby -v bench/list/any.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
           Array#any    14.063k i/100ms
           Ramda.any    10.290k i/100ms
         C Ramda.any     7.558k i/100ms
        CA Ramda.any     7.389k i/100ms
Calculating -------------------------------------
           Array#any    141.227k (±10.6%) i/s -    703.150k in   5.049979s
           Ramda.any    106.677k (± 8.7%) i/s -    535.080k in   5.057870s
         C Ramda.any     92.607k (± 3.0%) i/s -    468.596k in   5.064711s
        CA Ramda.any     78.095k (± 8.2%) i/s -    391.617k in   5.057091s

Comparison:
           Array#any:   141227.0 i/s
           Ramda.any:   106676.5 i/s - 1.32x  slower
         C Ramda.any:    92606.9 i/s - 1.53x  slower
        CA Ramda.any:    78095.2 i/s - 1.81x  slower


```

[Code](../bench/list/append.rb)

```sh
$ ruby -v bench/list/append.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
             Array#+    77.702k i/100ms
        Ramda.append    25.015k i/100ms
      C Ramda.append    16.519k i/100ms
     CA Ramda.append    13.457k i/100ms
Calculating -------------------------------------
             Array#+      1.430M (±10.1%) i/s -      7.071M in   5.005575s
        Ramda.append    323.238k (±10.9%) i/s -      1.601M in   5.032078s
      C Ramda.append    217.452k (± 6.5%) i/s -      1.090M in   5.041131s
     CA Ramda.append    161.271k (± 6.2%) i/s -    807.420k in   5.029886s

Comparison:
             Array#+:  1430403.7 i/s
        Ramda.append:   323238.1 i/s - 4.43x  slower
      C Ramda.append:   217451.8 i/s - 6.58x  slower
     CA Ramda.append:   161270.6 i/s - 8.87x  slower


```

[Code](../bench/list/map.rb)

```sh
$ ruby -v bench/list/map.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
           Array#map     7.730k i/100ms
           Ramda.map     6.253k i/100ms
         C Ramda.map     4.883k i/100ms
        CA Ramda.map     4.735k i/100ms
Calculating -------------------------------------
           Array#map     79.664k (± 9.6%) i/s -    394.230k in   5.004043s
           Ramda.map     68.798k (± 3.1%) i/s -    343.915k in   5.004032s
         C Ramda.map     61.645k (± 2.4%) i/s -    312.512k in   5.072656s
        CA Ramda.map     55.961k (± 5.5%) i/s -    279.365k in   5.009921s

Comparison:
           Array#map:    79664.3 i/s
           Ramda.map:    68798.2 i/s - 1.16x  slower
         C Ramda.map:    61645.5 i/s - 1.29x  slower
        CA Ramda.map:    55961.2 i/s - 1.42x  slower


```

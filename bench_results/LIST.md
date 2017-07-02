[Code](../bench/list/all.rb)

```sh
$ ruby -v bench/list/all.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
           Array#all    78.579k i/100ms
           Ramda.all    31.803k i/100ms
         C Ramda.all    20.851k i/100ms
        CA Ramda.all    15.853k i/100ms
Calculating -------------------------------------
           Array#all      1.322M (± 3.1%) i/s -      6.679M in   5.056336s
           Ramda.all    415.865k (±12.6%) i/s -      2.035M in   5.023699s
         C Ramda.all    255.882k (± 3.6%) i/s -      1.293M in   5.060079s
        CA Ramda.all    184.662k (± 3.1%) i/s -    935.327k in   5.070336s

Comparison:
           Array#all:  1322394.1 i/s
           Ramda.all:   415865.5 i/s - 3.18x  slower
         C Ramda.all:   255881.7 i/s - 5.17x  slower
        CA Ramda.all:   184662.2 i/s - 7.16x  slower


```

[Code](../bench/list/any.rb)

```sh
$ ruby -v bench/list/any.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
           Array#any    13.865k i/100ms
           Ramda.any    10.925k i/100ms
         C Ramda.any     9.095k i/100ms
        CA Ramda.any     8.044k i/100ms
Calculating -------------------------------------
           Array#any    149.617k (± 5.0%) i/s -    748.710k in   5.021474s
           Ramda.any    113.890k (±12.7%) i/s -    557.175k in   5.009868s
         C Ramda.any     98.636k (± 2.4%) i/s -    500.225k in   5.074447s
        CA Ramda.any     85.775k (± 1.3%) i/s -    434.376k in   5.065018s

Comparison:
           Array#any:   149616.8 i/s
           Ramda.any:   113889.6 i/s - 1.31x  slower
         C Ramda.any:    98636.0 i/s - 1.52x  slower
        CA Ramda.any:    85775.0 i/s - 1.74x  slower


```

[Code](../bench/list/append.rb)

```sh
$ ruby -v bench/list/append.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
             Array#+    89.729k i/100ms
        Ramda.append    31.285k i/100ms
      C Ramda.append    20.996k i/100ms
     CA Ramda.append    16.171k i/100ms
Calculating -------------------------------------
             Array#+      1.547M (± 2.8%) i/s -      7.806M in   5.050427s
        Ramda.append    384.766k (±10.6%) i/s -      1.908M in   5.042390s
      C Ramda.append    246.361k (± 5.2%) i/s -      1.239M in   5.044613s
     CA Ramda.append    181.351k (± 5.3%) i/s -    905.576k in   5.010010s

Comparison:
             Array#+:  1546948.1 i/s
        Ramda.append:   384765.6 i/s - 4.02x  slower
      C Ramda.append:   246360.8 i/s - 6.28x  slower
     CA Ramda.append:   181350.8 i/s - 8.53x  slower


```

[Code](../bench/list/map.rb)

```sh
$ ruby -v bench/list/map.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
           Array#map     7.790k i/100ms
           Ramda.map     6.720k i/100ms
         C Ramda.map     6.032k i/100ms
        CA Ramda.map     5.436k i/100ms
Calculating -------------------------------------
           Array#map     82.804k (± 1.8%) i/s -    420.660k in   5.082046s
           Ramda.map     66.957k (±11.4%) i/s -    329.280k in   5.000794s
         C Ramda.map     64.663k (± 3.8%) i/s -    325.728k in   5.045904s
        CA Ramda.map     59.583k (± 6.0%) i/s -    298.980k in   5.042270s

Comparison:
           Array#map:    82804.2 i/s
           Ramda.map:    66957.0 i/s - 1.24x  slower
         C Ramda.map:    64663.2 i/s - 1.28x  slower
        CA Ramda.map:    59582.6 i/s - 1.39x  slower


```

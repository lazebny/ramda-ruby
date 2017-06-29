[Code](../bench/object/assoc.rb)

```sh
$ ruby -v bench/object/assoc.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
          Hash#merge    59.152k i/100ms
         Ramda.assoc    29.472k i/100ms
       C Ramda.assoc    21.849k i/100ms
      CA Ramda.assoc    15.582k i/100ms
Calculating -------------------------------------
          Hash#merge    719.022k (± 2.4%) i/s -      3.608M in   5.021087s
         Ramda.assoc    348.529k (± 3.4%) i/s -      1.768M in   5.080326s
       C Ramda.assoc    250.775k (± 2.5%) i/s -      1.267M in   5.056581s
      CA Ramda.assoc    169.510k (± 4.2%) i/s -    857.010k in   5.065712s

Comparison:
          Hash#merge:   719022.5 i/s
         Ramda.assoc:   348528.5 i/s - 2.06x  slower
       C Ramda.assoc:   250775.2 i/s - 2.87x  slower
      CA Ramda.assoc:   169510.5 i/s - 4.24x  slower


```

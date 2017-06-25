[Code](../bench/object/assoc.rb)

```sh
$ ruby -v bench/object/assoc.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
          Hash#merge    59.235k i/100ms
         Ramda.assoc    25.475k i/100ms
       C Ramda.assoc    21.305k i/100ms
      CA Ramda.assoc    15.632k i/100ms
Calculating -------------------------------------
          Hash#merge    762.360k (± 0.8%) i/s -      3.850M in   5.050804s
         Ramda.assoc    317.758k (± 1.1%) i/s -      1.605M in   5.051337s
       C Ramda.assoc    257.163k (± 6.2%) i/s -      1.278M in   5.000358s
      CA Ramda.assoc    180.899k (± 1.1%) i/s -    906.656k in   5.012598s

Comparison:
          Hash#merge:   762359.8 i/s
         Ramda.assoc:   317758.2 i/s - 2.40x  slower
       C Ramda.assoc:   257162.6 i/s - 2.96x  slower
      CA Ramda.assoc:   180898.8 i/s - 4.21x  slower


```

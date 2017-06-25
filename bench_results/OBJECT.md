[Code](../bench/object/assoc.rb)

```sh
$ ruby -v bench/object/assoc.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
          Hash#merge    53.698k i/100ms
         Ramda.assoc    26.930k i/100ms
       C Ramda.assoc    21.737k i/100ms
      CA Ramda.assoc    15.483k i/100ms
Calculating -------------------------------------
          Hash#merge    748.736k (± 1.1%) i/s -      3.759M in   5.020858s
         Ramda.assoc    350.814k (± 0.8%) i/s -      1.777M in   5.066799s
       C Ramda.assoc    246.002k (± 4.2%) i/s -      1.239M in   5.047426s
      CA Ramda.assoc    170.484k (± 4.4%) i/s -    851.565k in   5.006909s

Comparison:
          Hash#merge:   748736.0 i/s
         Ramda.assoc:   350814.0 i/s - 2.13x  slower
       C Ramda.assoc:   246001.7 i/s - 3.04x  slower
      CA Ramda.assoc:   170484.2 i/s - 4.39x  slower


```

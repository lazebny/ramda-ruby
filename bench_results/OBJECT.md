[Code](../bench/object/assoc.rb)

```sh
$ ruby -v bench/object/assoc.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
          Hash#merge    58.683k i/100ms
         Ramda.assoc    28.762k i/100ms
       C Ramda.assoc    22.252k i/100ms
      CA Ramda.assoc    16.058k i/100ms
Calculating -------------------------------------
          Hash#merge    766.824k (± 1.9%) i/s -      3.873M in   5.052569s
         Ramda.assoc    347.227k (± 2.8%) i/s -      1.754M in   5.056985s
       C Ramda.assoc    280.992k (± 2.4%) i/s -      1.424M in   5.071276s
      CA Ramda.assoc    182.419k (± 2.7%) i/s -    915.306k in   5.021538s

Comparison:
          Hash#merge:   766823.5 i/s
         Ramda.assoc:   347227.4 i/s - 2.21x  slower
       C Ramda.assoc:   280991.7 i/s - 2.73x  slower
      CA Ramda.assoc:   182419.5 i/s - 4.20x  slower


```

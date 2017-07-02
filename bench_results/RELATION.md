[Code](../bench/relation/min.rb)

```sh
$ ruby -v bench/relation/min.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
           Array#min   125.628k i/100ms
           Ramda.min    58.151k i/100ms
         C Ramda.min    34.790k i/100ms
        CA Ramda.min    27.910k i/100ms
Calculating -------------------------------------
           Array#min      2.168M (± 2.1%) i/s -     10.930M in   5.042873s
           Ramda.min    782.893k (± 2.2%) i/s -      3.954M in   5.053540s
         C Ramda.min    439.560k (± 6.7%) i/s -      2.192M in   5.016234s
        CA Ramda.min    316.978k (± 6.8%) i/s -      1.591M in   5.053651s

Comparison:
           Array#min:  2168389.7 i/s
           Ramda.min:   782892.5 i/s - 2.77x  slower
         C Ramda.min:   439560.2 i/s - 4.93x  slower
        CA Ramda.min:   316978.5 i/s - 6.84x  slower


```

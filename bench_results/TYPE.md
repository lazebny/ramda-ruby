[Code](../bench/type/is.rb)

```sh
$ ruby -v bench/type/is.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
        Object#is_a?   233.503k i/100ms
            Ramda.is    57.498k i/100ms
          C Ramda.is    36.820k i/100ms
         CA Ramda.is    28.354k i/100ms
Calculating -------------------------------------
        Object#is_a?      6.177M (± 6.5%) i/s -     30.822M in   5.017684s
            Ramda.is    775.244k (± 2.0%) i/s -      3.910M in   5.045574s
          C Ramda.is    453.233k (± 2.7%) i/s -      2.283M in   5.040603s
         CA Ramda.is    328.541k (± 3.9%) i/s -      1.645M in   5.014548s

Comparison:
        Object#is_a?:  6177500.0 i/s
            Ramda.is:   775244.0 i/s - 7.97x  slower
          C Ramda.is:   453232.8 i/s - 13.63x  slower
         CA Ramda.is:   328540.6 i/s - 18.80x  slower


```

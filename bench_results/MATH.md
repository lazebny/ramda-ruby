[Code](../bench/math/add.rb)

```sh
$ ruby -v bench/math/add.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
           Integer#+   213.710k i/100ms
           Ramda.add    74.018k i/100ms
         C Ramda.add    41.713k i/100ms
        CA Ramda.add    30.144k i/100ms
Calculating -------------------------------------
           Integer#+      5.326M (± 5.0%) i/s -     26.714M in   5.033985s
           Ramda.add    993.846k (± 3.0%) i/s -      5.033M in   5.069347s
         C Ramda.add    511.867k (± 1.7%) i/s -      2.586M in   5.054032s
        CA Ramda.add    352.273k (± 3.2%) i/s -      1.778M in   5.054342s

Comparison:
           Integer#+:  5325693.4 i/s
           Ramda.add:   993845.5 i/s - 5.36x  slower
         C Ramda.add:   511866.7 i/s - 10.40x  slower
        CA Ramda.add:   352273.1 i/s - 15.12x  slower


```

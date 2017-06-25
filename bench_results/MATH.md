[Code](../bench/math/add.rb)

```sh
$ ruby -v bench/math/add.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
           Integer#+   213.286k i/100ms
           Ramda.add    56.623k i/100ms
         C Ramda.add    35.228k i/100ms
        CA Ramda.add    27.474k i/100ms
Calculating -------------------------------------
           Integer#+      5.286M (± 3.4%) i/s -     26.447M in   5.010804s
           Ramda.add    752.597k (± 0.8%) i/s -      3.794M in   5.041211s
         C Ramda.add    440.343k (± 1.1%) i/s -      2.219M in   5.040706s
        CA Ramda.add    324.787k (± 1.3%) i/s -      1.648M in   5.076366s

Comparison:
           Integer#+:  5286020.7 i/s
           Ramda.add:   752597.4 i/s - 7.02x  slower
         C Ramda.add:   440342.6 i/s - 12.00x  slower
        CA Ramda.add:   324786.9 i/s - 16.28x  slower


```

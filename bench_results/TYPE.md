[Code](../bench/type/is.rb)

```sh
$ ruby -v bench/type/is.rb
ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]
Warming up --------------------------------------
        Object#is_a?   227.005k i/100ms
            Ramda.is    56.454k i/100ms
          C Ramda.is    36.108k i/100ms
         CA Ramda.is    27.560k i/100ms
Calculating -------------------------------------
        Object#is_a?      6.349M (± 5.7%) i/s -     31.781M in   5.028539s
            Ramda.is    778.661k (± 0.9%) i/s -      3.895M in   5.003019s
          C Ramda.is    464.606k (± 1.6%) i/s -      2.347M in   5.053005s
         CA Ramda.is    337.982k (± 1.9%) i/s -      1.709M in   5.057470s

Comparison:
        Object#is_a?:  6348990.8 i/s
            Ramda.is:   778661.3 i/s - 8.15x  slower
          C Ramda.is:   464606.3 i/s - 13.67x  slower
         CA Ramda.is:   337982.0 i/s - 18.78x  slower


```

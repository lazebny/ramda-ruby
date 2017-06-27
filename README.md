Ramda Ruby
=============

This is a ruby version of [Ramda Js](http://ramdajs.com) library.

[![Gem Version](https://badge.fury.io/rb/ramda-ruby.svg)](http://badge.fury.io/rb/ramda-ruby)
[![Travis badge](https://travis-ci.org/lazebny/ramda-ruby.svg?branch=master)](https://travis-ci.org/lazebny/ramda-ruby)
[![AppVeyor status](https://ci.appveyor.com/api/projects/status/ponccdax7aj4ufw2?svg=true)](https://ci.appveyor.com/project/lazebny/ramda-ruby)
[![Coverage Status](https://coveralls.io/repos/lazebny/ramda-ruby/badge.png)](https://coveralls.io/r/lazebny/ramda-ruby)
[![Code Climate Badge](https://codeclimate.com/github/lazebny/ramda-ruby.svg)](https://codeclimate.com/github/lazebny/ramda-ruby)
[![Inch CI](http://inch-ci.org/github/lazebny/ramda-ruby.svg)](http://inch-ci.org/github/lazebny/ramda-ruby)
[![Dependency Status](https://gemnasium.com/lazebny/ramda-ruby.svg)](https://gemnasium.com/lazebny/ramda-ruby)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)

Problems
------------

This gem is stable but i think it isn't production ready - benchmarks
are showing a huge performance loss comparing to the plain ruby.


Installation
------------

Add this line to your application's Gemfile:

```ruby
gem 'ramda-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ramda-ruby

And then require:

```ruby
require 'ramda'
```


Documentation
-------------

Currently the gem doesn't have own documentation but it tries to follow specification from [Ramda Js](http://ramdajs.com/docs/)

* each release includes [functions](docs/FUNCTIONS.md) from the relevant [Ramda Js](http://ramdajs.com) release
* each release includes more functions which i found pretty useful but they are from upcoming releases

You could use [Ramda Js](http://ramdajs.com/docs/) as a source of documentation.

Ruby scpecific examples can be found in [tests](spec/ramda).


Usage
-------------

Pointless Style:


```ruby

  R = Ramda

  players = [
    { name: 'Andrey', score: 100 },
    { name: 'Ivan', score: 200 },
    { name: 'Masha', score: 150 }
  ]

  best_player = R.pipe(R.sort_by(R.prop(:score)), R.reverse, R.head, R.prop(:name))
  best_player.call(players) # Ivan

```

Placeholder:

```ruby

  reset_to_default = R.merge(R.__, x: 0)
  reset_to_default.call(x: 5, y: 2) # { x: 0, y: 2 }

```

Change Exceptions Handler:

```ruby

  # To use a default 'with_narrow' handler:
  Ramda.exception_handler = nil
  # the same as:
  Ramda.exception_handler = -> Ramda::ExceptionHandler.method(:with_narrow)

  # Set a custom handler:
  Ramda.exception_handler = -> (e, _method_name) { raise e, e.exception, e.backtrace }
  # the same as:
  Ramda.exception_handler = -> Ramda::ExceptionHandler.method(:default)

```


Benchmarks
-------------

* [Function](bench_results/FUNCTION.md)
* [List](bench_results/LIST.md)
* [Logic](bench_results/LOGIC.md)
* [Math](bench_results/MATH.md)
* [Object](bench_results/OBJECT.md)
* [Relation](bench_results/RELATION.md)
* [String](bench_results/STRING.md)
* [Type](bench_results/TYPE.md)

Send all results to STDOUT

```sh
bundle exec rake ramda:run_benchmark
```

Send one function type results to STDOUT

```sh
bundle exec rake ramda:run_benchmark[bench/list/*]
```

Update all files in [bench_results](bench_results)

```sh
bundle exec rake ramda:run_benchmark_to_file
```

Update one type of function in [bench_results](bench_results)

```sh
bundle exec rake ramda:run_benchmark_to_file[bench/list/*]
```


Development
--------------

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


Contributing
--------------

Bug reports and pull requests are welcome on GitHub at https://github.com/lazebny/ramda-ruby.


License
--------------

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


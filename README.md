Ramda Ruby
=============

This is a ruby version of [Ramda Js](http://ramdajs.com) library.

[![Gem Version](https://badge.fury.io/rb/ramda-ruby.svg)](http://badge.fury.io/rb/ramda-ruby)
[![Functions](https://img.shields.io/badge/Functions-171-green.svg)](docs/FUNCTIONS.md)
[![Travis badge](https://travis-ci.org/lazebny/ramda-ruby.svg?branch=master)](https://travis-ci.org/lazebny/ramda-ruby)
[![AppVeyor status](https://ci.appveyor.com/api/projects/status/ponccdax7aj4ufw2?svg=true)](https://ci.appveyor.com/project/lazebny/ramda-ruby)
[![Coverage Status](https://coveralls.io/repos/lazebny/ramda-ruby/badge.png)](https://coveralls.io/r/lazebny/ramda-ruby)
[![Code Climate Badge](https://codeclimate.com/github/lazebny/ramda-ruby.svg)](https://codeclimate.com/github/lazebny/ramda-ruby)
[![Inch CI](http://inch-ci.org/github/lazebny/ramda-ruby.svg)](http://inch-ci.org/github/lazebny/ramda-ruby)
[![Dependency Status](https://gemnasium.com/lazebny/ramda-ruby.svg)](https://gemnasium.com/lazebny/ramda-ruby)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)

Information
------------

This library uses some stuff like `curry` and `__` which reduces performance.
Please review benchmarks section.


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

* [Function](docs/FUNCTIONS.md#function)
* [List](docs/FUNCTIONS.md#list)
* [Logic](docs/FUNCTIONS.md#logic)
* [Math](docs/FUNCTIONS.md#math)
* [Object](docs/FUNCTIONS.md#object)
* [Relation](docs/FUNCTIONS.md#relation)
* [String](docs/FUNCTIONS.md#string)
* [Type](docs/FUNCTIONS.md#type)

You can use Ramda [docs](http://ramdajs.com/docs/) as a documentation
or to check Ruby [examples](spec/ramda).

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

Change exceptions handler:

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

Ramda in debug mode shows calls trace.
Notice: trace is shown only for Ramda functions and not for regular procs.
If you want to show a whole trace you can wrap your proc in Ramda.curry function
(pleaes see example below).

Enable debug mode:

```ruby

  Ramda.debug_mode = true

  # Example:

  Ramda.filter(Ramda.curry(->(n) { n.even? }), [1, 2, 3, 4])

  # -> curry(#<Proc:0x...@/srv/app/spec/ramda/list_spec.rb:130 (lambda)>) # #<Proc:0x... (lambda)>
  # -> curry(1) # false
  # -> curry(2) # true
  # -> curry(3) # false
  # -> curry(4) # true
  # -> filter(#<Proc:0x0055ff3fad4640 (lambda)>, 1, 2, 3, 4) # [2, 4]

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

You can use either regular approach with installing gems on local machine
or with docker-compose which is handy when you are playing with ruby versions.

With docker-compose:

1. Install [Docker](https://docs.docker.com/engine/installation/)
2. Install [Docker Compose](https://docs.docker.com/compose/install/)
3. Run tests

```sh

touch .bashrc.docker .pry_history.docker
docker-compose run --rm app bash
bundle
rspec

```

To release a new version, update the version number in `version.rb`,
and then run `bundle exec rake release`, which will create a git tag
for the version, push git commits and tags, and push the `.gem` file
to [rubygems.org](https://rubygems.org).


Contributing
--------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Make changes
4. Check with Rubocop and resolve all issues(`rubocop -aD`)
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create new Pull Request


License
--------------

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


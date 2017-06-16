# coding: utf-8

$LOAD_PATH <<  File.expand_path('../lib', __FILE__)

require 'ramda/version'

Gem::Specification.new do |s|
  s.name          = 'ramda-ruby'
  s.version       = Ramda::VERSION
  s.authors       = ['Vadim Lazebny']
  s.email         = ['vadim.lazebny@gmail.com']

  s.summary       = 'RamdaJs implementation for Ruby.'
  s.description   = 'A gem for porting RamdaJs tools for Ruby.'
  s.homepage      = 'https://github.com/lazebny/ramda-ruby'
  s.license       = 'MIT'

  s.files             = Dir['README*', 'LICENSE*', 'CHANGELOG*', 'ROADMAP*']
  s.files            += Dir['{lib}/**/*']
  s.test_files        = Dir['{spec}/**/*']
  s.extra_rdoc_files  = Dir['README*', 'LICENSE*', 'CHANGELOG*', 'ROADMAP*']
  s.extra_rdoc_files += Dir['{docs}/**/*.{txt,md}']
  s.require_paths     = ['lib']

	s.required_ruby_version = '>= 1.9.3'
end

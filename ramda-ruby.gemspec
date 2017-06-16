# coding: utf-8

$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'ramda/version'

Gem::Specification.new do |spec|
  spec.name          = 'ramda-ruby'
  spec.version       = Ramda::VERSION
  spec.authors       = ['Vadim Lazebny']
  spec.email         = ['vadim.lazebny@gmail.com']

  spec.summary       = 'RamdaJs implementation for Ruby.'
  spec.description   = 'A gem for porting RamdaJs tools for Ruby.'
  spec.homepage      = 'https://github.com/lazebny/ramda-ruby'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'http://example.com'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end

# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pebbles-path/version'

Gem::Specification.new do |gem|
  gem.name          = "pebbles-path"
  gem.version       = Pebbles::Path::VERSION
  gem.authors       = ["Katrina Owen"]
  gem.email         = ["katrina.owen@gmail.com"]
  gem.description   = %q{Provide pebble-compliant paths for ActiveRecord models.}
  gem.summary       = %q{Provides searchable, parseable pebble-compliant UID paths, e.g. (such as a.b.*) for Active Record models.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec'
  gem.add_dependency 'pebbles-uid', '>=0.0.6'
end

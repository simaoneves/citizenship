# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'citizenship/version'

Gem::Specification.new do |gem|
  gem.name          = "citizenship"
  gem.version       = Citizenship::VERSION
  gem.authors       = ["Runtime Revolution"]
  gem.description   = %q{citizenship checks validity of civil id numbers and similar}
  gem.summary       = %q{citizenship checks validity of civil id numbers and similar}
  gem.homepage      = "https://github.com/runtimerevolution/citizenship"
  gem.email         = 'info@runtime-revolution.com'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'i18n'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'pry'
end

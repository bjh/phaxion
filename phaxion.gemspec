# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'phaxion/version'

Gem::Specification.new do |gem|
  gem.name          = "phaxion"
  gem.version       = Phaxion::VERSION
  gem.authors       = ["bjh"]
  gem.email         = ["bjh@fake.fake"]
  gem.description   = %q{giving the Phaxio API a nice big hug.}
  gem.summary       = %q{Phaxio API wrapper}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency "httmultiparty"
  gem.add_runtime_dependency "active_support"
  gem.add_runtime_dependency "i18n"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "fakeweb"
end

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'greyn/version'

Gem::Specification.new do |spec|
  spec.name          = "greyn"
  spec.version       = Greyn::VERSION
  spec.authors       = ["Andrew Curry"]
  spec.email         = ["andrew.d.curry@gmail.com"]
  spec.summary       = %q{Easily convert a PNG to greyscale.}
  spec.description   = %q{Use greyn to convert any PNG to 3 greyscale versions at once - Luma, RGB Average, and Light.}
  spec.homepage      = "https://github.com/acurry/greyn"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "guard-rspec", "~> 4.3", ">= 4.3.1"

  spec.add_runtime_dependency "chunky_png", "~> 1.3", '>= 1.3.1'
end

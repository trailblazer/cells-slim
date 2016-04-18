lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "cell/slim/version"

Gem::Specification.new do |spec|
  spec.name          = "cells-slim"
  spec.version       = Cell::Slim::VERSION
  spec.authors       = ["Abdelkader Boudih", "Nick Sutterer"]
  spec.email         = %w(terminale@gmail.com apotonick@gmail.com)
  spec.summary       = "Slim integration for Cells."
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/trailblazer/cells-slim"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "cells", ">= 4.0.1", "< 6.0.0"
  spec.add_runtime_dependency "slim", "~> 3.0"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
end

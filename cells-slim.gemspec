# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'cells-slim'
  spec.version       = '0.0.1'
  spec.authors       = ['Abdelkader Boudih']
  spec.email         = ['terminale@gmail.com']
  spec.summary       = 'Slim support for cells 4'
  spec.description   = spec.summary
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'cells', '~> 4.0.0.alpha1'
  spec.add_runtime_dependency 'slim', '~> 3.0'
  spec.add_runtime_dependency 'tilt', '~> 2.0'
  spec.add_development_dependency 'bundler', '>= 1.6'
  spec.add_development_dependency 'rake', '~> 10.0'
end

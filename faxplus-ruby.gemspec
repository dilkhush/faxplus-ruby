# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "faxplus_api"
  spec.version       = "0.0.2"
  spec.authors       = ["Dilkhush Soni"]
  spec.email         = ["dilkhushsoni2010@gmail.com"]

  spec.summary       = %q{A simple wrapper around faxplus's API}
  spec.homepage      = "https://github.com/dilkhush/faxplus-ruby"
  spec.license       = "MIT"

  spec.files         = Dir["{lib}/**/*", "README.md"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 2.7.0'

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_runtime_dependency "rest-client", "~> 2.0.0"
  spec.add_runtime_dependency "json", "~> 2.0.0"
end
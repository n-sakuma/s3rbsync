# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 's3rbsync/version'

Gem::Specification.new do |spec|
  spec.name          = "s3rbsync"
  spec.version       = S3rbsync::VERSION
  spec.authors       = ["Naohiro Sakuma"]
  spec.email         = ["nao.bear@gmail.com"]
  spec.description   = %q{Synchronize the files to S3.}
  spec.summary       = %q{Synchronize the files to S3.}
  spec.homepage      = "https://github.com/n-sakuma/s3rbsync"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end

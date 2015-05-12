# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'RbFreeBSD/version'

Gem::Specification.new do |spec|
  spec.name          = "rbfreebsd"
  spec.version       = RbFreeBSD::VERSION
  spec.authors       = ["Andrey Cherkashin"]
  spec.email         = ["with.out@me.com"]
  spec.summary       = %q{Ruby bingings and wrappers around freebsd libs}

  spec.homepage      = "https://github.com/andoriyu/FreeBSD.rb"
  spec.license       = "BSD"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'ffi', '~> 1.9.6'

  spec.add_development_dependency 'codeclimate-test-reporter'
  spec.add_development_dependency 'awesome_print'
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rspec", "~> 3.2.0"
  spec.add_development_dependency "rake", "~> 10.0"
end

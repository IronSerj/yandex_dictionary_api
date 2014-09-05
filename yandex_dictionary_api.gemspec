# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yandex_dictionary_api/version'

Gem::Specification.new do |spec|
  spec.name          = "yandex_dictionary_api"
  spec.version       = YandexDictionaryApi::VERSION
  spec.authors       = ["IronSerj"]
  spec.email         = ["iron.serj@gmail.com"]
  spec.summary       = %q{Yandex dictionary API realization}
  spec.description   = %q{Yandex dictionary API realization}
  spec.homepage      = "https://github.com/IronSerj/yandex_dictionary_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "httpclient"
  spec.add_dependency "json"
  spec.add_development_dependency "rspec"
end


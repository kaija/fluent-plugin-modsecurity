# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name          = 'fluent-plugin-modsecurity'
  s.version       = '0.3'
  s.authors       = ['kaija']
  s.email         = ['kaija.chang@gmail.com']
  s.description   = %q{modsecurity filter plugin for Fluent event collector}
  s.summary       = s.description
  s.homepage      = 'https://github.com/kaija/fluent-plugin-modsecurity'
  s.license       = 'MIT'

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.required_ruby_version = Gem::Requirement.new(">= 2.0".freeze)

  s.add_runtime_dependency 'fluentd', '>= 0.10.43'
  s.add_runtime_dependency 'geoip'
  s.extra_rdoc_files = [
    "CHANGELOG",
    "README.rdoc"
  ]

  s.add_development_dependency 'rake', '>= 0'
  s.add_development_dependency 'test-unit', '~> 3.1.0'
  s.add_development_dependency 'minitest', '~> 5.8'
end
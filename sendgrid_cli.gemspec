# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sendgrid_cli/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["David Ryder"]
  gem.email         = ["david@libryder.com"]
  gem.description   = %q{Simple command line interface into sendgrid's web API}
  gem.summary       = %q{}
  gem.homepage      = "http://github.com/libryder/sendgrid_cli"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "sendgrid_cli"
  gem.require_paths = ["lib"]
  gem.version       = SendgridCli::VERSION
  
  gem.add_dependency 'httparty'
  gem.add_dependency 'json'
end

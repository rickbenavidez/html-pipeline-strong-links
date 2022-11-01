# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'html/pipeline/strong_links/version'

Gem::Specification.new do |spec|
  spec.name          = "html-pipeline-strong-links"
  spec.version       = HTML::Pipeline::StrongLinks::VERSION
  spec.authors       = ["Rick Benavidez"]
  spec.email         = ["rick@eighthbit.com"]

  spec.summary       = %q{Link filter for html-pipeline}
  spec.description   = %q{A html-pipeline filter that secures links that may be from questionable sources}
  spec.homepage      = "https://github.com/rickbenavidez/html-pipeline-strong-links"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "html-pipeline", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
end

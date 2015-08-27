# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'todo_manager/version'

Gem::Specification.new do |spec|
  spec.name          = "todo_manager"
  spec.version       = TodoManager::VERSION
  spec.authors       = ["Josh Nesbitt"]
  spec.email         = ["josh@wearestac.com"]
  spec.summary       = %q{The simplest of Todo Managers.}
  spec.description   = %q{Create, complete and track your todo list all from within your terminal.}
  spec.homepage      = "https://github.com/joshnesbitt/todo_manager"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "colorize", "0.7.7"
  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "3.3.0"
end

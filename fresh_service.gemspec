# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "fresh_service/version"

Gem::Specification.new do |spec|
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "bundler", "~> 2.2.10"
  spec.add_development_dependency "addressable"
  spec.add_development_dependency "webmock", "~> 3.14.0"
  spec.add_dependency "activesupport", ">= 4.2.7"
  spec.add_dependency "faraday", ">= 0.17.0"
  spec.add_dependency "faraday_middleware", ">= 0.11.0.1"
  spec.add_development_dependency "byebug", "~> 11.1.3"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.10"
  spec.add_development_dependency "rubocop-rails"
  spec.authors = ["Vikas Prasad"]
  spec.description = "Simple wrapper for the FreshService API"
  spec.email = ["vikas95prasad@gmail.com"]
  spec.files += Dir.glob("lib/**/*.rb")
  spec.homepage = "https://rubygems.org/gems/fresh_service"
  spec.licenses = ["MIT"]
  spec.name = "fresh_service"
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 2.6.0"
  spec.required_rubygems_version = ">= 1.3.5"
  spec.summary = "Ruby toolkit for working with the Fresh Service API v2"
  spec.version = FreshService::VERSION.dup
end
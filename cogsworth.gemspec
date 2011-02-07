# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "cogsworth/version"

Gem::Specification.new do |s|
  s.name        = "cogsworth"
  s.version     = Cogsworth::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jon buda"]
  s.email       = ["jon.buda@gmail.com"]
  s.homepage    = "http://jonbuda.com"
  s.summary     = %q{A simple natural language time parser for Ruby}
  s.description = %q{A simple natural language time parser for Ruby}

  s.rubyforge_project = "cogsworth"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_development_dependency('rspec', '>= 2.0.0')
end

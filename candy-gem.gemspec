# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "candy-gem/version"

Gem::Specification.new do |s|
  s.name        = "candy-gem"
  s.version     = Candy::Gem::VERSION
  s.authors     = ["Corprew Reed"]
  s.license     = "Copyright 2011 Monstrous Corporation"
  s.required_ruby_version = '>= 1.9.2'
  s.email       = ["github@corprew.org"]
  s.homepage    = "http://github.com/monstrous/candy-gem"
  s.summary     = %q{candy from strangers 'artist' gem}
  s.description = %q{This is an artist gem.  it is used for loading artist information into soniverse.  It is basically a great time.}



  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end

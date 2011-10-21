# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{candy-gem}
  s.version = "0.3.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Corprew Reed"]
  s.date = %q{2011-10-21}
  s.description = %q{Artist Gem for Candy}
  s.email = %q{github@corprew.org}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "candy-gem.gemspec",
    "db/seeddata/assets/100Dedications.jpg",
    "db/seeddata/assets/100Friends.jpg",
    "db/seeddata/assets/10Hearts.jpg",
    "db/seeddata/assets/10HeartsBlack.jpg",
    "db/seeddata/assets/1stDedication.jpg",
    "db/seeddata/assets/1stInvite.jpg",
    "db/seeddata/assets/20Friends.jpg",
    "db/seeddata/assets/25Dedications.jpg",
    "db/seeddata/assets/50Friends.jpg",
    "db/seeddata/assets/5Invites.jpg",
    "db/seeddata/assets/Checkpoint.jpg",
    "db/seeddata/assets/Collector.jpg",
    "db/seeddata/assets/ConcertGoer.jpg",
    "db/seeddata/assets/FlagWaver.jpg",
    "db/seeddata/assets/GrayBadge.jpg",
    "db/seeddata/assets/M001_full.jpg",
    "db/seeddata/assets/M001_icon.jpg",
    "db/seeddata/assets/M001_prev.jpg",
    "db/seeddata/assets/M002_full.jpg",
    "db/seeddata/assets/M002_icon.jpg",
    "db/seeddata/assets/M002_prev.jpg",
    "db/seeddata/assets/M003_full.jpg",
    "db/seeddata/assets/M003_icon.jpg",
    "db/seeddata/assets/M003_prev.jpg",
    "db/seeddata/assets/M004_full.jpg",
    "db/seeddata/assets/M004_icon.jpg",
    "db/seeddata/assets/M004_prev.jpg",
    "db/seeddata/assets/M005_full.jpg",
    "db/seeddata/assets/M005_icon.jpg",
    "db/seeddata/assets/M005_prev.jpg",
    "db/seeddata/assets/M006_full.jpg",
    "db/seeddata/assets/M006_icon.jpg",
    "db/seeddata/assets/M006_prev.jpg",
    "db/seeddata/assets/M007_full.jpg",
    "db/seeddata/assets/M007_icon.jpg",
    "db/seeddata/assets/M007_prev.jpg",
    "db/seeddata/assets/M008_full.jpg",
    "db/seeddata/assets/M008_icon.jpg",
    "db/seeddata/assets/M008_prev.jpg",
    "db/seeddata/assets/M009_full.jpg",
    "db/seeddata/assets/M009_icon.jpg",
    "db/seeddata/assets/M009_prev.jpg",
    "db/seeddata/assets/M010_full.jpg",
    "db/seeddata/assets/M010_icon.jpg",
    "db/seeddata/assets/M010_prev.jpg",
    "db/seeddata/assets/M011_full.jpg",
    "db/seeddata/assets/M011_icon.jpg",
    "db/seeddata/assets/M011_prev.jpg",
    "db/seeddata/assets/M012_full.jpg",
    "db/seeddata/assets/M012_icon.jpg",
    "db/seeddata/assets/M012_prev.jpg",
    "db/seeddata/assets/M013_full.jpg",
    "db/seeddata/assets/M013_icon.jpg",
    "db/seeddata/assets/M013_prev.jpg",
    "db/seeddata/assets/M014_full.jpg",
    "db/seeddata/assets/M014_icon.jpg",
    "db/seeddata/assets/M014_prev.jpg",
    "db/seeddata/assets/M015_full.jpg",
    "db/seeddata/assets/M015_icon.jpg",
    "db/seeddata/assets/M015_prev.jpg",
    "db/seeddata/assets/M016_full.jpg",
    "db/seeddata/assets/M016_icon.jpg",
    "db/seeddata/assets/M016_prev.jpg",
    "db/seeddata/assets/M017_full.jpg",
    "db/seeddata/assets/M017_icon.jpg",
    "db/seeddata/assets/M017_prev.jpg",
    "db/seeddata/assets/M018_full.jpg",
    "db/seeddata/assets/M018_icon.jpg",
    "db/seeddata/assets/M018_prev.jpg",
    "db/seeddata/assets/M019_full.jpg",
    "db/seeddata/assets/M019_icon.jpg",
    "db/seeddata/assets/M019_prev.jpg",
    "db/seeddata/assets/M020_full.jpg",
    "db/seeddata/assets/M020_icon.jpg",
    "db/seeddata/assets/M020_prev.jpg",
    "db/seeddata/assets/M021_full.jpg",
    "db/seeddata/assets/M021_icon.jpg",
    "db/seeddata/assets/M021_prev.jpg",
    "db/seeddata/assets/M022_full.jpg",
    "db/seeddata/assets/M022_icon.jpg",
    "db/seeddata/assets/M022_prev.jpg",
    "db/seeddata/assets/M023_full.jpg",
    "db/seeddata/assets/M023_icon.jpg",
    "db/seeddata/assets/M023_prev.jpg",
    "db/seeddata/assets/M024_full.jpg",
    "db/seeddata/assets/M024_icon.jpg",
    "db/seeddata/assets/M024_prev.jpg",
    "db/seeddata/assets/Maven.jpg",
    "db/seeddata/assets/Neophyte2.jpg",
    "db/seeddata/assets/Newcomer.jpg",
    "db/seeddata/assets/Victory.jpg",
    "db/seeddata/assets/advert_user_icon.jpg",
    "db/seeddata/assets/starsPack1.png",
    "db/seeddata/assets/starsPack2.png",
    "db/seeddata/assets/starsPack3.png",
    "db/seeddata/assets/starsPack4.png",
    "db/seeddata/assets/starsPack5.png",
    "db/seeddata/assets/system_user_icon.jpg",
    "db/seeddata/badges.csv",
    "db/seeddata/dedications.csv",
    "db/seeddata/gear.csv",
    "db/seeddata/purchase.csv",
    "db/seeds.rb",
    "lib/candy-gem.rb",
    "lib/candy-gem/railtie.rb",
    "lib/candy-gem/version.rb",
    "lib/engine.rb",
    "lib/tasks/candy.rake",
    "public/Healthy-Salad.jpg",
    "public/test.gif",
    "test/helper.rb",
    "test/test_candy-gem.rb"
  ]
  s.homepage = %q{http://github.com/Monstrous/candy-gem}
  s.licenses = ["Copyright (c) 2011 Monstrous Company"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Artist Gem for Candy}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end


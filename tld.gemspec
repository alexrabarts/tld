# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{tld}
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["alex"]
  s.date = %q{2009-06-30}
  s.description = %q{Top-level domain library}
  s.email = %q{alexrabarts@gmail.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "History.txt",
     "Manifest.txt",
     "README.rdoc",
     "Rakefile",
     "VERSION.yml",
     "lib/tld.rb",
     "lib/tld/alpha3.rb",
     "lib/tld/cc_tld.rb",
     "lib/tld/currency.rb",
     "lib/tld/generic_tld.rb",
     "lib/tld/infrastructure_tld.rb",
     "lib/tld/name.rb",
     "lib/tld/pseudo_tld.rb",
     "lib/tld/reserved_tld.rb",
     "lib/tld/retired_tld.rb",
     "lib/tld/sponsored_tld.rb",
     "lib/tld/tld.rb",
     "rakelib/cultivate.rake",
     "rakelib/tld.rake",
     "rakelib/tld.rb",
     "rakelib/tld.rb.erb",
     "test/tld_test.rb",
     "tld.gemspec"
  ]
  s.homepage = %q{http://github.com/alexrabarts/tld}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Provides meta information for Internet Top Level Domains (TLDs).}
  s.test_files = [
    "test/tld_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<alexrabarts-iso_country_codes>, [">= 0.2.1"])
      s.add_runtime_dependency(%q<addressable>, [">= 0"])
    else
      s.add_dependency(%q<alexrabarts-iso_country_codes>, [">= 0.2.1"])
      s.add_dependency(%q<addressable>, [">= 0"])
    end
  else
    s.add_dependency(%q<alexrabarts-iso_country_codes>, [">= 0.2.1"])
    s.add_dependency(%q<addressable>, [">= 0"])
  end
end

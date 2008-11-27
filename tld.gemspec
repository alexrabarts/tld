# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{tld}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alex Rabarts"]
  s.date = %q{2008-11-28}
  s.description = %q{Provides meta information for Internet Top Level Domains (TLDs) such as a descriptive name, associated currency code and the TLD category.}
  s.email = ["alexrabarts@gmail.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "lib/tld.rb", "lib/tld/alpha3.rb", "lib/tld/cc_tld.rb", "lib/tld/currency.rb", "lib/tld/generic_tld.rb", "lib/tld/infrastructure_tld.rb", "lib/tld/name.rb", "lib/tld/pseudo_tld.rb", "lib/tld/reserved_tld.rb", "lib/tld/retired_tld.rb", "lib/tld/sponsored_tld.rb", "lib/tld/tld.rb", "rakelib/cultivate.rake", "rakelib/tld.rake", "rakelib/tld.rb", "rakelib/tld.rb.erb", "test/test_tld.rb", "tld.gemspec"]
  s.has_rdoc = true
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{tld}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Provides meta information for Internet Top Level Domains (TLDs) such as a descriptive name, associated currency code and the TLD category.}
  s.test_files = ["test/test_tld.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<alexrabarts-iso_country_codes>, [">= 0"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.2"])
    else
      s.add_dependency(%q<alexrabarts-iso_country_codes>, [">= 0"])
      s.add_dependency(%q<hoe>, [">= 1.8.2"])
    end
  else
    s.add_dependency(%q<alexrabarts-iso_country_codes>, [">= 0"])
    s.add_dependency(%q<hoe>, [">= 1.8.2"])
  end
end

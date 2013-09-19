# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{tld}
  s.version = File.read('VERSION').strip
  s.authors = ['Alex Rabarts']
  s.description = %q{Top-level domain library}
  s.summary = %q{Provides meta information for Internet Top Level Domains (TLDs).}
  s.email = %q{alexrabarts@gmail.com}
  s.files = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.extra_rdoc_files = ['README.rdoc']
  s.homepage = %q{http://github.com/alexrabarts/tld}
  s.require_paths = ['lib']

  %w{addressable iso_country_codes}.each do |gem|
    s.add_dependency *gem.split(' ')
  end
end

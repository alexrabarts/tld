require 'rake'
require './lib/tld.rb'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = 'tld'
    s.summary = %Q{
      Provides meta information for Internet Top Level Domains (TLDs).
    }
    s.email = "alexrabarts@gmail.com"
    s.homepage = "http://github.com/alexrabarts/tld"
    s.description = "Top-level domain library"
    s.authors = ["alex"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib' << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

task :default => :test

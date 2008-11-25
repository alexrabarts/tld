# -*- ruby -*-

require 'rubygems'
require 'hoe'
require './lib/tld.rb'

Hoe.new('TLD', TLD::VERSION) do |p|
  # p.rubyforge_name = 'TLDx' # if different than lowercase project name
  p.developer('Alex Rabarts', 'alexrabarts@gmail.com')
end

# Load extra rake tasks.
tasks_path = File.join(File.dirname(__FILE__), 'rakelib')
rake_files = Dir["#{tasks_path}/*.rake"]
rake_files.each{|rake_file| load rake_file}

# vim: syntax=Ruby

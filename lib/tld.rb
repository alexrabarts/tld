dir = File.dirname(__FILE__)
$LOAD_PATH << dir unless $LOAD_PATH.include?(dir)

require 'tld/tld'
require 'tld/cc'
require 'tld/generic'
require 'tld/generic_restricted'
require 'tld/infrastructure'
require 'tld/pseudo'
require 'tld/reserved'
require 'tld/retired'
require 'tld/sponsored'
require 'tld/currency'
require 'tld/name'
require 'tld/alpha3'

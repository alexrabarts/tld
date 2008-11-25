dir = File.dirname(__FILE__)
$LOAD_PATH << dir unless $LOAD_PATH.include?(dir)

require 'tld/tld'
require 'tld/cc_tld'
require 'tld/generic_tld'
require 'tld/infrastructure_tld'
require 'tld/pseudo_tld'
require 'tld/reserved_tld'
require 'tld/retired_tld'
require 'tld/sponsored_tld'
require 'tld/currency'
require 'tld/name'
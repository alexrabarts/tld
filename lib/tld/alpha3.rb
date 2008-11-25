require 'rubygems'
require 'iso_country_codes'

class TLD
  class Alpha3
    class << self
      def find(klass)
        tld = klass.tld
        return tld.match(/^\w\w$/) ? IsoCountryCodes.find(TLD::MAP[tld.to_sym] || tld).alpha3 : nil
      end
    end
  end
end

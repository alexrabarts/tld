require 'rubygems'
require 'iso_country_codes'

class TLD
  class Currency
    CURRENCY_MAP = {
      :eu => ['EUR']
    }

    class << self
      def find(klass)
        tld = klass.tld
        CURRENCY_MAP[tld.to_sym] || IsoCountryCodes.find(TLD::MAP[tld.to_sym] || tld).currencies
      end
    end
  end
end

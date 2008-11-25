require 'rubygems'
require 'iso_country_codes'

class TLD
  class Currency
    CURRENCY_MAP = {
      :eu  => %w{EUR},
      :gov => %w{USD},
      :mil => %w{USD}
    }

    class << self
      def find(klass)
        tld = klass.tld
        mapped_currency = CURRENCY_MAP[tld.to_sym]
        if mapped_currency.nil?
          return tld.match(/^\w\w$/) ? IsoCountryCodes.find(TLD::MAP[tld.to_sym] || tld).currencies : []
        else
          return mapped_currency
        end
      end
    end
  end
end

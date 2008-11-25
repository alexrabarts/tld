require 'rubygems'
require 'iso_country_codes'

class TLD
  class Name
    NAME_MAP = {
      :aero      => 'Aeroplane',
      :arpa      => 'Address and Routing Parameter Area (ARPA)',
      :asia      => 'Asia',
      :bitnet    => 'BITNET',
      :biz       => 'Business',
      :cat       => 'Catalan',
      :com       => 'Commercial',
      :coop      => 'Cooperative',
      :csnet     => 'Computer Science Network (CSNET)',
      :edu       => 'Education',
      :eu        => 'European Union',
      :example   => 'Example domain',
      :exit      => 'Preferred Tor exit node',
      :gov       => 'US Government',
      :info      => 'Information',
      :int       => 'Internet',
      :invalid   => 'Invalid domain',
      :jobs      => 'Jobs',
      :local     => 'Network discovery protocol',
      :localhost => 'Localhost',
      :mil       => 'US Military',
      :mobi      => 'Mobile',
      :museum    => 'Museum',
      :name      => 'Name',
      :nato      => 'North Atlantic Treaty Organization (NATO)',
      :net       => 'Network',
      :onion     => 'Reachable via Tor',
      :org       => 'Organization',
      :pro       => 'Professional',
      :root      => 'Diagnostic marker',
      :tel       => 'Telnic',
      :test      => 'Test domain',
      :travel    => 'Travel',
      :uucp      => 'Reachable by Unix to Unix CoPy (UUCP)'
    }

    class << self
      def find(klass)
        tld = klass.tld
        NAME_MAP[tld.to_sym] || IsoCountryCodes.find(TLD::MAP[tld.to_sym] || tld).name
      end
    end
  end
end

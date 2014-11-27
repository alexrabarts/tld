require 'open-uri'
require 'erubis'
require 'nokogiri'

class TLD
  module Task
    def self.to_ruby(tlds, klass, type)
      tmpl  = File.read(File.join(File.dirname(__FILE__), 'tld.rb.erb'))
      eruby = Erubis::Eruby.new(tmpl)
      eruby.result(:tlds => tlds, :klass => klass, :type => type)
    end

    module UpdateIanaTlds
      def self.get type
        tlds = []
        doc = Nokogiri::HTML.parse open('http://www.iana.org/domains/root/db')

        rows = doc.search('#tld-table tbody tr')

        rows.each do |tr|
          tld = this_type = sponsoring_organization = nil

          tr.search('td').each_with_index do |td, index|
            text = td.text.strip

            case index
            when 0
              tld = text.gsub(/^\./, '')
            when 1
              this_type = text
            when 2
              sponsoring_organization = text.gsub(/[\n\r]?/, '')
            end
          end

          if type == this_type
            tlds << {tld: tld, sponsoring_organization: sponsoring_organization}
          end
        end

        return tlds
      end
    end

    module UpdateCountryCodeTLDs
      def self.get
        Task.to_ruby(Task::UpdateIanaTlds.get('country-code'), 'CC', :cc)
      end
    end # end UpdateCountryCodeTLDs

    module UpdateGenericTLDs
      def self.get
        Task.to_ruby(Task::UpdateIanaTlds.get('generic'), 'Generic', :generic)
      end
    end # end UpdateGenericTLDs

    module UpdateGenericRestrictedTLDs
      def self.get
        Task.to_ruby(Task::UpdateIanaTlds.get('generic-restricted'), 'GenericRestricted', :generic_restricted)
      end
    end # end UpdateGenericRestrictedTLDs

    module UpdateTestTLDs
      def self.get
        Task.to_ruby(Task::UpdateIanaTlds.get('test'), 'Test', :test)
      end
    end # end UpdateTestTLDs

    module UpdateInfrastructureTLDs
      def self.get
        Task.to_ruby(Task::UpdateIanaTlds.get('infrastructure'), 'Infrastructure', :infrastructure)
      end
    end # end UpdateInfrastructureTLDs

    module UpdateSponsoredTLDs
      def self.get
        Task.to_ruby(Task::UpdateIanaTlds.get('sponsored'), 'Sponsored', :sponsored)
      end
    end # end UpdateSponsoredTLDs
  end # Task
end # TLD

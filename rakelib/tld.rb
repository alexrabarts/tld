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

    module UpdateCcTlds
      def self.get
        tlds = []
        doc  = Nokogiri::HTML.parse(open('http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2'))
        node = doc.search('#Officially_assigned_code_elements').first.parent
        while node = node.next_sibling
          break if node.name == 'table'
        end
        node.search('tr').each do |tr|
          tr.search('td').each_with_index do |td, index|
            next unless index == 3
            tld = td.search('a').text.upcase.gsub(/^\./, '')
            next unless tld.match(/^\w\w$/)
            tlds.push(tld)
          end
        end

        Task.to_ruby(tlds, 'CcTld', :cc)
      end
    end # end UpdateCcTlds
  
    module UpdateNonCcTlds
      def self.get(inner_text_match)
        tlds = []
        node = nil
        doc  = Nokogiri::HTML.parse(open('http://en.wikipedia.org/wiki/Top-level_domain'))
        seen = {}
        doc.search('table.nowraplinks.navbox-subgroup tr').each do |tr|
          tr.search('td').each do |td|
            if td.text == inner_text_match
              while td = td.next_sibling
                td.search('a').each do |a|
                  tld = a.text.upcase.gsub(/^\./, '')
                  next if seen[tld]
                  seen[tld] = true
                  tlds.push(tld)
                end
              end
            end
          end
        end

        tlds
      end
    end

    module UpdateGenericTlds
      def self.get
        Task.to_ruby(Task::UpdateNonCcTlds.get('General'), 'GenericTld', :generic)
      end
    end # end UpdateGenericTlds

    module UpdateInfrastructureTlds
      def self.get
        Task.to_ruby(Task::UpdateNonCcTlds.get('Infrastructure'), 'InfrastructureTld', :infrastructure)
      end
    end # end UpdateInfrastructureTlds

    module UpdatePseudoTlds
      def self.get
        Task.to_ruby(Task::UpdateNonCcTlds.get('Pseudo'), 'PseudoTld', :pseudo)
      end
    end # end UpdatePseudoTlds

    module UpdateReservedTlds
      def self.get
        Task.to_ruby(Task::UpdateNonCcTlds.get('Reserved'), 'ReservedTld', :reserved)
      end
    end # end UpdateReservedTlds

    module UpdateRetiredTlds
      def self.get
        Task.to_ruby(Task::UpdateNonCcTlds.get('Deleted/retired'), 'RetiredTld', :retired)
      end
    end # end UpdateRetiredTlds

    module UpdateSponsoredTlds
      def self.get
        Task.to_ruby(Task::UpdateNonCcTlds.get('Sponsored'), 'SponsoredTld', :sponsored)
      end
    end # end UpdateSponsoredTlds
  end # Task
end # TLD

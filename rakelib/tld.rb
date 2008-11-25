require 'hpricot'
require 'open-uri'
require 'erubis'

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
        node    = nil
        doc     = Hpricot(open('http://en.wikipedia.org/wiki/Country_code_top-level_domain').read)
        nodes   = doc.search('strong.selflink')
        found   = false

        nodes.each do |n|
          node = n
          if node.inner_html == 'Country code top-level domains'
            found = true
            break
          end
        end

        return nil unless found
        node.parent.parent.parent.next_sibling.next_sibling.search('a').each do |a|
          tld = a.inner_text.upcase
          tld.slice!(0) # Remove the leading '.'
          break unless tld.match(/^\w\w$/)
          tlds.push(tld)
        end

        Task.to_ruby(tlds, 'CcTld', :cc)
      end
    end # end UpdateCcTlds
  
    module UpdateNonCcTlds
      def self.get(inner_text_match)
        tlds = []
        node = nil
        doc  = Hpricot(open('http://en.wikipedia.org/wiki/Top-level_domain').read)
        seen = {}
        doc.search('table.nowraplinks.navbox-subgroup tr').each do |tr|
          tr.search('td').each do |td|
            if td.inner_text == inner_text_match
              td = td.next_sibling
              td.search('a').each do |a|
                tld = a.inner_text.upcase
                next if seen[tld]
                seen[tld] = true
                tld.slice!(0) # Remove the leading '.'
                tlds.push(tld)
              end
            end
          end
        end

        tlds
      end
    end

    module UpdateGenericTlds
      def self.get
        Task.to_ruby(Task::UpdateNonCcTlds.get('Generic'), 'GenericTld', :generic)
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

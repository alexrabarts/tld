class TLD
  class Retired < TLD
    def type
      :retired
    end

    class TLDNato < Retired #:nodoc:
      self.tld = %q{nato}
    end
  end # end RetiredTld
end # end TLD

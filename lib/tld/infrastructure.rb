class TLD
  class Infrastructure < TLD
    def type
      :infrastructure
    end
    class TLDArpa < Infrastructure #:nodoc:
      self.tld = %q{arpa}
      self.sponsoring_organization = %q{Internet Architecture Board (IAB)}
    end
  end # end Infrastructure
end # end TLD

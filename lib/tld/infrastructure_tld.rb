class TLD
  class InfrastructureTld < TLD
    def type
      :infrastructure
    end
    class ARPA < InfrastructureTld #:nodoc:
      self.tld = %q{arpa}
    end
  end # end InfrastructureTld
end # end TLD

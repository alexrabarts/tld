class TLD
  class GenericRestricted < TLD
    def type
      :generic_restricted
    end
    class TLDBiz < GenericRestricted #:nodoc:
      self.tld = %q{biz}
      self.sponsoring_organization = %q{NeuStar, Inc.}
    end
    class TLDName < GenericRestricted #:nodoc:
      self.tld = %q{name}
      self.sponsoring_organization = %q{VeriSign Information Services, Inc.}
    end
    class TLDPro < GenericRestricted #:nodoc:
      self.tld = %q{pro}
      self.sponsoring_organization = %q{Registry Services Corporationdba RegistryPro}
    end
  end # end GenericRestricted
end # end TLD

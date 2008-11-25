class TLD
  class SponsoredTld < TLD
    def type
      :sponsored
    end
    class AERO < SponsoredTld #:nodoc:
      self.tld = %q{aero}
    end
    class ASIA < SponsoredTld #:nodoc:
      self.tld = %q{asia}
    end
    class CAT < SponsoredTld #:nodoc:
      self.tld = %q{cat}
    end
    class COOP < SponsoredTld #:nodoc:
      self.tld = %q{coop}
    end
    class EDU < SponsoredTld #:nodoc:
      self.tld = %q{edu}
    end
    class GOV < SponsoredTld #:nodoc:
      self.tld = %q{gov}
    end
    class INT < SponsoredTld #:nodoc:
      self.tld = %q{int}
    end
    class JOBS < SponsoredTld #:nodoc:
      self.tld = %q{jobs}
    end
    class MIL < SponsoredTld #:nodoc:
      self.tld = %q{mil}
    end
    class MOBI < SponsoredTld #:nodoc:
      self.tld = %q{mobi}
    end
    class MUSEUM < SponsoredTld #:nodoc:
      self.tld = %q{museum}
    end
    class TEL < SponsoredTld #:nodoc:
      self.tld = %q{tel}
    end
    class TRAVEL < SponsoredTld #:nodoc:
      self.tld = %q{travel}
    end
  end # end SponsoredTld
end # end TLD

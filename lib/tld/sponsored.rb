class TLD
  class Sponsored < TLD
    def type
      :sponsored
    end
    class TLDAero < Sponsored #:nodoc:
      self.tld = %q{aero}
      self.sponsoring_organization = %q{Societe Internationale de Telecommunications Aeronautique (SITA INC USA)}
    end
    class TLDAsia < Sponsored #:nodoc:
      self.tld = %q{asia}
      self.sponsoring_organization = %q{DotAsia Organisation Ltd.}
    end
    class TLDCat < Sponsored #:nodoc:
      self.tld = %q{cat}
      self.sponsoring_organization = %q{Fundacio puntCAT}
    end
    class TLDCoop < Sponsored #:nodoc:
      self.tld = %q{coop}
      self.sponsoring_organization = %q{DotCooperation LLC}
    end
    class TLDEdu < Sponsored #:nodoc:
      self.tld = %q{edu}
      self.sponsoring_organization = %q{EDUCAUSE}
    end
    class TLDGov < Sponsored #:nodoc:
      self.tld = %q{gov}
      self.sponsoring_organization = %q{General Services AdministrationAttn: QTDC, 2E08 (.gov Domain Registration)}
    end
    class TLDInt < Sponsored #:nodoc:
      self.tld = %q{int}
      self.sponsoring_organization = %q{Internet Assigned Numbers Authority}
    end
    class TLDJobs < Sponsored #:nodoc:
      self.tld = %q{jobs}
      self.sponsoring_organization = %q{Employ Media LLC}
    end
    class TLDMil < Sponsored #:nodoc:
      self.tld = %q{mil}
      self.sponsoring_organization = %q{DoD Network Information Center}
    end
    class TLDMobi < Sponsored #:nodoc:
      self.tld = %q{mobi}
      self.sponsoring_organization = %q{Afilias Technologies Limited dba dotMobi}
    end
    class TLDMuseum < Sponsored #:nodoc:
      self.tld = %q{museum}
      self.sponsoring_organization = %q{Museum Domain Management Association}
    end
    class TLDPost < Sponsored #:nodoc:
      self.tld = %q{post}
      self.sponsoring_organization = %q{Universal Postal Union}
    end
    class TLDTel < Sponsored #:nodoc:
      self.tld = %q{tel}
      self.sponsoring_organization = %q{Telnic Ltd.}
    end
    class TLDTravel < Sponsored #:nodoc:
      self.tld = %q{travel}
      self.sponsoring_organization = %q{Tralliance Registry Management Company, LLC.}
    end
    class TLDXxx < Sponsored #:nodoc:
      self.tld = %q{xxx}
      self.sponsoring_organization = %q{ICM Registry LLC}
    end
  end # end Sponsored
end # end TLD

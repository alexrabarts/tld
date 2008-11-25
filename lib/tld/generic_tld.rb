class TLD
  class GenericTld < TLD
    def type
      :generic
    end
    class BIZ < GenericTld #:nodoc:
      self.tld = %q{biz}
    end
    class COM < GenericTld #:nodoc:
      self.tld = %q{com}
    end
    class INFO < GenericTld #:nodoc:
      self.tld = %q{info}
    end
    class NAME < GenericTld #:nodoc:
      self.tld = %q{name}
    end
    class NET < GenericTld #:nodoc:
      self.tld = %q{net}
    end
    class ORG < GenericTld #:nodoc:
      self.tld = %q{org}
    end
    class PRO < GenericTld #:nodoc:
      self.tld = %q{pro}
    end
  end # end GenericTld
end # end TLD

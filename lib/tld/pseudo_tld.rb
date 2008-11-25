class TLD
  class PseudoTld < TLD
    def type
      :pseudo
    end
    class BITNET < PseudoTld #:nodoc:
      self.tld = %q{bitnet}
    end
    class CSNET < PseudoTld #:nodoc:
      self.tld = %q{csnet}
    end
    class LOCAL < PseudoTld #:nodoc:
      self.tld = %q{local}
    end
    class ROOT < PseudoTld #:nodoc:
      self.tld = %q{root}
    end
    class UUCP < PseudoTld #:nodoc:
      self.tld = %q{uucp}
    end
    class ONION < PseudoTld #:nodoc:
      self.tld = %q{onion}
    end
    class EXIT < PseudoTld #:nodoc:
      self.tld = %q{exit}
    end
  end # end PseudoTld
end # end TLD

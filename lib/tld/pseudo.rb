class TLD
  class Pseudo < TLD
    def type
      :pseudo
    end

    class TLDBitnet < Pseudo #:nodoc:
      self.tld = %q{bitnet}
    end

    class TLDCsnet < Pseudo #:nodoc:
      self.tld = %q{csnet}
    end

    class TLDLocal < Pseudo #:nodoc:
      self.tld = %q{local}
    end

    class TLDRoot < Pseudo #:nodoc:
      self.tld = %q{root}
    end

    class TLDUucp < Pseudo #:nodoc:
      self.tld = %q{uucp}
    end

    class TLDOnion < Pseudo #:nodoc:
      self.tld = %q{onion}
    end

    class TLDExit < Pseudo #:nodoc:
      self.tld = %q{exit}
    end
  end # end Pseudo
end # end TLD

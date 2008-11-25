class TLD
  class ReservedTld < TLD
    def type
      :reserved
    end
    class EXAMPLE < ReservedTld #:nodoc:
      self.tld = %q{example}
    end
    class INVALID < ReservedTld #:nodoc:
      self.tld = %q{invalid}
    end
    class LOCALHOST < ReservedTld #:nodoc:
      self.tld = %q{localhost}
    end
    class TEST < ReservedTld #:nodoc:
      self.tld = %q{test}
    end
  end # end ReservedTld
end # end TLD

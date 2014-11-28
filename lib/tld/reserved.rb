class TLD
  class Reserved < TLD
    def type
      :reserved
    end

    class TLDExample < Reserved #:nodoc:
      self.tld = %q{example}
    end

    class TLDInvalid < Reserved #:nodoc:
      self.tld = %q{invalid}
    end

    class TLDLocalhost < Reserved #:nodoc:
      self.tld = %q{localhost}
    end

    class TLDTest < Reserved #:nodoc:
      self.tld = %q{test}
    end
  end # end ReservedTld
end # end TLD

class TLD
  class RetiredTld < TLD
    def type
      :retired
    end
    class NATO < RetiredTld #:nodoc:
      self.tld = %q{nato}
    end
  end # end RetiredTld
end # end TLD

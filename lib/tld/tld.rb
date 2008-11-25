require 'singleton'

class TLD
  VERSION = '0.1.1'

  MAP = {
    :ac => 'sh',
    :uk => 'gb',
    :su => 'ru',
    :tp => 'tl',
    :yu => 'rs'
  }

  include Singleton

  class UnknownTldError < StandardError; end

  def tld
    self.class.tld
  end

  def name
    self.class.name
  end

  def main_currency
    self.class.main_currency
  end

  def currency
    self.class.main_currency
  end

  def currencies
    self.class.currencies
  end

  def alpha3
    self.class.alpha3
  end

  class << self
    attr_accessor :tld

    @@tlds = []

    def inherited(tld) #:nodoc:
      super
      @@tlds << tld.instance unless self == TLD
    end

    def all
      @@tlds.uniq
    end

    def name
      Name.find(self)
    end

    def currencies
      Currency.find(self)
    end

    def alpha3
      Alpha3.find(self)
    end

    def main_currency
      currencies.first
    end

    alias_method :currency, :main_currency

    def find(str)
      str.downcase!
      str.sub!(/^\w+:\/\//, '') # Strip protocol
      str = str.split('/').first if str.match(/\//) # Throw away anything after a slash
      str = str.split('.').last if str.match(/\./) # Take the last one of foo.bar.baz
      instance = all.select { |t| t.tld == str }.first

      raise UnknownTldError, "TLD '#{str}' unkown." if instance.nil?

      instance
    end
  end
end
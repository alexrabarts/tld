require 'singleton'
require 'rubygems'
require 'addressable/uri'

class TLD
  MAP = {
    :ac => 'sh',
    :uk => 'gb',
    :su => 'ru',
    :tp => 'tl',
    :yu => 'rs'
  }

  include Singleton

  class UnknownTldError < StandardError; end

  def to_s
    tld
  end

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
      host     = Addressable::URI.heuristic_parse(str).normalized_host.to_s
      host     = str.downcase if host == ''
      last     = host.match(/\./) ? host.split('.').last : host # Take the last one of foo.bar.baz
      instance = all.select { |t| t.tld == last }.first

      raise UnknownTldError, "TLD '#{str}' unkown." if instance.nil?

      instance
    end
  end
end

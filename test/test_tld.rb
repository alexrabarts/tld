require 'test/unit'
require 'tld'

class TestTld < Test::Unit::TestCase
  def test_find_tld_by_exact_match
    assert_equal 'au', TLD.find('au').tld
  end

  def test_find_tld_by_exact_match_with_dot
    assert_equal 'au', TLD.find('.au').tld
  end

  def test_find_tld_with_case
    assert_equal 'au', TLD.find('AU').tld
  end

  def test_find_tld_by_hostname
    assert_equal 'au', TLD.find('foo.bar.au').tld
  end

  def test_find_tld_by_url
    assert_equal 'au', TLD.find('http://foo.bar.au/baz').tld
  end

  def test_get_tld_currency
    assert_equal 'AUD', TLD.find('au').currency
  end

  def test_get_mapped_tld_currency
    assert_equal 'EUR', TLD.find('eu').currency
    assert_equal 'GBP', TLD.find('uk').currency
  end

  def test_get_tld_name
    assert_equal 'Australia', TLD.find('au').name
    assert_equal 'Business', TLD.find('biz').name
  end

  def test_get_iso_alpha3_code
    assert_equal 'AUS', TLD.find('au').alpha3
    assert_equal 'GBR', TLD.find('uk').alpha3
  end

  def test_com_should_map_to_empty_currency_not_comoros
    assert_equal [], TLD.find('com').currencies
    assert_nil TLD.find('com').currency
  end

  def test_unknown_tld
    assert_raises TLD::UnknownTldError do
      TLD.find('foo')
    end
  end
end

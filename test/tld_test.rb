require 'test/unit'
require 'tld'
require 'shoulda'

class TestTld < Test::Unit::TestCase
  should 'find TLD by exact match' do
    assert_equal 'au', TLD.find('au').tld
  end

  should 'find TLD by exact match with dot' do
    assert_equal 'au', TLD.find('.au').tld
  end

  should 'find TLD with case' do
    assert_equal 'au', TLD.find('AU').tld
  end

  should 'find TLD by hostname' do
    assert_equal 'au', TLD.find('foo.bar.au').tld
  end

  should 'find TLD by url' do
    assert_equal 'au', TLD.find('http://foo.bar.au/baz').tld
  end

  should 'get TLD currency' do
    assert_equal 'AUD', TLD.find('au').currency
  end

  should 'get mapped TLD currency' do
    assert_equal 'EUR', TLD.find('eu').currency
    assert_equal 'GBP', TLD.find('uk').currency
  end

  should 'get TLD name' do
    assert_equal 'Australia', TLD.find('au').name
    assert_equal 'Business', TLD.find('biz').name
  end

  should 'get iso alpha3 code' do
    assert_equal 'AUS', TLD.find('au').alpha3
    assert_equal 'GBR', TLD.find('uk').alpha3
  end

  should 'com should map to empty currency (not Comoros)' do
    assert_equal [], TLD.find('com').currencies
    assert_nil TLD.find('com').currency
  end

  should 'raise exception when TLD is unknown' do
    assert_raises TLD::UnknownTldError do
      TLD.find('foo')
    end
  end
end

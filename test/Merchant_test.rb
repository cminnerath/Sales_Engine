require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require "./lib/merchant"

class MerchantTest < Minitest::Test

  def setup
    file = "./data/merchants_fixture.csv"
    merchant_csv = CSV.open(file, headers: true, header_converters: :symbol)
    merchant_collection = merchant_csv.map { |row| Merchant.new(row) }
  end

  def test_it_can_access_id
    id = setup[0].id
    assert_equal 1, id
  end

  def test_it_can_access_name
    name = setup[1].name.to_s
    assert_equal "Klein, Rempel and Jones",name
  end

  def test_it_can_access_created_at
    created_at = setup[0].created_at
    assert_equal "2012-03-27 14:53:59 UTC", created_at
  end

  def test_it_can_access_updated_date
    updated_at = setup[3].updated_at
    assert_equal "2012-03-27 14:53:59 UTC", updated_at
  end

end

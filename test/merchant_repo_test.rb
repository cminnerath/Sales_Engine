require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require "./lib/merchant"
require "./lib/merchant_repo"
require "./lib/sales_engine"

class MerchantRepoTest < Minitest::Test

  def test_it_finds_all_merchants
    rows = MerchantLoader.new.load_all('./data/merchants_fixture.csv')
    mr = MerchantRepo.new(rows, "sales_engine")
    result = mr.merchants
    assert_equal result, mr.find_all
    assert_equal Hash, result.class
  end

  def test_it_can_find_by_id
    rows = MerchantLoader.new.load_all('./data/merchants_fixture.csv')
    mr = MerchantRepo.new(rows, "sales_engine")
    result = mr.merchants["1"]
    assert_equal result, mr.find_by_id(1)
  end

  def test_it_finds_single_match_for_first_name
    rows = MerchantLoader.new.load_all('./data/merchants_fixture.csv')
    mr = MerchantRepo.new(rows, "sales_engine")
    result = mr.merchants["5"]
    assert_equal result, mr.find_by_name("Williamson Group")
  end

  def test_it_can_find_customers_by_creation_date
    rows = MerchantLoader.new.load_all('./data/merchants_fixture.csv')
    mr = MerchantRepo.new(rows, "sales_engine")
    result = mr.merchants["10"]
    assert_equal result, mr.find_by_creation_date("2012-03-27 14:54:00 UTC")
  end

  def test_it_can_find_customers_by_updated_date
    rows = MerchantLoader.new.load_all('./data/merchants_fixture.csv')
    mr = MerchantRepo.new(rows, "sales_engine")
    result = mr.merchants["10"]
    assert_equal result, mr.find_by_updated_date("2012-03-27 14:54:00 UTC")
  end

  def test_it_can_find_all_merchants_by_name
    rows = MerchantLoader.new.load_all('./data/merchants_fixture.csv')
    mr = MerchantRepo.new(rows, "sales_engine")
    assert_equal 2 , mr.find_all_by_name("Williamson Group").count
  end

  def test_it_finds_all_merchants_by_creation_date
    rows = MerchantLoader.new.load_all('./data/merchants_fixture.csv')
    mr = MerchantRepo.new(rows, "sales_engine")
    assert_equal 2, mr.find_all_by_creation_date("2012-03-27 14:54:00 UTC").count
  end

  def test_it_finds_all_matches_by_updated_date
    rows = MerchantLoader.new.load_all('./data/merchants_fixture.csv')
    mr = MerchantRepo.new(rows, "sales_engine")
    assert_equal 2, mr.find_all_by_updated_date("2012-03-27 14:54:00 UTC").count
  end

end

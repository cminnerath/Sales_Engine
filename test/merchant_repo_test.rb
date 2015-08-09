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
    skip
    rows = MerchantLoader.new.load_all('./data/merchants_fixture.csv')
    mr = MerchantRepo.new(rows, "sales_engine")
    result = mr.merchants
    assert_equal result, mr.find_all
    assert_equal Hash, result.class
  end

  def test_it_can_find_by_id
    skip
    rows = MerchantLoader.new.load_all('./data/merchants_fixture.csv')
    mr = MerchantRepo.new(rows, "sales_engine")
    result = mr.merchants["1"]
    assert_equal result, mr.find_by_id(1)
  end

  def test_it_finds_single_match_for_first_name
    skip
    rows = MerchantLoader.new.load_all('./data/merchants_fixture.csv')
    mr = MerchantRepo.new(rows, "sales_engine")
    result = mr.merchants["5"]
    assert_equal result, mr.find_by_name("Williamson Group")
  end

  def test_it_can_find_customers_by_creation_date
    skip
    rows = MerchantLoader.new.load_all('./data/merchants_fixture.csv')
    mr = MerchantRepo.new(rows, "sales_engine")
    result = mr.merchants["10"]
    assert_equal result, mr.find_by_creation_date("2012-03-27 14:54:00 UTC")
  end

  def test_it_can_find_customers_by_updated_date
    skip
    rows = MerchantLoader.new.load_all('./data/merchants_fixture.csv')
    mr = MerchantRepo.new(rows, "sales_engine")
    result = mr.merchants["10"]
    assert_equal result, mr.find_by_updated_date("2012-03-27 14:54:00 UTC")
  end

  def test_it_can_find_all_merchants_by_name
    skip
    rows = MerchantLoader.new.load_all('./data/merchants_fixture.csv')
    mr = MerchantRepo.new(rows, "sales_engine")
    assert_equal 2 , mr.find_all_by_name("Williamson Group").count
  end

  def test_it_finds_all_merchants_by_creation_date
    skip
    rows = MerchantLoader.new.load_all('./data/merchants_fixture.csv')
    mr = MerchantRepo.new(rows, "sales_engine")
    assert_equal 2, mr.find_all_by_creation_date("2012-03-27 14:54:00 UTC").count
  end

  def test_it_finds_all_matches_by_updated_date
    skip
    rows = MerchantLoader.new.load_all('./data/merchants_fixture.csv')
    mr = MerchantRepo.new(rows, "sales_engine")
    assert_equal 2, mr.find_all_by_updated_date("2012-03-27 14:54:00 UTC").count
  end

  def test_it_returns_a_collection_of_items_for_a_given_merchant
    #Create a new sales engine instance
    #Call start on sales engine instance
    #Call method "find_customer" fom the invoice class
    #The "find customer" method should call up the stack back down custeromer_repo stack
      #"find customer" method = (instance of ir).(instance of sales engine).(customer repo).find_by_all_customers
    #Return should be a collection of customers
    #Call method "find_item" fom merchant class
    engine = SalesEngine.new
    engine.start
    item_objects = engine.merchant_repo.merchants[0].items
    item_ids  = item_objects.map { |item| item.id}
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], item_ids[0..9]
    # result = engine.merchant_repo.merchant["1"].name("Schroeder-Jerde")
  end

end

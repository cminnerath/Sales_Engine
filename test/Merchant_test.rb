require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require_relative "../lib/merchant"
require_relative "../lib/sales_engine"
class MerchantTest < Minitest::Test

  attr_reader :engine, :repository

  def setup
    @engine = SalesEngine.new("./test/fixtures")
    engine.startup
    @repository = engine.merchant_repository
  end

  def test_it_can_access_id
    merchant = repository.find_by_id(1)
    assert_equal 1, merchant.id
  end

  def test_it_can_access_name
    merchant = repository.find_by_name("Klein, Rempel and Jones")
    assert_equal 2, merchant.id
  end

  def test_it_can_access_created_at
    merchant = repository.find_by_creation_date("2012-03-27 14:53:59 UTC")
    assert_equal 1, merchant.id
  end

  def test_it_can_access_updated_date
    merchant = repository.find_by_updated_date("2012-03-27 14:53:59 UTC")
    assert_equal 1, merchant.id
  end

  def test_it_can_access_updated_date
    merchant = repository.find_by_updated_date("2012-03-27 14:53:59 UTC")
    assert_equal 1, merchant.id
  end

  def test_it_returns_a_collection_of_items_for_a_given_merchant
    merchant = repository.find_by_id(1)
    items = merchant.items
    item_ids = items.map {|item| item.id}
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], item_ids[0..9]
  end

  def test_it_returns_a_collection_of_invoices_for_a_given_merchant
    merchant = repository.find_by_id(8)
    invoices = merchant.invoices
    assert_equal [12], invoices.map {|invoice| invoice.id}
  end

  def test_if_merchant_id_can_return_its_revenue
    merchant = repository.find_by_id(8)
    assert_equal 393300, merchant.revenue
  end
  
end

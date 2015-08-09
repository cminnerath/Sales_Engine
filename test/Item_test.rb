require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require "./lib/item"
require "./lib/sales_engine"

class ItemTest < Minitest::Test

  attr_reader :engine, :repo

  def setup
    @engine = SalesEngine.new("./test/fixtures")
    engine.start
    @repo = engine.item_repo
  end

  def test_it_can_access_id
		item = repo.find_by_id(1)
    assert_equal 1 , item.id
  end

  def test_it_can_access_item_name
    item = repo.find_by_name("Item Qui Esse")
    result = 1
    assert_equal result, item.id
  end

  def test_if_can_access_item_decription
    result = "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro."
    item = repo.find_by_description(result)
    assert_equal result, item.description
  end

  def test_it_can_access_item_unit_price
    item = repo.find_by_unit_price("75107")
    assert_equal 1, item.id
  end

  def test_it_can_access_item_merchant_id
    item = repo.find_by_merchant_id(1)
    assert_equal 1, item.id
  end

  def test_it_can_access_item_creation_date
    result = "2012-03-27 14:53:59 UTC"
    item = repo.find_by_creation_date(result)
    assert_equal 1, item.id
  end

  def test_it_can_access_item_upated_date
    result = "2012-03-27 14:53:59 UTC"
    item = repo.find_by_updated_date(result)
    assert_equal 1, item.id
  end

  def test_it_returns_a_merchant_associated_with_item
    item = repo.find_by_merchant_id(1)
    merchants = item.merchant
    assert_equal "Schroeder-Jerde", merchants.name
  end

end

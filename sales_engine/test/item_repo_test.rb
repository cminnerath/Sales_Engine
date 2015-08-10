require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require_relative "../lib/item"
require_relative "../lib/item_repo"
require_relative "../lib/sales_engine"


class ItemRepoTest < Minitest::Test

  def test_it_finds_all_customers
    rows = ItemLoader.new.load_all('./data/items_fixture.csv')
    ir = ItemRepo.new(rows, "sales_engine")
    result = ir.items
    assert_equal result, ir.find_all
    assert_equal Hash, result.class
  end

  def test_it_finds_an_item_by_id
    rows = ItemLoader.new.load_all('./data/items_fixture.csv')
    ir = ItemRepo.new(rows, "sales_engine")
    result = ir.items["1"]
    assert_equal result, ir.find_by_id(1)
  end

  def test_it_finds_an_item_by_its_name
    rows = ItemLoader.new.load_all('./data/items_fixture.csv')
    ir = ItemRepo.new(rows, "sales_engine")
    result = ir.items["1"]
    assert_equal result, ir.find_by_name("Item Qui Esse")
  end

  def test_it_finds_an_item_by_its_description
    rows = ItemLoader.new.load_all('./data/items_fixture.csv')
    ir = ItemRepo.new(rows, "sales_engine")
    description = "Iusto ratione illum. Adipisci est perspiciatis temporibus. Ducimus id dolorem voluptas eligendi repellat iure sit."
    result = ir.items["11"]
    assert_equal result, ir.find_by_description(description)
  end

  def test_it_finds_by_unit_price
    rows = ItemLoader.new.load_all('./data/items_fixture.csv')
    ir = ItemRepo.new(rows, "sales_engine")
    result = ir.items["2"]
    assert_equal result, ir.find_by_unit_price("67076")
  end

  def test_it_can_find_items_by_creation_date
    rows = ItemLoader.new.load_all('./data/items_fixture.csv')
    ir = ItemRepo.new(rows, "sales_engine")
    result = ir.items["1"]
    assert_equal result, ir.find_by_creation_date("2012-03-27 14:53:59 UTC")
  end

  def test_it_can_find_items_by_updated_date
    rows = ItemLoader.new.load_all('./data/items_fixture.csv')
    ir = ItemRepo.new(rows, "sales_engine")
    result = ir.items["1"]
    assert_equal result, ir.find_by_updated_date("2012-03-27 14:53:59 UTC")
  end

  def test_it_finds_all_items_by_name
    rows = ItemLoader.new.load_all('./data/items_fixture.csv')
    ir = ItemRepo.new(rows, "sales_engine")
    assert_equal 4, ir.find_all_by_name("Item Rerum Magni").length
  end

  def test_it_finds_all_items_by_description
    rows = ItemLoader.new.load_all('./data/items_fixture.csv')
    ir = ItemRepo.new(rows, "sales_engine")
    description = "Iusto ratione illum. Adipisci est perspiciatis temporibus. Ducimus id dolorem voluptas eligendi repellat iure sit."
    assert_equal 4, ir.find_all_by_description(description).length
  end

  def test_it_finds_all_items_by_unit_price
    rows = ItemLoader.new.load_all('./data/items_fixture.csv')
    ir = ItemRepo.new(rows, "sales_engine")
    assert_equal 4, ir.find_all_by_unit_price(13046).length
  end

  def test_it_finds_all_items_by_unit_price
    rows = ItemLoader.new.load_all('./data/items_fixture.csv')
    ir = ItemRepo.new(rows, "sales_engine")
    assert_equal 14, ir.find_all_by_merchant_id(1).length
  end

  def test_it_finds_all_matches_by_creation_date
    rows = ItemLoader.new.load_all('./data/items_fixture.csv')
    ir = ItemRepo.new(rows, "sales_engine")
    assert_equal 14, ir.find_all_by_creation_date("2012-03-27 14:53:59 UTC").count
  end

  def test_it_finds_all_matches_by_updated_date
    rows = ItemLoader.new.load_all('./data/items_fixture.csv')
    ir = ItemRepo.new(rows, "sales_engine")
    assert_equal 14, ir.find_all_by_updated_date("2012-03-27 14:53:59 UTC").count
  end

  def test_that_finds_all_returns_empty_array_when_no_matches_are_found
    rows = ItemLoader.new.load_all('./data/items_fixture.csv')
    ir = ItemRepo.new(rows, "sales_engine")
    result = []
    assert_equal result, ir.find_all_by_name("Item Quiche Esse")
    assert_equal result, ir.find_all_by_description( "Item Qui Esse Item Qui Esse")
    assert_equal result, ir.find_all_by_updated_date("2015-03-27 12:59:59 UTC")
    assert_equal result, ir.find_all_by_creation_date("2015-03-27 12:59:59 UTC")
  end

end

require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require "./lib/item"

class ItemTest < Minitest::Test

  def test_it_can_access_customer_id
		file = "./data/items_fixture.csv"
		item_csv = CSV.open(file, headers: true, header_converters: :symbol)
		item_collection = item_csv.map { |row| Item.new(row) }
		id = item_collection[0].id
    assert_equal 1 , id
  end

  def test_it_can_access_item_name
		file = "./data/items_fixture.csv"
		item_csv = CSV.open(file, headers: true, header_converters: :symbol)
		item_collection = item_csv.map { |row| Item.new(row) }
    result = "Item Qui Esse"
    assert_equal result, item_collection[0].name
  end

  def test_if_can_access_item_decription
		file = "./data/items_fixture.csv"
		item_csv = CSV.open(file, headers: true, header_converters: :symbol)
		item_collection = item_csv.map { |row| Item.new(row) }
    result = "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro."
    assert_equal result, item_collection[0].description
  end

  def test_it_can_access_item_unit_price
		file = "./data/items_fixture.csv"
		item_csv = CSV.open(file, headers: true, header_converters: :symbol)
		item_collection = item_csv.map { |row| Item.new(row) }
    result = "75107"
    assert_equal result, item_collection[0].unit_price
  end

  def test_it_can_access_item_merchant_id
		file = "./data/items_fixture.csv"
		item_csv = CSV.open(file, headers: true, header_converters: :symbol)
		item_collection = item_csv.map { |row| Item.new(row) }
    result = "1"
    assert_equal result, item_collection[0].merchant_id
  end

  def test_it_can_access_item_creation_date
		file = "./data/items_fixture.csv"
		item_csv = CSV.open(file, headers: true, header_converters: :symbol)
		item_collection = item_csv.map { |row| Item.new(row) }
    result = "2012-03-27 14:53:59 UTC"
    assert_equal result, item_collection[0].created_at
  end

  def test_it_can_access_item_creation_date
		file = "./data/items_fixture.csv"
		item_csv = CSV.open(file, headers: true, header_converters: :symbol)
		item_collection = item_csv.map { |row| Item.new(row) }
    result = "2012-03-27 14:53:59 UTC"
    assert_equal result, item_collection[0].updated_at
  end


end

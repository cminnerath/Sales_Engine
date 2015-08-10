require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require './lib/invoice_item'
require './lib/invoice_item_loader'
require "./lib/sales_engine"

class InvoiceItemRepoTest < Minitest::Test

  attr_reader :engine, :repo

  def setup
    @engine = SalesEngine.new("./test/fixtures")
    engine.start
    @repo = engine.invoice_item_repo
  end

  def test_it_finds_all_invoice_items
    result = repo.invoice_items
    assert_equal result, repo.find_all
    assert_equal Hash, result.class
  end

  def test_it_can_find_by_id
    result = repo.invoice_items["2"]
    assert_equal result, repo.find_by_id(2)
  end

  def test_it_can_find_by_item_id
    result = repo.invoice_items["1"]
    assert_equal result, repo.find_by_item_id(539)
  end

  def test_it_can_find_by_invoice_id
    result = repo.invoice_items["13"]
    assert_equal result, repo.find_by_invoice_id(3)
  end

  def test_it_can_find_by_quantity
    result = repo.invoice_items["21"]
    assert_equal result, repo.find_by_quantity(2)
  end

  def test_it_can_find_by_unit_price
    result = repo.invoice_items["21"]
    assert_equal result, repo.find_by_unit_price("42203")
  end

  def test_it_can_find_by_updated_date
    result = repo.invoice_items["1"]
    assert_equal result, repo.find_by_updated_date("2012-03-27 14:54:09 UTC")
  end

  def test_it_can_find_by_creation_date
    result = repo.invoice_items["1"]
    assert_equal result, repo.find_by_creation_date("2012-03-27 14:54:09 UTC")
  end

  def test_it_can_find_all_by_invoice_id
    assert_equal 8, repo.find_all_by_invoice_id(1)[0..19].count
  end

  def test_it_can_find_all_by_quantity
    assert_equal 1, repo.find_all_by_quantity(2)[0..19].count
  end

  def test_it_can_find_all_by_unit_price
    assert_equal 3, repo.find_all_by_unit_price("72018")[0..19].count
  end

  def test_it_can_find_all_by_creation_date
    assert_equal 15, repo.find_all_by_creation_date("2012-03-27 14:54:09 UTC")[0..19].count
  end

  def test_it_can_find_all_by_updated_date
    assert_equal 15, repo.find_all_by_updated_date("2012-03-27 14:54:09 UTC")[0..19].count
  end

end

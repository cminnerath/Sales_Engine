require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require "./lib/invoice_item"
require "./lib/sales_engine"

class InvoiceItemTest < Minitest::Test

  attr_reader :engine, :repo

  def setup
    @engine = SalesEngine.new("./test/fixtures")
    engine.start
    @repo = engine.invoice_item_repo
  end

  def test_it_can_access_id
    invoice_item = repo.find_by_id(1)
    assert_equal 1 , invoice_item.id
  end

  def test_it_can_access_item_id
    invoice_item = repo.find_by_id(1)
    assert_equal 539, invoice_item.item_id
  end

  def test_it_can_access_invoice_id
    invoice_item = repo.find_by_id(8)
    assert_equal 1, invoice_item.invoice_id
  end

  def test_it_can_access_by_quantity
    invoice_item = repo.find_by_id(1)
    assert_equal 5, invoice_item.quantity
  end

  def test_it_can_access_by_unit_price
    invoice_item = repo.find_by_id(1)
    assert_equal "13635", invoice_item.unit_price
  end

  def test_it_can_access_by_creation_date
    invoice_item = repo.find_by_id(20)
    assert_equal "2012-03-27 14:54:10 UTC", invoice_item.created_at
  end

  def test_it_can_access_by_updated_date
    invoice_item = repo.find_by_id(20)
    assert_equal "2012-03-27 14:54:10 UTC", invoice_item.updated_at
  end

end

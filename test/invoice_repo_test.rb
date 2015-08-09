require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require "./lib/invoice"
require "./lib/invoice_repo"
require "./lib/sales_engine"

class InvoiceRepoTest < Minitest::Test

  attr_reader :engine, :repo

  def setup
    @engine = SalesEngine.new("./test/fixtures")
    engine.start
    @repo = engine.invoice_repo
  end

  def test_it_finds_all_customers
    result = repo.invoice
    assert_equal result, repo.find_all
    assert_equal Hash, result.class
  end

  def test_it_can_find_by_id
    result = repo.invoice["1"]
    assert_equal result, repo.find_by_id(1)
  end

  def test_it_can_find_by_customer_id
    result = repo.invoice["1"]
    assert_equal result, repo.find_by_customer_id(1)
  end

  def test_it_can_find_by_merchant_id
    result = repo.invoice["1"]
    assert_equal result, repo.find_by_merchant_id(26)
  end

  def test_it_can_find_by_creation_date
    result = repo.invoice["1"]
    assert_equal result, repo.find_by_creation_date("2012-03-25 09:54:09 UTC")
  end

  def test_it_can_find_by_updated_date
    result = repo.invoice["1"]
    assert_equal result, repo.find_by_updated_date("2012-03-25 09:54:09 UTC")
  end
end

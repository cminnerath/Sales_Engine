require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require "./lib/invoice"
require "./lib/sales_engine"

class InvoiceTest < Minitest::Test

  attr_reader :engine, :repo

  def setup
    @engine = SalesEngine.new("./test/fixtures")
    engine.start
    @repo = engine.invoice_repo
  end

  def test_it_can_access_id
    invoice = repo.find_by_id(1)
    assert_equal 1 , invoice.id
  end

  def test_it_can_access_customer_id
    invoice = repo.find_by_id(8)
    assert_equal 1, invoice.customer_id
  end

  def test_it_can_access_merchant_id
    invoice = repo.find_by_merchant_id(38)
    assert_equal 38, invoice.merchant_id
  end

  # def test_it_can_access_status
  #   skip
  #   #fail
  #   invoice = repo
  #   assert_equal "shipped", invoice.status
  # end
  #
  # def test_it_can_access_created_at
  #   created_at = setup[0].created_at
  #   assert_equal "2012-03-25 09:54:09 UTC", created_at
  # end
  #
  # def test_it_can_access_updated_date
  #   skip
  #   updated_at = setup[0].updated_at
  #   assert_equal "2012-03-25 09:54:09 UTC", updated_at
  # end

  def test_it_finds_invoices_by_customer_id
    assert_equal "Joey", repo.find_customer_by_id(1).first_name
  end

  def test_it_returns_a_collection_of_associated_transaction_instances
    invoice = repo.find_by_id(8)
    transactions = invoice.transactions
    assert_equal [7], transactions.map {|invoice| invoice.id}
  end

  def test_it_returns_a_merchant_associated_with_an_invoice_id
    invoice = repo.find_by_id(21)
    # invoice.merchant_id
    merchant = invoice.merchant
    assert_equal "Pollich and Sons", merchant.name
  end
end

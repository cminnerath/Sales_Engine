require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require "./lib/invoice"
require "./lib/invoice_repo"
require "./lib/sales_engine"
class InvoiceRepoTest < Minitest::Test

  def setup
    rows = InvoiceLoader.new.load_all('./data/transactions_fixture.csv')
    ir = InvoiceRepo.new(rows, "sales_engine")
  end

  def test_it_finds_all_invoices


  end
end

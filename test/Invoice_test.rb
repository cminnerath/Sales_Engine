require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require "./lib/invoice"

class InvoiceTest < Minitest::Test

  def setup
    file = "./data/invoices_fixture.csv"
    invoice_csv = CSV.open(file, headers: true, header_converters: :symbol)
    invoice_collection = invoice_csv.map { |row| Invoice.new(row) }
  end

  def test_it_can_access_id
    id = setup[0].id
    assert_equal 1 , id
  end

  def test_it_can_access_customer_id
    customer_id = setup[8].customer_id
    assert_equal 2, customer_id
  end

  def test_it_can_access_merchant_id
    merchant_id = setup[7].merchant_id
    assert_equal 38, merchant_id
  end

  def test_it_can_access_status
    status = setup[0].status
    assert_equal "shipped", status
  end

end

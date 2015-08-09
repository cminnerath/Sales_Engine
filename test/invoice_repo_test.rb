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
    rows = InvoiceLoader.new.load_all('./data/Invoices_fixture.csv')
    ir = InvoiceRepo.new(rows, "sales_engine")
  end

  def test_it_finds_all_customers
    rows = InvoiceLoader.new.load_all('./data/invoices_fixture.csv')
    ir = InvoiceRepo.new(rows, "sales_engine")
    result = ir.invoice
    assert_equal result, ir.find_all
    assert_equal Hash, result.class
  end

  def test_it_can_find_by_id
    rows = InvoiceLoader.new.load_all('./data/invoices_fixture.csv')
    ir = InvoiceRepo.new(rows, "sales_engine")
    result = ir.invoice["1"]
    assert_equal result, ir.find_by_id(1)
  end

  def test_it_can_find_by_customer_id
    rows = InvoiceLoader.new.load_all('./data/invoices_fixture.csv')
    ir = InvoiceRepo.new(rows, "sales_engine")
    result = ir.invoice["1"]
    assert_equal result, ir.find_by_customer_id(1)
  end

  def test_it_can_find_by_merchant_id
    rows = InvoiceLoader.new.load_all('./data/invoices_fixture.csv')
    ir = InvoiceRepo.new(rows, "sales_engine")
    result = ir.invoice["1"]
    assert_equal result, ir.find_by_merchant_id(26)
  end

  def test_it_can_find_by_creation_date
    rows = InvoiceLoader.new.load_all('./data/invoices_fixture.csv')
    ir = InvoiceRepo.new(rows, "sales_engine")
    result = ir.invoice["1"]
    assert_equal result, ir.find_by_creation_date("2012-03-25 09:54:09 UTC")
  end

  def test_it_can_find_by_updated_date
    rows = InvoiceLoader.new.load_all('./data/invoices_fixture.csv')
    ir = InvoiceRepo.new(rows, "sales_engine")
    result = ir.invoice["1"]
    assert_equal result, ir.find_by_updated_date("2012-03-25 09:54:09 UTC")
  end

  def test_it_finds_invoices_by_customer_id
    #Create a new sales engine instance
    #Call start on sales engine instance
    #Call method "find_customer" fom the invoice class
    #The "find customer" method should call up the stack back down custeromer_repo stack
      #"find customer" method = (instance of ir).(instance of sales engine).(customer repo).find_by_all_customers
    #Return should be a collection of customers
    skip
    engine = SalesEngine.new(test)
    se = engine.start

    result = se.invoice_repo.invoice["1"].find_customer("john")

    assert_equal "3", result.id
    # rows = InvoiceLoader.new.load_all('./data/invoices_fixture.csv')
    #
    # ir = InvoiceRepo.new(rows, SalesEngine.new)
    # assert_equal "Joey", ir.find_customer_by_id(1).first_name
  end

  def test_it_finds_invoices_by_customer_id
    rows = InvoiceLoader.new.load_all('./data/invoices_fixture.csv')
    sales_engine = SalesEngine.new
    sales_engine.start
    ir = InvoiceRepo.new(rows, sales_engine)
    assert_equal "Joey", ir.find_customer_by_id(1).first_name
  end






end

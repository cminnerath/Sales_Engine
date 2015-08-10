require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require './lib/invoice_item'
require './lib/invoice_item_loader'
require "./lib/sales_engine"

class InvoiceItemRepoTest < Minitest::Test

  attr_reader :invoice_item  # => nil, nil

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
    result = repo.invoice_items["1"]
    assert_equal result, repo.find_by_id(1)
  end

  def test_it_can_find_by_item_id

    result = repo.invoice_items["1"]
    assert_equal result, repo.find_by_item_id(539)
  end

  def test_it_can_find_by_invoice_id
    skip
    result = repo.invoice_items["1"]
    assert_equal result, repo.find_by_invoice_id(5)
  end
  #
  # def find_by_customer_id(customer_id)
  #   invoice.detect { |key, value| value.customer_id == customer_id }.last
  # end
  #
  # def find_by_merchant_id(merchant_id)
  #   invoice.detect{ |key, value| value.merchant_id == merchant_id }.last
  # end
  #
  # def find_by_creation_date(created_at)
  #   invoice.detect { |key, value| value.created_at == created_at }.last
  # end
  #
  # def find_by_updated_date(updated_at)
  #   invoice.detect { |key, value| value.created_at == updated_at }.last
  # end
  #
  # def find_all_by_customer_id(customer_id)
  #   matches = invoice.select {|key, value| value.customer_id. == customer_id }
  #   matches.map {|key, value| value}
  # end
  #
  # def find_all_by_merchant_id(merchant_id)
  #   matches = invoice.select do |key, value|
  #     value.merchant_id == merchant_id
  #   end
  #   matches.map {|key, value| value}
  # end
  #
  # def find_all_by_creation_date(created_at)
  #   matches = invoice.select {|key, value| value.created_at == created_at }.to_a
  #   matches.map {|key, value| value}
  # end
  #
  # def find_all_by_updated_date(updated_at)
  #   matches = invoice.select {|key, value| value.updated_at == updated_at }.to_a
  #   matches.map {|key, value| value}
  # end
  #
  # def find_customer_by_id(id)
  #   @sales_engine.find_customer_by_id(id)
  # end
  #
  # def find_transactions_for_invoice(invoice_id)
  #   @sales_engine.find_transactions_for_invoice(invoice_id)
  # end
  #
  # def find_merchant_for_invoice(merchant_id)
  #   @sales_engine.find_merchant_for_invoice(merchant_id)
  # end

end

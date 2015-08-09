require_relative 'invoice'
require_relative './invoice_loader'

class InvoiceRepo
  attr_reader :invoice  # => nil, nil

  def initialize(rows, sales_engine)
    @invoice ||= load_invoice(rows)
    @sales_engine = sales_engine
  end

  def load_invoice(rows)
    @invoice = Hash.new(0)
    rows.map { |row| @invoice[row[:id]] = Invoice.new(row, self) }
    @invoice
  end

  def find_all
    @invoice
  end

  def find_random
    @invoice.keys.sample
  end

  def find_by_id(id)
    invoice.detect { |key, value| value.id == id }.last
  end

  def find_by_customer_id(customer_id)
    invoice.detect { |key, value| value.customer_id == customer_id }.last
  end

  def find_by_merchant_id(merchant_id)
    invoice.detect{ |key, value| value.merchant_id == merchant_id }.last
  end

  def find_by_creation_date(created_at)
    invoice.detect { |key, value| value.created_at == created_at }.last
  end

  def find_by_updated_date(updated_at)
    invoice.detect { |key, value| value.created_at == updated_at }.last
  end

  def find_all_by_customer_id(customer_id)
    matches = invoice.select {|key, value| value.customer_id. == customer_id }
    matches.map {|key, value| value}
  end

  def find_all_by_merchant_id(merchant_id)
    matches = invoice.select do |key, value|
      value.merchant_id == merchant_id
    end
    matches.map {|key, value| value}
  end

  def find_all_by_creation_date(created_at)
    matches = invoice.select {|key, value| value.created_at == created_at }.to_a
    matches.map {|key, value| value}
  end

  def find_all_by_updated_date(updated_at)
    matches = invoice.select {|key, value| value.updated_at == updated_at }.to_a
    matches.map {|key, value| value}
  end

  def find_customer_by_id(id)
    @sales_engine.find_customer_by_id(id)
  end

  def find_transactions_for_invoice(invoice_id)
    @sales_engine.find_transactions_for_invoice(invoice_id)
  end

  def find_merchant_for_invoice(merchant_id)
    @sales_engine.find_merchant_for_invoice(merchant_id)
  end
end

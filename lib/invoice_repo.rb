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
    rows.map { |row| @invoice[row[:id]] = Customer.new(row) }
    @invoice
  end

  def find_all
    @invoice
  end

  def find_random
    @invoice.keys.sample
  end

  def find_by_id(id)
    invoice.select { |key, value| value.id == id }
  end

  def find_by_first_name(customer_id)
    invoice.select { |key, value| value.customer_id == customer_id }
  end

  def find_by_merchant_id(merchant_id)
    invoice.select{ |key, value| value.merchant_id == merchant_id }
  end

  def find_by_creation_date(date)
    invoice.select { |key, value| value.created_at == date }
  end

  def find_by_updated_date(date)
    invoice.select { |key, value| value.created_at == date }
  end

  def find_all_by_customer_id(customer_id)
    matches = invoice.select {|key, value| value.customer_id == customer_id }
    matches.map {|key, value| value}
  end

  def find_all_by_merchant_id(merchant_id)
    matches = invoice.select {|key, value| value.merchant_id == merchant_id }
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

end

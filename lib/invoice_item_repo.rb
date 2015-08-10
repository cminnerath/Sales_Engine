require_relative 'invoice_item'
require_relative './invoice_item_loader'

class InvoiceItemRepo
  attr_reader :invoice_items

  def initialize(rows, sales_engine)
    @invoice_items ||= load_invoice_items(rows)
    @sales_engine = sales_engine
  end

  def load_invoice_items(rows)
    @invoice_items = Hash.new(0)
    rows.map { |row| @invoice_items[row[:id]] = InvoiceItem.new(row, self) }
    @invoice_items
  end

  def find_all
    invoice_items
  end

  def find_random
    invoice_items.keys.sample
  end

  def find_by_id(id)
    invoice_items.detect { |key, value| value.id == id }.last
  end

  def find_by_item_id(item_id)
    invoice_items.detect { |key, value| value.item_id == item_id }.last
  end

  def find_by_invoice_id(invoice_id)
    invoice_items.detect { |key, value| value.invoice_id == invoice_id }.last
  end

  def find_by_quantity(quantity)
    invoice_items.detect { |key, value| value.quantity == quantity }.last
  end

  def find_by_unit_price(price)
    invoice_items.detect { |key, value| value.unit_price == price }.last
  end

  def find_by_creation_date(created_at)
    invoice_items.detect { |key, value| value.created_at == created_at }.last
  end

  def find_by_updated_date(updated_at)
    invoice_items.detect { |key, value| value.updated_at == updated_at }.last
  end

  def find_all_by_invoice_id(invoice_id)
    matches = invoice_items.select {|key, value| value.invoice_id == invoice_id }
    matches.map {|key, value| value}
  end

  def find_all_by_customer_id(customer_id)
    matches = invoice_items.select {|key, value| value.customer_id == customer_id }
    matches.map {|key, value| value}
  end

  def find_all_by_quantity(quantity)
    matches = invoice_items.select {|key, value| value.quantity == quantity }
    matches.map {|key, value| value}
  end

  def find_all_by_unit_price(price)
    matches = invoice_items.select {|key, value| value.unit_price == price }
    matches.map {|key, value| value}
  end

  def find_all_by_creation_date(created_at)
    matches = invoice_items.select {|key, value| value.created_at == created_at }.to_a
    matches.map {|key, value| value}
  end

  def find_all_by_updated_date(updated_at)
    matches = invoice_items.select {|key, value| value.updated_at == updated_at }.to_a
    matches.map {|key, value| value}
  end

end

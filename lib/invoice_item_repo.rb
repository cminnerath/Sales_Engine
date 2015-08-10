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
    @invoice_items
  end
  #
  # def find_random
  #   @invoice.keys.sample
  # end
  #
  def find_by_id(id)
    invoice_items.detect { |key, value| value.id == id }.last
  end

  def find_by_item_id(id)
    invoice_items.detect { |key, value| value.id == id }.last
  end

  def find_by_invoice_id(id)
    invoice_items.detect { |key, value| value.id == id }.last
  end

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

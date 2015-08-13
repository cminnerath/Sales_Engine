require 'bigdecimal'

class Merchant

  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :repository


  def initialize(parameters, repository)
    @id                             = parameters[:id].to_i
    @name                           = parameters[:name]
    @created_at                     = parameters[:created_at]
    @updated_at                     = parameters[:updated_at]
    @repository                     = repository
  end

  def items
    repository.find_items_for_merchant(id)
  end

  def invoices
    repository.find_invoices_for_merchant(id)
  end

  def total_revenue
    successful_invoices(invoices).flat_map do |invoice|
      invoice.invoice_items.flat_map do |invoice_item|
        (invoice_item.unit_price * invoice_item.quantity.to_i) /100
      end
    end.reduce(:+)
  end

  def revenue_by_date(date)
    revenue = successful_invoices_by_date(date).flat_map do |invoice|
      invoice.invoice_items.flat_map do |invoice_item|
        (invoice_item.unit_price * invoice_item.quantity.to_i) /100
      end
    end.reduce(:+)
  end

  def successful_invoices(invoice_collection)
    invoice_collection.select {|invoice| invoice.transactions.any?{|transaction| transaction.result == "success"}}
  end

  def unsuccessful_invoices(invoice_collection)
    invoice_collection.select {|invoice| invoice.transactions.any?{|transaction| transaction.result == "failed"}}
  end

  def successful_invoices_by_date(date)
    successful_invoices(invoices).select do |invoice|
      invoice.created_at == date
    end
  end

  def revenue(date = nil)
    if date == nil
      total_revenue
    else
      revenue_by_date(date)
    end
  end

  def favorite_customer_id
    a = successful_invoices(invoices).map do |invoice|
      invoice.customer_id
    end
    a.uniq.max_by{ |id| a.count( id ) }
  end

  def favorite_customer
    repository.sales_engine.customer_repository.find_by_id(favorite_customer_id)
  end
  
  def items_sold
    successful_invoices(invoices).flat_map do |invoice|
      invoice.invoice_items.flat_map do |invoice_item|
        invoice_item.unit_price
      end
    end.reduce(:+)
  end

  def most_quantity
    repository.find_quantity_from(successful_invoices).reduce(:+)
  end

  def paid_invoice_items
    successful_invoices(invoices).flat_map do |invoice|
      invoice.invoice_items
    end
  end

  def merchant_items_sold
   paid_invoice_items.map do |invoice_item|
     invoice_item.quantity
   end.reduce(:+)
 end
end

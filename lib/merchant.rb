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
    @repository                           = repository
  end

  def items
    repository.find_items_for_merchant(id)
  end

  def invoices
    repository.find_invoices_for_merchant(id)
  end
  #revenue returns the total revenue for that merchant across all transactions
  def total_revenue
    successful_invoices(invoices).flat_map do |invoice|
      invoice.invoice_items.flat_map do |invoice_item|
        invoice_item.unit_price.to_i * invoice_item.quantity.to_i
      end
    end.reduce(:+)
  end
## successful invoice items by date?
  def revenue_by_date(date)
    successful_invoices_by_date(date).flat_map do |invoice|
      invoice.invoice_items.flat_map do |invoice_item|
        invoice_item.unit_price.to_i * invoice_item.quantity.to_i
      end
    end.reduce(:+)
  end

  def successful_invoices(invoice_collection)
    invoice_collection.select {|invoice| invoice.transactions.any?{|transaction| transaction.result == "success"}}
  end

  def successful_invoices_by_date(date)
    successful_invoices(invoices).select do |invoice|
      invoice.updated_at == date
          require "pry";binding.pry
    end
  end

  def revenue(date = nil)
    if date == nil
      total_revenue
    else
      revenue_by_date(date)
    end
  end
end

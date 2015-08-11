class Invoice
  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at,
              :repository

  def initialize(parameters, repository)
    @id             = parameters[:id].to_i
    @customer_id    = parameters[:customer_id].to_i
    @merchant_id    = parameters[:merchant_id].to_i
    @status         = parameters[:status]
    @created_at     = parameters[:created_at]
    @updated_at     = parameters[:updated_at]
    @repository           = repository
  end

  def transactions
    repository.find_transactions_for_invoice(id)
  end

  def merchant
    repository.find_merchant_for_invoice(merchant_id)
  end

  def invoice_items
    repository.find_invoice_item_by_invoice_id(id)
  end

  def items
    item_id = invoice_items
    # require "pry"; binding.pry
    repository.find_item_by_invoice_item_id(item_id)
  end

  def customer
    repository.find_customer_by_invoice(customer_id)
  end

end

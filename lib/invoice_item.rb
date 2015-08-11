class InvoiceItem
  attr_reader :id,
              :item_id,
              :invoice_id,
              :quantity,
              :unit_price,
              :created_at,
              :updated_at,
              :repository

  def initialize(parameters, repository)
    @id             = parameters[:id].to_i
    @item_id        = parameters[:item_id].to_i
    @invoice_id     = parameters[:invoice_id].to_i
    @quantity       = parameters[:quantity].to_i
    @unit_price     = parameters[:unit_price]
    @created_at     = parameters[:created_at]
    @updated_at     = parameters[:updated_at]
    @repository           = repository
  end

  def invoice
    repository.find_invoices_by_id(invoice_id)
  end

  def item
    repository.find_item_by_invoice(item_id).last
  end

end

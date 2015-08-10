class InvoiceItem
  attr_reader :id,
              :item_id,
              :invoice_id,
              :quantity,
              :unit_price,
              :created_at,
              :updated_at,
              :repo

  def initialize(parameters, repo)
    @id             = parameters[:id].to_i
    @item_id        = parameters[:item_id].to_i
    @invoice_id     = parameters[:invoice_id].to_i
    @quantity       = parameters[:quantity].to_i
    @unit_price     = parameters[:unit_price]
    @created_at     = parameters[:created_at]
    @updated_at     = parameters[:updated_at]
    @repo           = repo
  end
end

class Invoice
  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at,
              :repo

  def initialize(parameters, repo)
    @id             = parameters[:id].to_i
    @customer_id    = parameters[:customer_id].to_i
    @merchant_id    = parameters[:merchant_id].to_i
    @status         = parameters[:status]
    @created_at     = parameters[:created_at]
    @updated_at     = parameters[:updated_at]
    @repo           = repo
  end

  def transactions
    repo.find_transactions_for_invoice(id)
  end

  def merchant
    repo.find_merchant_for_invoice(merchant_id)
  end

end

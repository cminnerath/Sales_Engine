class Merchant

  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :repo


  def initialize(parameters, repo)
    @id                             = parameters[:id].to_i
    @name                           = parameters[:name]
    @created_at                     = parameters[:created_at]
    @updated_at                     = parameters[:updated_at]
    @repo                           = repo
  end

  def items
    repo.find_items_for_merchant(id)
  end

  def invoices
    repo.find_invoices_for_merchant(id)
  end
end

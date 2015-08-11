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
end

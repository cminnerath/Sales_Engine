class Customer

  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at,
              :repository

    def initialize(parameters, repository)
      @id           = parameters[:id].to_i
      @first_name   = parameters[:first_name]
      @last_name    = parameters[:last_name]
      @created_at   = parameters[:created_at]
      @updated_at   = parameters[:updated_at]
      @repository         = repository
    end

    def invoices
      repository.find_invoices_by_customer(id)
    end

    def transactions
      invoices.flat_map do |invoice|
        invoice.transactions
      end
    end

end

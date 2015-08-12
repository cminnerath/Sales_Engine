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

    def successful_transactions
      transactions.select {|transaction| transaction.result == "success"}
    end

    def find_successful_invoices
      relevent = successful_transactions.flat_map do |transaction|
        repository.find_invoices_by_customer(transaction.invoice_id)
      end
      relevent.flat_map {|invoice| invoice.merchant_id}
    end

    def sort_successful_ids
      counted = find_successful_invoices.inject(Hash.new(0)) {|key, value| key[value] +=1; key}
      counted.sort_by {|key, value| -value}
    end

    def favorite_merchant
      repository.find_favorite_merchant(sort_successful_ids.flatten[0])
    end

end

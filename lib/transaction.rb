class Transaction

  attr_reader :id,
              :invoice_id,
              :credit_card_number,
              :credit_card_expiration_date,
              :result,
              :created_at,
              :updated_at

    def initialize(parameters)
      @id                             = parameters[:id].to_i
      @invoice_id                     = parameters[:invoice_id]
      @credit_card_number             = parameters[:credit_card_number]
      @credit_card_expiration_date    = parameters[:credit_card_expiration_date]
      @result                         = parameters[:result]
      @created_at                     = parameters[:created_at]
      @updated_at                     = parameters[:updated_at]
    end
end

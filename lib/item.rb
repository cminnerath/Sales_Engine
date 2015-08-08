class Item

  attr_reader :id,
              :name,
              :description,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at

    def initialize(parameters, repo)
      @id           = parameters[:id].to_i
      @name         = parameters[:name]
      @description  = parameters[:description]
      @unit_price   = parameters[:unit_price]
      @merchant_id   = parameters[:merchant_id]
      @created_at   = parameters[:created_at]
      @updated_at   = parameters[:updated_at]
      @repo = repo
    end
end

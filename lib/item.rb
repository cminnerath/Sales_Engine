require 'bigdecimal'

class Item

  attr_reader :id,
              :name,
              :description,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at,
              :repository

    def initialize(parameters, repository)
      @id           = parameters[:id].to_i
      @name         = parameters[:name]
      @description  = parameters[:description]
      @unit_price   = (BigDecimal.new(parameters[:unit_price]) /100).to_f
      # require "pry";binding.pry
      @merchant_id   = parameters[:merchant_id].to_i
      @created_at   = parameters[:created_at]
      @updated_at   = parameters[:updated_at]
      @repository         = repository

    end

    def merchant
      repository.find_merchant_by_item(merchant_id)
    end

    def invoice_items
      repository.find_invoice_items_by_item(id)
    end


    def size
    end
end

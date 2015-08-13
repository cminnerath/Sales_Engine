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
      @unit_price   = BigDecimal.new(parameters[:unit_price])
      @merchant_id  = parameters[:merchant_id].to_i
      @created_at   = parameters[:created_at]
      @updated_at   = parameters[:updated_at]
      @repository   = repository

    end

    def merchant
      repository.find_merchant_by_item(merchant_id)
    end

    def invoice_items
      repository.find_invoice_items_by_item(id)
    end

    def find_invoices
      invoice_items.map do |invoice_item|
        invoice_item.invoice
      end
    end

    def invoice_dates
      find_invoices.map do |invoice|
        invoice.created_at
      end
    end

    def invoice_date_calculator
      invoice_dates.inject(Hash.new(0)) do |hash, date|
        hash[date] += 1; hash
      end
    end

    def best_day
      best_day = invoice_date_calculator.max_by do |date, calc|
        calc
      end
      best_day[0]
    end

    def revenue
      
    end
end

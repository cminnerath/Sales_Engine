class Merchant

  attr_reader :id,
              :name,
              :created_at,
              :updated_at

    def initialize(parameters)
      @id                             = parameters[:id].to_i
      @name                           = parameters[:name]
      @created_at                     = parameters[:created_at]
      @updated_at                     = parameters[:updated_at]
    end
end

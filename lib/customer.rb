class Customer

  attr_reader :id, :first_name, :last_name, :created_at, :updated_at

    def initialize(parameters)
      @id           = parameters[:id]
      @first_name   = parameters[:first_name]
      @last_name    = parameters[:last_name]
      @created_at   = parameters[:created_at]
      @updated_at   = parameters[:updated_at]
    end

    #

end

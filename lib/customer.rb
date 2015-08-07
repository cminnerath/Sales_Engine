class Customer

  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at,
              :repo

    def initialize(parameters, repo)
      @id           = parameters[:id].to_i
      @first_name   = parameters[:first_name]
      @last_name    = parameters[:last_name]
      @created_at   = parameters[:created_at]
      @updated_at   = parameters[:updated_at]
<<<<<<< HEAD
      @repo         = repo
=======
>>>>>>> master
    end

end

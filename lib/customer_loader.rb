require 'csv'
require "pry"
require_relative 'customer_repo'

class CustomerLoader

  def load_all(file ="./data/customers.csv")
    CSV.open(file, headers: true, header_converters: :symbol)
  end

end

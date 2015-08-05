require_relative 'customer'         # => true, false
require_relative 'customer_loader'  # => false, true

class CustomerRepo

  attr_reader :customers  # => nil, nil

  def initialize(rows, sales_engine)
    @customers ||= load_customers(rows)
    @sales_engine = sales_engine
  end

  def load_customers(rows)
    @customers = Hash.new(0)
    rows.map { |row| @customers[row[:id]] = Customer.new(row) }
    @customers
  end

  def find_all
    @customers
  end

  def find_random
    @customers.sample
  end
  #repo will have alot of the methods. Keep SE away from Loader AND CSV

  def find_by_id(id)
    @customers.find_by(:id, id)
  end

end

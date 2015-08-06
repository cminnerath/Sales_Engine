require_relative 'customer'           # => true, false
require_relative './customer_loader'  # => false, true

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


  def find_by_id(id)
    customers.select { |key, value| value.id == id }
  end

  def find_by_first_name(first_name)
    customers.select { |key, value| value.first_name.downcase == first_name.downcase }
  end

  def find_by_last_name(last_name)
    customers.select { |key, value| value.last_name == last_name }
  end

  def find_all_by_name(first_name)
    matches = @customers.select {|key, value| value.first_name.downcase == first_name.downcase }
    matches.map {|key, value| value}
  end

  def find_all
    @customers
  end

  def find_random
    @customers.keys.sample
  end

end

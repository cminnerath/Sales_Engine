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

  def find_all
    @customers
  end

  def find_random
    @customers.keys.sample
  end

  def find_by_id(id)
    customers.detect { |key, value| value.id == id }.last
  end

  def find_by_first_name(first_name)
    customers.select { |key, value| value.first_name.downcase == first_name.downcase }
  end

  def find_by_last_name(last_name)
    customers.select{ |key, value| value.last_name.downcase == last_name.downcase }
  end

  def find_by_creation_date(date)
    customers.select { |key, value| value.created_at == date }
  end

  def find_by_updated_date(date)
    customers.select { |key, value| value.created_at == date }
  end

  def find_all_by_first_name(first_name)
    matches = customers.select {|key, value| value.first_name.downcase == first_name.downcase }
    matches.map {|key, value| value}
  end

  def find_all_by_last_name(last_name)
    matches = customers.select {|key, value| value.last_name.downcase == last_name.downcase }
    matches.map {|key, value| value}
  end

  def find_all_by_creation_date(created_at)
    matches = customers.select {|key, value| value.created_at == created_at }.to_a
    matches.map {|key, value| value}
  end

  def find_all_by_updated_date(updated_at)
    matches = customers.select {|key, value| value.updated_at == updated_at }.to_a
    matches.map {|key, value| value}
  end
end

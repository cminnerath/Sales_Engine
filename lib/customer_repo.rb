require_relative 'customer'
require_relative './customer_loader'

class CustomerRepo

  attr_reader :customers

  def initialize(rows, sales_engine)
    @customers ||= load_customers(rows)
    @sales_engine = sales_engine
  end

  def load_customers(rows)
    @customers = Hash.new(0)
    rows.map { |row| @customers[row[:id]] = Customer.new(row, self) }
    @customers
  end

  def find_all
    customers
  end

  def find_random
    customers.keys.sample
  end

  def find_by_id(id)
    customers.detect { |key, value| value.id == id }.last
  end

  def find_by_first_name(first_name)
    customers.detect { |key, value| value.first_name.downcase == first_name.downcase }.last
  end

  def find_by_last_name(last_name)
    customers.detect { |key, value| value.last_name.downcase == last_name.downcase }.last
  end

  def find_by_creation_date(date)
    customers.detect { |key, value| value.created_at == date }.last
  end

  def find_by_updated_date(date)
    customers.detect { |key, value| value.created_at == date }.last
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

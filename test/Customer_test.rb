require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require "./lib/customer"

class CustomerTest < Minitest::Test

  def test_it_can_access_customer_id
		file = "./data/customers_fixture.csv"
		customer_csv = CSV.open(file, headers: true, header_converters: :symbol)
		customer_collection = customer_csv.map { |row| Customer.new(row) }
		id = customer_collection[0].id
    assert_equal 1 , id
  end

  def test_it_can_access_customers_first_name
		file = "./data/customers_fixture.csv"
		customer_csv = CSV.open(file, headers: true, header_converters: :symbol)
		customer_collection = customer_csv.map { |row| Customer.new(row) }
		first_name = customer_collection[0].first_name
    assert_equal "Joey" , first_name
  end

  def test_it_can_access_customers_last_name
		file = "./data/customers_fixture.csv"
		customer_csv = CSV.open(file, headers: true, header_converters: :symbol)
		customer_collection = customer_csv.map { |row| Customer.new(row) }
		last_name = customer_collection[0].last_name
    assert_equal "Ondricka" , last_name
  end

#find how to store time in Ruby class

  def test_it_can_access_customers_creation_date
  	file = "./data/customers_fixture.csv"
  	customer_csv = CSV.open(file, headers: true, header_converters: :symbol)
  	customer_collection = customer_csv.map { |row| Customer.new(row) }
  	created_at = customer_collection[0].created_at
    assert_equal "2012-03-27 14:54:09 UTC" , created_at
  end

  def test_it_can_access_customers_updated_date
  	file = "./data/customers_fixture.csv"
  	customer_csv = CSV.open(file, headers: true, header_converters: :symbol)
  	customer_collection = customer_csv.map { |row| Customer.new(row) }
  	updated_at = customer_collection[0].updated_at
    assert_equal "2012-03-27 14:54:09 UTC" , updated_at
  end

end

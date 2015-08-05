require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require "./lib/customer_repo"


class CustomerRepoTest < Minitest::Test

  def test_it_puts_data_in_correct_columns
    skip
    
		file = "./data/customers_fixture.csv"
		customer_csv = CSV.open(file, headers: true, header_converters: :symbol)
    cr = CustomerRepo.new(customer_csv, self)
    result = "wow"
	  require "pry";binding.pry
    assert_equal result, cr
  end
end

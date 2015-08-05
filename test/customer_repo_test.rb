require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require "./lib/customer_repo"
require "./lib/sales_engine"


class CustomerRepoTest < Minitest::Test


  def test_it_can_find_all
    skip
    custtest = CustomerRepo.new(CustomerLoader.new.load_all("./data/customers_fixture.csv"), nil)
    cust = custtest.find_all
    assert_equal Hash, cust.class
  end

  def test_other_method
    custtest = CustomerRepo.new("./data/customers_fixture.csv", nil)
    cust = custtest.find_all
    assert_equal Hash, cust.class
  end



end

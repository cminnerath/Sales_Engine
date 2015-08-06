require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require "./lib/customer"
require "./lib/customer_repo"
require "./lib/sales_engine"


class CustomerRepoTest < Minitest::Test

  def test_it_can_find_by_id
    rows = CustomerLoader.new.load_all('./data/customers_fixture.csv')
    cr = CustomerRepo.new(rows, "sales_engine")
    result = cr.customers["1"]
    assert_equal result, cr.find_by_id(1).values[0]
  end

  def test_it_finds_all_matches_for_first_name
    rows = CustomerLoader.new.load_all('./data/customers_fixture.csv')
    cr = CustomerRepo.new(rows, "sales_engine")
    assert_equal 2, cr.find_all_by_name( "joey").length
  end

  def test_it_finds_single_match_for_first_name
    rows = CustomerLoader.new.load_all('./data/customers_fixture.csv')
    cr = CustomerRepo.new(rows, "sales_engine")
    result = cr.customers["6"]
    assert_equal result, cr.find_by_first_name( "Sylvester").values[0]
  end

  def test_it_finds_all_customers
    rows = CustomerLoader.new.load_all('./data/customers_fixture.csv')
    cr = CustomerRepo.new(rows, "sales_engine")
    result = cr.customers
    assert_equal result, cr.find_all
    assert_equal Hash, result.class
  end


end

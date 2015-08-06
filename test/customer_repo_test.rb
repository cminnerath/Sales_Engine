require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require "./lib/customer"
require "./lib/customer_repo"
require "./lib/sales_engine"


class CustomerRepoTest < Minitest::Test

  def test_it_finds_all_customers
    rows = CustomerLoader.new.load_all('./data/customers_fixture.csv')
    cr = CustomerRepo.new(rows, "sales_engine")
    result = cr.customers
    assert_equal result, cr.find_all
    assert_equal Hash, result.class
  end

  def test_it_can_find_by_id
    rows = CustomerLoader.new.load_all('./data/customers_fixture.csv')
    cr = CustomerRepo.new(rows, "sales_engine")
    result = cr.customers["1"]
    assert_equal result, cr.find_by_id(1).values[0]
  end

  def test_it_finds_single_match_for_first_name
    rows = CustomerLoader.new.load_all('./data/customers_fixture.csv')
    cr = CustomerRepo.new(rows, "sales_engine")
    result = cr.customers["6"]
    assert_equal result, cr.find_by_first_name( "Sylvester").values[0]
  end

  def test_it_finds_single_match_for_last_name
    rows = CustomerLoader.new.load_all('./data/customers_fixture.csv')
    cr = CustomerRepo.new(rows, "sales_engine")
    result = cr.customers["7"]
    assert_equal result, cr.find_by_last_name("Kuhn").values[0]
  end

  def test_it_can_find_customers_by_creation_date
    rows = CustomerLoader.new.load_all('./data/customers_fixture.csv')
    cr = CustomerRepo.new(rows, "sales_engine")
    result = cr.customers["7"]
    assert_equal result, cr.find_by_creation_date("2012-03-27 14:54:11 UTC").values[0]
  end

  def test_it_can_find_customers_by_updated_date
    rows = CustomerLoader.new.load_all('./data/customers_fixture.csv')
    cr = CustomerRepo.new(rows, "sales_engine")
    result = cr.customers["7"]
    assert_equal result, cr.find_by_updated_date("2012-03-27 14:54:11 UTC").values[0]
  end

  def test_it_finds_all_matches_for_first_name
    rows = CustomerLoader.new.load_all('./data/customers_fixture.csv')
    cr = CustomerRepo.new(rows, "sales_engine")
    assert_equal 2, cr.find_all_by_first_name("Joey").length
  end

  def test_it_find_all_matches_for_last_name
    rows = CustomerLoader.new.load_all('./data/customers_fixture.csv')
    cr = CustomerRepo.new(rows, "sales_engine")
    assert_equal 2, cr.find_all_by_last_name( "Ondricka").length
  end

  def test_it_finds_all_matches_by_creation_date
    rows = CustomerLoader.new.load_all('./data/customers_fixture.csv')
    cr = CustomerRepo.new(rows, "sales_engine")
    assert_equal 4, cr.find_all_by_creation_date("2012-03-27 14:54:10 UTC").count
  end

  def test_it_finds_all_matches_by_updated_date
    rows = CustomerLoader.new.load_all('./data/customers_fixture.csv')
    cr = CustomerRepo.new(rows, "sales_engine")
    assert_equal 2, cr.find_all_by_updated_date("2012-03-27 14:54:09 UTC").count
  end

  def test_that_finds_all_returns_empty_array_when_no_matches_are_found
    rows = CustomerLoader.new.load_all('./data/customers_fixture.csv')
    cr = CustomerRepo.new(rows, "sales_engine")
    result = []
    assert_equal result, cr.find_all_by_first_name("Adam")
    assert_equal result, cr.find_all_by_last_name( "Minewrath")
    assert_equal result, cr.find_all_by_updated_date("2012-03-27 12:59:59 UTC")
    assert_equal result, cr.find_all_by_creation_date("2012-03-27 12:59:59 UTC")
  end

end

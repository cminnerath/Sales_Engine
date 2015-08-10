require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require_relative "../lib/merchant"
require_relative "../lib/merchant_repo"
require_relative "../lib/sales_engine"

class MerchantRepoTest < Minitest::Test

  attr_reader :engine, :repo

  def setup
    @engine = SalesEngine.new("./test/fixtures")
    engine.start
    @repo = engine.merchant_repo
  end

  def test_it_finds_all_merchants
    result = repo.merchants
    assert_equal result, repo.find_all
    assert_equal Hash, result.class
  end

  def test_it_can_find_by_id
    result = repo.merchants["1"]
    assert_equal result, repo.find_by_id(1)
  end

  def test_it_finds_single_match_for_first_name
    result = repo.merchants["5"]
    assert_equal result, repo.find_by_name("Williamson Group")
  end

  def test_it_can_find_customers_by_creation_date
    result = repo.merchants["10"]
    assert_equal result, repo.find_by_creation_date("2012-03-27 14:54:00 UTC")
  end

  def test_it_can_find_customers_by_updated_date
    result = repo.merchants["10"]
    assert_equal result, repo.find_by_updated_date("2012-03-27 14:54:00 UTC")
  end

  def test_it_can_find_all_merchants_by_name
    assert_equal 2 , repo.find_all_by_name("Williamson Group").count
  end

  def test_it_finds_all_merchants_by_creation_date
    assert_equal 3, repo.find_all_by_creation_date("2012-03-27 14:54:00 UTC").count
  end

  def test_it_finds_all_matches_by_updated_date
    assert_equal 3, repo.find_all_by_updated_date("2012-03-27 14:54:00 UTC").count
  end

end

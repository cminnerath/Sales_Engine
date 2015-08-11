require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require_relative "../lib/transaction"
require_relative "../lib/transaction_repository"
require_relative "../lib/sales_engine"

class TransactionRepositoryTest < Minitest::Test

  def setup
    rows = TransactionLoader.new.load_all('./data/transactions_fixture.csv')
    tr = TransactionRepository.new(rows, "sales_engine")
  end

  def test_it_finds_all_transactions
    rows = TransactionLoader.new.load_all('./data/transactions_fixture.csv')
    tr = TransactionRepository.new(rows, "sales_engine")
    result = tr.transactions
    assert_equal result, tr.find_all
  end

  def test_it_can_find_by_id
    rows = TransactionLoader.new.load_all('./data/transactions_fixture.csv')
    tr = TransactionRepository.new(rows, "sales_engine")
    result = tr.transactions["1"]
    assert_equal result, tr.find_by_id(1)
  end

  def test_it_finds_single_match_by_invoice_id
    rows = TransactionLoader.new.load_all('./data/transactions_fixture.csv')
    tr = TransactionRepository.new(rows, "sales_engine")
    result = tr.transactions["3"]
    assert_equal result, tr.find_by_invoice_id("4")
  end

  def test_it_finds_single_match_by_credit_card_number
    rows = TransactionLoader.new.load_all('./data/transactions_fixture.csv')
    tr = TransactionRepository.new(rows, "sales_engine")
    result = tr.transactions["3"]
    assert_equal result, tr.find_by_credit_card_number('4354495077693036')
  end

  def test_it_finds_single_match_by_credit_card_exp_date
    rows = TransactionLoader.new.load_all('./data/transactions_fixture.csv')
    tr = TransactionRepository.new(rows, "sales_engine")
    result = tr.transactions["1"]
    assert_equal result, tr.find_by_credit_card_exp_date('1234')
  end

  def test_it_works_when_there_are_no_exp_dates
    rows = TransactionLoader.new.load_all('./data/transactions_fixture.csv')
    tr = TransactionRepository.new(rows, "sales_engine")
    result = nil
    assert_equal result, tr.check_cc_exp_date_for_nil("")
  end

  def test_if_finds_single_match_for_result_status
    rows = TransactionLoader.new.load_all('./data/transactions_fixture.csv')
    tr = TransactionRepository.new(rows, "sales_engine")
    result = tr.transactions["1"]
    assert_equal result, tr.find_by_result("success")
  end

  def test_it_can_find_customers_by_creation_date
    rows = TransactionLoader.new.load_all('./data/transactions_fixture.csv')
    tr = TransactionRepository.new(rows, "sales_engine")
    result = tr.transactions["1"]
    assert_equal result, tr.find_by_creation_date("2012-03-27 14:54:09 UTC")
  end

  def test_it_can_find_customers_by_updated_date
    rows = TransactionLoader.new.load_all('./data/transactions_fixture.csv')
    tr = TransactionRepository.new(rows, "sales_engine")
    result = tr.transactions["1"]
    assert_equal result, tr.find_by_updated_date("2012-03-27 14:54:09 UTC")
  end

  def test_it_finds_all_matches_for_credit_card_number
    rows = TransactionLoader.new.load_all('./data/transactions_fixture.csv')
    tr = TransactionRepository.new(rows, "sales_engine")
    result = 2
    assert_equal result, tr.find_all_by_credit_card("4654405418249632").length
  end

  def test_it_finds_all_matches_for_credit_card_exp
    rows = TransactionLoader.new.load_all('./data/transactions_fixture.csv')
    tr = TransactionRepository.new(rows, "sales_engine")
    result = 2
    assert_equal result, tr.find_all_by_credit_card_exp("1234").length
  end

  def test_it_finds_all_matches_by_result
    rows = TransactionLoader.new.load_all('./data/transactions_fixture.csv')
    tr = TransactionRepository.new(rows, "sales_engine")
    result = 10
    assert_equal result, tr.find_all_by_result("success").length
  end

  def test_it_finds_all_matches_by_creation_date
    rows = TransactionLoader.new.load_all('./data/transactions_fixture.csv')
    cr = TransactionRepository.new(rows, "sales_engine")
    assert_equal 8, cr.find_all_by_updated_date("2012-03-27 14:54:10 UTC").count
  end

  def test_it_finds_all_matches_by_updated_date
    rows = TransactionLoader.new.load_all('./data/transactions_fixture.csv')
    cr = TransactionRepository.new(rows, "sales_engine")
    assert_equal 8, cr.find_all_by_updated_date("2012-03-27 14:54:10 UTC").count
  end
end

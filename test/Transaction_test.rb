require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require "./lib/transaction"

class TransactionTest < Minitest::Test

  attr_reader :engine, :repo

  def setup
    @engine = SalesEngine.new("./test/fixtures")
    engine.start
    @repo = engine.transaction_repo
  end

  def test_it_can_access_id
    tran = repo.find_by_id(1)
    assert_equal 1, id
  end

  def test_it_can_access_invoice_id
    skip
    invoice_id = setup[0].invoice_id
    assert_equal "1", invoice_id
  end

  def test_it_can_access_invoice_id
    skip
    invoice_id = setup[8].invoice_id
    assert_equal "10", invoice_id
  end

  def test_it_can_access_by_cc_number
    skip
    credit_card_number = setup[9].credit_card_number
    assert_equal "4923661117104166", credit_card_number
  end

  def test_it_can_access_by_cc_expiration_date
    skip
    credit_card_expiration_date = setup[8].credit_card_expiration_date
    result = "0218"
    assert_equal result, credit_card_expiration_date
  end

  def test_it_can_access_by_result
    skip
    result = setup[2].result
    assert_equal "success", result
  end

  def test_it_can_access_by_created_at_date
    skip
    created_at = setup[3].created_at
    assert_equal "2012-03-27 14:54:10 UTC", created_at
  end

  def test_it_can_access_by_updated_at_date
    skip
    updated_at = setup[0].updated_at
    assert_equal "2012-03-27 14:54:09 UTC", updated_at
  end

end

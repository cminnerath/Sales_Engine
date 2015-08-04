require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchant_repo'
require './lib/merchant'
# require '../data/merchants.csv'

class MerchantRepoTest < Minitest::Test


  def test_blank_array
    testmerchants = MerchantRepo.new
    assert_equal Array, testmerchants.merchants.class
  end

  def test_it_can_import_csv
    skip
    testmerchants = MerchantRepo.new
    read = testmerchants.load_file
    refute_nil read
  end

  def test_we_can_read_and_shovel
    skip
    testmerchants = MerchantRepo.new
    read = testmerchants.load_data
    assert_equal 100, read.read_data
  end

  def test_loader_blank
    n = Loader.load(MerchantRepo.new, "./data/merchants.csv")
    refute_nil tester

  end


end

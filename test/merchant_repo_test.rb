require 'minitest/autorun'
require 'minitest/pride'
require '../lib/merchant_repo'
require '../lib/merchant'

class MerchantRepoTest < Minitest::Test

  def test_it_can_import_csv
    testmerchants = MerchantRepo.new
    read = testmerchants.read_list
    refute_nil read
  end


end

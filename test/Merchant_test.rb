require 'minitest/autorun'
require 'minitest/pride'
require_relative 'merchant_repo'
require_relative 'merchant'

class MerchantTest < Minitest::Test

  def initialize(id, name, created_at, updated_at)
    @id = id
    @name = name
    @created_at = created_at
    @updated_at = updated_at
  end


end

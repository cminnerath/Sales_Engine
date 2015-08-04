require_relative 'merchant'
require 'csv'

class MerchantRepo
  attr_accessor :merchants

  def read_list
    @merchants = CSV.open '../data/merchants.csv', headers: true, header_converters: :symbol
  end



end

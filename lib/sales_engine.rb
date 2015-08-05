require 'csv'
require_relative 'customer_loader'
require_relative 'customer_repo'

class SalesEngine

  attr_reader :customer_repo,
              :customer_data

  def initialize
    @customer_data = CustomerLoader.new.load_all
  end

  def start
    @customer_repo = CustomerRepo.new(@customer_data, self)
  end

end

se = SalesEngine.new
puts se.start

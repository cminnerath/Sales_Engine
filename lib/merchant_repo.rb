require_relative 'merchant'
require_relative './merchant_loader'

class MerchantRepo

  attr_reader :merchants
  def initialize(rows, sales_engine)
    @merchants ||= load_merchants(rows)
    @sales_engine = sales_engine
  end

  def load_merhants(rows)
    @merchants = Hash.new(rows)
    rows.map {|row| @merchants[row[:id]] = Merchant.new(row) }
    @merchants
  end

  def find_all
    merchants
  end

  def find_random
    merchants.keys.sample
  end

  def find_by_id(id)
    merchants.detect { |key, value| value.id == id }.last
  end

  def find_by_name(name)
    merchants.detect { |key, value| value.name.downcase == name.downcase }.last
  end

  def find_by_creation_date(date)
    merchants.detect { |key, value| value.created_at == date }.last
  end

  def find_by_updated_date(date)
    merchants.detect { |key, value| value.created_at == date }.last
  end

  def find_all_by_name(name)
    matches = merchants.select {|key, value| value.name.downcase == name.downcase }
    matches.map {|key, value| value}
  end

  def find_all_by_creation_date(created_at)
    matches = merchants.select {|key, value| value.created_at == created_at }.to_a
    matches.map {|key, value| value}
  end

  def find_all_by_updated_date(updated_at)
    matches = merchants.select {|key, value| value.updated_at == updated_at }.to_a
    matches.map {|key, value| value}
  end

end

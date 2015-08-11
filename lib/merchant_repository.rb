require_relative 'merchant'
require_relative './merchant_loader'

class MerchantRepository

  attr_accessor :merchants, :sales_engine

  def initialize(rows, sales_engine)
    @merchants ||= load_merchants(rows)
    @sales_engine = sales_engine
  end

  def load_merchants(rows)
    merchants_hash = Hash.new
    before = rows.map do |row|
      merchants_hash[row[:id]] = Merchant.new(row, self)
    end
    merchants_hash
  end

  def find_all
    merchants
  end

  def random
    merchants.values.sample
  end

  def find_by_id(id)
    merchants.detect { |key, value| value.id == id }.last
  end

  def find_by_merchant_id(merchant_id)
    merchants.detect { |key, value| value.merchant_id == merchant_id }.last
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

  def find_items_for_merchant(merchant_id)
    sales_engine.find_items_for_merchant(merchant_id)
  end

  def find_invoices_for_merchant(merchant_id)
    sales_engine.find_invoices_for_merchant(merchant_id)
  end

  def inspect
    "#<#{self.class} #{@all.size} rows>"
  end
end

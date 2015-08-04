require_relative './merchant'
require 'CSV'

class MerchantRepo
  attr_accessor :merchants
  attr_reader   :load

  def initialize
    @merchants = []
  end

  def load_file(filename = "./data/merchants.csv")
    FileIO.get_csv(filename).each do |row|
      add_object(row)
    end
  end

  def add_object(row)  # expecting a row--HASH-from the loader
    @merchants << Merchant.new(row[:id], row[:name], row[:created_at], row[:updated_at])
  end

end


class Loader
  attr_reader :repository, :filename, :load

    def self.load(repository, filename)
      FileIO.get_csv(filename).each do |row|
        repository.add_object(row)
      end
    end

end

class FileIO

  def self.get_csv(filename = "./data/merchants.csv")
    CSV.open (filename), headers: true, header_converters: :symbol
  end

end

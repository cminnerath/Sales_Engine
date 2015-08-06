require 'csv'
require_relative 'customer_loader'
require_relative 'customer_repo'

class SalesEngine

  attr_accessor :customer_data,    :customer_repo,
                :merchant_data,    :merchant_repo,
                :invoice_data,     :invoice_repo,
                :item_data,        :item_repo,
                :invoice_item_data,:invoice_item_repo,
                :transaction_data, :transaction_repo

  def initialize
    @customer_data        = CustomerLoader.new.load_all
    # @merchant_data        = MerchantLoader.new.load_all
    # @invoice_data         = InvoiceLoader.new.load_all
    # @item_data            = ItemLoader.new.load_all
    # @invoice_item_data    = InvoiceItemLoader.new.load_all
    # @transaction_data     = TransactionLoader.new.load_all
  end

  def start
    @customer_repo    = CustomerRepo.new(@customer_data, self)
    # @merchant_repo    = MerchantRepo.new(@merchant_data, self)
    # @invoice_repo     = InvoiceRepo.new(@invoice_data, self)
    # @item_repo        = ItemRepo.new(@item_data, self)
    # @invoice_item_repo = InvoiceItemRepo.new(@invoice_item_data, self)
    # @transaction_repo = TransactionRepo.new(@transaction_data, self)
  end

end

se = SalesEngine.new
puts se.start

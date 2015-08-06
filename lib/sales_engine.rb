require 'csv'
require_relative 'customer_loader'
require_relative 'customer_repo'

class SalesEngine

  attr_accessor :customer_repo,
                :customer_data,
                :merchant_data,
                :invoice_data,
                :item_data,
                :invoiceitem_data,
                :transaction_data,
                :customer_repo,
                :merchant_repo,
                :invoice_repo,
                :item_repo,
                :invoiceitem_repo,
                :transaction_repo




  def initialize
    @customer_data = CustomerLoader.new.load_all
    @merchant_data = MerchantLoader.new.load_all
    @invoice_data  = InvoiceLoader.new.load_all
    @item_data     =     ItemLoader.new.load_all
    @invoiceitem_data =     InvoiceItemLoader.new.load_all
    @transaction_data = TransactionLoader.new.load_all


  end

  def start
    @customer_repo = CustomerRepo.new(@customer_data, self)
    @merchant_repo = MerchantRepo.new(@merchant_data, self)
    @invoice_repo = InvoiceRepo.new(@invoice_data, self)
    @item_repo = ItemRepo.new(@item_data, self)
    @invoiceitem_repo = InvoiceItemRepo.new(@invoiceitem_data, self)
    @transaction_repo = TransactionRepo.new(@transaction_data, self)
  end

end

se = SalesEngine.new
puts se.start

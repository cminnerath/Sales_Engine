require 'csv'
require_relative 'customer_repo'
require_relative 'customer_loader'
require_relative 'merchant_repo'
require_relative 'merchant_loader'
require_relative 'item_repo'
require_relative "item_loader"
require_relative 'transaction_repo'
require_relative "transaction_loader"
require_relative "invoice_repo"
require_relative "invoice_loader"

class SalesEngine

  attr_reader   :customer_data,    :customer_repo,
                :merchant_data,    :merchant_repo,
                :invoice_data,     :invoice_repo,
                :item_data,        :item_repo,
                :invoice_item_data,:invoice_item_repo,
                :transaction_data, :transaction_repo

  def initialize(directory = "./data")
    @customer_data        = CustomerLoader.new.load_all("#{directory}/customers.csv")
    @merchant_data        = MerchantLoader.new.load_all("#{directory}/merchants.csv")
    @invoice_data         = InvoiceLoader.new.load_all("#{directory}/invoices.csv")
    @item_data            = ItemLoader.new.load_all("#{directory}/items.csv")
    @transaction_data     = TransactionLoader.new.load_all("#{directory}/transactions.csv")
    # @invoice_item_data    = InvoiceItemLoader.new.load_all
  end

  def start
    @customer_repo      ||= CustomerRepo.new(@customer_data, self)
    @merchant_repo      ||= MerchantRepo.new(@merchant_data, self)
    @invoice_repo       ||= InvoiceRepo.new(@invoice_data, self)
    @transaction_repo   ||= TransactionRepo.new(@transaction_data, self)
    @item_repo          ||= ItemRepo.new(@item_data, self)
    # @invoice_item_repo = InvoiceItemRepo.new(@invoice_item_data, self)
  end

  def find_customer_by_id(id)
    customer_repo.find_by_id(id)
  end

  def find_items_for_merchant(merchant_id)
    item_repo.find_all_by_merchant_id(merchant_id)
  end

  def find_invoices_for_merchant(merchant_id)
    invoice_repo.find_all_by_merchant_id(merchant_id)
  end

  def find_transactions_for_invoice(invoice_id)
    transaction_repo.find_all_by_invoice_id(invoice_id)
  end

  def find_merchant_for_invoice(merchant_id)
    merchant_repo.find_by_id(merchant_id)
  end

  def find_merchant_by_item(merchant_id)
    merchant_repo.find_by_id(merchant_id)
  end

  def find_invoice_by_transaction(invoice_id)
    invoice_repo.find_by_id(invoice_id)
  end

  def find_invoices_by_customer(id)
    invoice_repo.find_all_by_customer_id(id)
  end

end

if __FILE__ == $0
  engine = SalesEngine.new
  engine.start
  require "pry";binding.pry
end

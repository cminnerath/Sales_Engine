require_relative 'transaction'
require_relative './transaction_loader'

class TransactionRepo

  attr_reader :transactions, :sales_engine

  def initialize(rows, sales_engine)
    @transactions ||= load_transactions(rows)
    @sales_engine = sales_engine
  end

  def load_transactions(rows)
    @transactions = Hash.new(0)
    rows.map {|row| @transactions[row[:id]] = Transaction.new(row, self) }
    @transactions
  end

  def find_all
    transactions
  end

  def find_random
    transactions.keys.sample
  end

  def find_by_id(id)
    transactions.detect { |key, value| value.id == id }.last
  end

  def find_by_invoice_id(invoice_id)
    transactions.detect { |key, value| value.invoice_id == invoice_id.to_i }.last
  end

  def find_by_credit_card_number(credit_card_number)
    transactions.detect do |key, value|
      # require "pry"; binding.pry
      value.credit_card_number == credit_card_number
    end.last
  end

  def check_cc_exp_date_for_nil(credit_card_expiration_date)
    if credit_card_expiration_date.length == 4
      find_by_credit_card_exp_date(credit_card_expiration_date)
    end
  end

  def find_by_credit_card_exp_date(credit_card_expiration_date)
    transactions.detect do |key, value|
      value.credit_card_expiration_date == credit_card_expiration_date
    end.last
  end

  def find_by_result(result)
    transactions.detect { |key, value| value.result == result }.last
  end

  def find_by_creation_date(date)
    transactions.detect { |key, value| value.created_at == date }.last
  end

  def find_by_updated_date(date)
    transactions.detect { |key, value| value.updated_at == date }.last
  end

  def find_all_by_invoice_id(invoice_id)
    matches = transactions.select do|key,value|
      value.invoice_id  == invoice_id.to_s
    end.to_a
    matches.map {|key, value| value}
  end

  def find_all_by_credit_card(number)
    matches = transactions.select{|key,value| value.credit_card_number == number }.to_a
    matches.map {|key, value| value}
  end

  def find_all_by_credit_card_exp(date)
    matches = transactions.select{|key,value| value.credit_card_expiration_date  == date  }.to_a
    matches.map {|key, value| value}
  end

  def find_all_by_result(status)
    matches = transactions.select{|key,value| value.result  == status  }.to_a
    matches.map {|key, value| value}
  end

  def find_all_by_creation_date(date)
    matches = transactions.select{|key,value| value.created_at   == date  }.to_a
    matches.map {|key, value| value}
  end

  def find_all_by_updated_date(date)
    matches = transactions.select{|key,value| value.updated_at== date  }.to_a
    matches.map {|key, value| value}
  end

  def find_invoice_by_transaction(invoice_id)
    sales_engine.find_invoice_by_transaction(invoice_id)
  end

  def inspect
    "#<#{self.class} #{@all.size} rows>"
  end

end

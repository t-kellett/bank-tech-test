require 'transactions'

class CurrentAccount
  attr_reader :balance, :transactions

  def initialize(transactions_class = Transactions)
    @balance = 0
    @transactions = transactions_class.new
  end

  def deposit(num)
    @balance += num
    @transactions.add_transaction(credit: num, balance: @balance)
  end

  def withdraw(num)
    @balance -= num
    @transactions.add_transaction(debit: num, balance: @balance)
  end
end
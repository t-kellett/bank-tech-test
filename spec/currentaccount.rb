class CurrentAccount
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(num)
    @balance += num
  end

  def withdraw(num)
    @balance -= num
  end

  def print_statement
    puts "date || credit || debit || balance"
  end
end
class CurrentAccount
  attr_reader :balance

  def initialize
    @balance = 0.00
  end

  def deposit(num)
    @balance += num.to_f.round(2)
  end

  def withdraw(num)
    @balance -= num.to_f.round(2)
  end
end
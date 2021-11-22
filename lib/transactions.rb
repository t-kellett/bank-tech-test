class Transactions
  attr_reader :history

  def initialize
    @history = []
  end

  def add_transaction(credit: "", debit: "", balance: 0)
    @history.push({:credit => credit, :debit => debit, :balance => balance})
  end
end
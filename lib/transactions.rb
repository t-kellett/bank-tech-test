require 'date'

class Transactions
  attr_reader :history, :statement

  def initialize(statement_class = Statement)
    @history = []
    @statement = statement_class.new
  end

  def add_transaction(date: Date.today.strftime('%d/%m/%Y'), credit: '', debit: '', balance: '')
    credit = ('%.2f' % credit).to_s unless credit == ''
    debit = ('%.2f' % debit).to_s unless debit == ''
    balance = ('%.2f' % balance).to_s unless balance == ''
    @history.unshift({ date: date, credit: credit, debit: debit, balance: balance })
  end

  def create_statement
    @statement.format_statement(@history)
  end
end

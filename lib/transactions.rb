require 'date'

class Transactions
  attr_reader :history, :statement

  def initialize(statement_class = Statement)
    @history = []
    @statement = statement_class.new
  end

  def add_transaction(date: Date.today.strftime('%d/%m/%Y'), credit: '', debit: '', balance: '')
    credit = ('%.2f' % credit).to_s unless credit == '' #prevents trailing zeroes from being lost
    debit = ('%.2f' % debit).to_s unless debit == '' #prevents trailing zeroes from being lost
    balance = ('%.2f' % balance).to_s unless balance == '' #prevents trailing zeroes from being lost
    @history.unshift({ date: date, credit: credit, debit: debit, balance: balance })
    @statement.format_statement(@history.first)
  end

end

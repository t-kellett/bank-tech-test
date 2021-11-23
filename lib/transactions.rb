require 'date'

class Transactions
  attr_reader :history

  def initialize
    @history = []
  end

  def add_transaction(date: Date.today.strftime('%d/%m/%Y'), credit: '', debit: '', balance: '')
    credit = ('%.2f' % credit).to_s unless credit == ''
    debit = ('%.2f' % debit).to_s unless debit == ''
    balance = ('%.2f' % balance).to_s unless balance == ''
    @history.unshift({ date: date, credit: credit, debit: debit, balance: balance })
  end

  def print_statement
    puts 'date || credit || debit || balance'
    @history.each do |item|
      puts "#{item[:date]} || #{item[:credit]} || #{item[:debit]} || #{item[:balance]}".gsub!('  ', ' ')
    end
  end
end

require 'date'

class Transactions
  attr_reader :history

  def initialize
    @history = []
  end

  def add_transaction(date: Date.today.strftime("%d/%m/%Y"), credit: "", debit: "", balance: "")
    credit = "#{'%.2f' % credit}" unless credit == ""
    debit = "#{'%.2f' % debit}" unless debit == ""
    balance = "#{'%.2f' % balance}" unless balance == ""
    @history.unshift({:date => date, :credit => credit, :debit => debit, :balance => balance})
  end

  def print_statement
    puts "date || credit || debit || balance"
    @history.each do |item|
      puts "#{item[:date]} || #{item[:credit]} || #{item[:debit]} || #{item[:balance]}".gsub!("  ", " ")
    end
  end
end
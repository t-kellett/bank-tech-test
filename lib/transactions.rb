require 'date'

class Transactions
  attr_reader :history

  def initialize
    @history = []
  end

  def add_transaction(date: Date.today.strftime("%d/%m/%Y"), credit: "", debit: "", balance: "")
    "#{'%.2f' % credit}" unless credit.to_i == 0
    "#{'%.2f' % debit}" unless debit.to_i == 0
    "#{'%.2f' % balance}" unless balance.to_i == 0
    @history.push({:date => date, :credit => credit, :debit => debit, :balance => balance})
  end

  def print_statement
    puts "date || credit || debit || balance"
    @history.each do |item|
      puts "#{item[:date]} || #{item[:credit]} || #{item[:debit]} || #{item[:balance]}".gsub!("  ", " ")
    end
  end
end
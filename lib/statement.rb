class Statement
  attr_reader :transactions
  
  def initialize
    @transactions = "date || credit || debit || balance"
  end

  def format_statement(transactions)
    transactions.each do |item|
      @transactions << "\n#{item[:date]} || #{item[:credit]} || #{item[:debit]} || #{item[:balance]}".gsub!("  ", " ")
    end
  end
end
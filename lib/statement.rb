class Statement
  attr_reader :statement_items

  def initialize
    @statement_items = "date || credit || debit || balance"
  end

  def format_statement(transactions)
    transactions.each do |item|
      @statement_items << "\n#{item[:date]} || #{item[:credit]} || #{item[:debit]} || #{item[:balance]}".gsub!("  ", " ")
    end
  end

  def print_statement
    print @statement_items
  end

end
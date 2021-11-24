class Statement
  attr_reader :statement_items

  def initialize
    @statement_items = "date || credit || debit || balance"
  end

  def format_statement(transaction)
    @statement_items << "\n#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}"
    @statement_items.gsub!("  ", " ")
  end

  def print_statement
    print @statement_items
  end

end
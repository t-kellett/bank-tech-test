require 'statement'

describe Statement do
  let(:transaction) { {:date=>"23/11/2021", :credit=>"", :debit=>"300.00", :balance=>"700.00"} }
  
  let(:statement_string) { "date || credit || debit || balance\n23/11/2021 || || 300.00 || 700.00" }
  
  let(:statement) { described_class.new }

  before do
    statement.format_statement(transaction)
  end

  context "format_statement" do
    it "adds a transaction and to the statement string" do
      expect(statement.statement_items).to eq(statement_string)
    end
  end

  context "#print_statement" do
    it "prints the statement to the console" do
      expect { statement.print_statement }.to output(statement_string).to_stdout
    end
  end
end
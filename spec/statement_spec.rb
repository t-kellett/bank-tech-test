require 'statement'

describe Statement do
  let(:transactions_array) { [{:date=>"23/11/2021", :credit=>"", :debit=>"300.00", :balance=>"700.00"},
                        {:date=>"22/11/2021", :credit=>"500.00", :debit=>"", :balance=>"1000.00"},
                        {:date=>"21/11/2021", :credit=>"500.00", :debit=>"", :balance=>"500.00"}] }
  
  let(:transactions_string) {
    "date || credit || debit || balance\n23/11/2021 || || 300.00 || 700.00\n22/11/2021 || 500.00 || || 1000.00\n21/11/2021 || 500.00 || || 500.00"
  }
  
  let(:statement) { described_class.new }

  context "format_statement" do
    it "takes array of transactions and formats them into a statement string" do
      statement.format_statement(transactions_array)
      expect(statement.transactions).to eq(transactions_string)
    end
  end
end
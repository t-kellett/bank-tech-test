require 'transactions'
require 'date'

describe Transactions do
  let(:account) { described_class.new }

  before do
    account.add_transaction(date: '22/11/2021', credit: "500.00", balance: "500.00")
    account.add_transaction(date: '23/11/2021', debit: "300.00", balance: "200.00")
  end

  context "#add_transaction" do
    it "adds a credit transaction to the transactions history array" do
      expect(account.history.first).to eq({:date => '22/11/2021', :credit => "500.00", :debit => "", :balance => "500.00" })
    end

    it "adds a debit transaction to the transactions history array" do
      expect(account.history.last).to eq({:date => '23/11/2021', :credit => "", :debit => "300.00", :balance => "200.00"})
    end

    it "adds today's date aand empty strings as default values if a date is not passed in" do
      d = Date.today.strftime("%d/%m/%Y")
      subject.add_transaction()
      expect(subject.history.first).to eq({:date => d, :credit => "", :debit => "", :balance => ""})
    end
  end

  context "#print_statement" do
    it "prints the account statement to the console successfully" do
      output = account.print_statement
      expect(output).to eq(account.history)
    end
  end
end
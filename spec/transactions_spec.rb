require 'transactions'

describe Transactions do
  context "#add_transaction" do
    it "adds a credit transaction to the transactions history array" do
      subject.add_transaction(credit: 500.00, balance: 500.00)
      expect(subject.history.last).to eq({:credit => 500.00, :debit => "", :balance => 500.00 })
    end

    it "adds a debit transaction to the transactions history array" do
      subject.add_transaction(debit: 300.00, balance: 200.00)
      expect(subject.history.last).to eq({:credit => "", :debit => 300.00, :balance => 200.00})
    end
  end
end
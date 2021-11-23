require 'currentaccount'

describe CurrentAccount do
  let(:transactions_class) { class_double("TransactionClass", :new => transaction) } #mocking dependency on transaction class
  let(:transaction) { double("transaction", :add_transaction => "")} #mocking transaction methods
  let(:current) { described_class.new(transactions_class) }

  context '#deposit' do
    it 'has a balance of 0 when initialised' do
      expect(current.balance).to eq 0
    end

    it 'increments balances by 500 when 500 is deposited' do
      expect { current.deposit(500) }.to change { current.balance }.by(500.00)
    end

    it 'adds the transaction to the transactions' do
      expect(current.transactions).to receive(:add_transaction).with(credit: 500, balance: 500)
      current.deposit(500)
    end
  end

  context '#withdraw' do
    it 'decrements balance by 300 when 300 is withdrawn' do
      expect { current.withdraw(300) }.to change { current.balance }.by(-300.00)
    end

    it 'adds the transaction to the transactions' do
      expect(current.transactions).to receive(:add_transaction).with(debit: 300, balance: -300)
      current.withdraw(300)
    end
  end
end

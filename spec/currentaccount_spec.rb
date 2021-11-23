require 'currentaccount'

describe CurrentAccount do
  context '#deposit' do
    it 'has a balance of 0 when initialised' do
      expect(subject.balance).to eq 0
    end

    it 'increments balances by 500 when 500 is deposited' do
      expect { subject.deposit(500) }.to change { subject.balance }.by(500.00)
    end

    it 'adds the transaction to the transactions' do
      expect(subject.transactions).to receive(:add_transaction).with(credit: 500, balance: 500)
      subject.deposit(500)
    end
  end

  context '#withdraw' do
    it 'decrements balance by 300 when 300 is withdrawn' do
      expect { subject.withdraw(300) }.to change { subject.balance }.by(-300.00)
    end

    it 'adds the transaction to the transactions' do
      expect(subject.transactions).to receive(:add_transaction).with(debit: 300, balance: -300)
      subject.withdraw(300)
    end
  end
end

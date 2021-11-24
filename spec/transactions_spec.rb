require 'transactions'
require 'date'

describe Transactions do
  let(:statement) { double("statement", :format_statement => "")}
  let(:statement_class) { class_double("StatementClass", :new => statement) }
  let(:account) { described_class.new(statement_class) }

  before do
    account.add_transaction(date: '22/11/2021', credit: '500.00', balance: '500.00')
    account.add_transaction(date: '23/11/2021', debit: '300.00', balance: '200.00')
  end

  context '#add_transaction' do
    it 'adds a credit transaction to the transactions history array' do
      expect(account.history.last).to eq({ date: '22/11/2021', credit: '500.00', debit: '', balance: '500.00' })
    end

    it 'adds a debit transaction to the transactions history array' do
      expect(account.history.first).to eq({ date: '23/11/2021', credit: '', debit: '300.00', balance: '200.00' })
    end

    it "adds today's date and empty strings as default values if a date is not passed in" do
      d = Date.today.strftime('%d/%m/%Y')
      account.add_transaction
      expect(account.history.first).to eq({ date: d, credit: '', debit: '', balance: '' })
    end

    it 'formats the credit, debit and balance numbers as a float to 2 decimal places' do
      expect(account.history.last).to eq({ date: '22/11/2021', credit: '500.00', debit: '', balance: '500.00' })
    end

    it "adds the transaction as a formatted statement item by calling format statement" do
      new_transaction = {date: '24/11/2021', credit: '', debit: '300.00', balance: '400.00'}
      expect(account.statement).to receive(:format_statement).with(new_transaction)
      account.add_transaction(date: '24/11/2021', debit: '300.00', balance: '400.00')
    end
  end
end
require 'currentaccount'

describe CurrentAccount do
  context "#deposit" do
    it "has a balance of 0 when initialised" do
      expect(subject.balance).to eq 0
    end

    it "increments balances by 500 when 500 is deposited" do
      expect { subject.deposit(500) }.to change { subject.balance }.by(500)
    end
  end

  context "#withdraw" do
    it "decrements balance by 300 when 300 is withdrawn" do
      expect { subject.withdraw(300) }.to change { subject.balance }.by(-300)
    end
  end

  context "#print_statement" do
    it "logs to the consoles the statement headers when print_statement is called" do
      expect { subject.print_statement }.to output(/date || credit || debit || balance/).to_stdout
    end
  end
end
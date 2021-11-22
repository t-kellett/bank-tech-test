require 'currentaccount'

describe CurrentAccount do
  context "#deposit" do
    it "has a balance of 0 when initialised" do
      expect(subject.balance).to eq 0
    end

    it "increments balances by 500 when 500 is deposited" do
      expect { subject.deposit(500) }.to change { subject.balance }.by(500.00)
    end
  end

  context "#withdraw" do
    it "decrements balance by 300 when 300 is withdrawn" do
      expect { subject.withdraw(300) }.to change { subject.balance }.by(-300.00)
    end
  end
end
require 'currentaccount'

describe CurrentAccount do
  context "#deposit" do
    it "has a balance of 0 when initialised" do
      expect(subject.balance).to eq 0
    end

    it "increases balances by 500 when 500 is deposited" do
      expect { subject.deposit(500) }.to change { subject.balance }.by(500)
    end
  end
end
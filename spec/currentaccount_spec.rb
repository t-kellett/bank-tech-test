require 'currentaccount'

describe CurrentAccount do
  context "#deposit" do
    it "has a balance of 0 when initialised" do
      expect(subject.balance).to eq 0
    end
  end
end
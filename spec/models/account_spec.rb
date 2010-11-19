require 'spec_helper'

describe Account do
  context "creating" do
    it "should allow me to create an account with valid params." do
      account = Factory.build(:account)
      account.should be_valid
    end

    it "should not allow me to create an account with an existing name." do
      Factory(:account, :name => "duplicated name")
      account = Factory.build(:account, :name => "duplicated name")
      account.should_not be_valid
    end
  end
end

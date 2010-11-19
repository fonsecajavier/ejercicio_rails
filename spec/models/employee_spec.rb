require 'spec_helper'

describe Employee do
  context "creating" do
    it "should allow me to create an employee with valid params." do
      employee = Factory.build(:account)
      employee.should be_valid
    end
  end
end

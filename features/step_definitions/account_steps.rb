Given /^I have created some accounts whose information \(ascendant ordered by name\) are as follows:$/ do |accounts_table|
  accounts_table.hashes.each { |accounts_hash|
    Given "I have created an account \"#{accounts_hash['Name of the account']}\" with bank name \"#{accounts_hash['Name of the bank']}\""
  }
end

Given /^I have created an account "([^"]*)" with bank name "([^"]*)"$/ do |account_name, bank_name|
  @account = Factory(:account , :name => account_name, :bank_name => bank_name)
end

Given /^I follow the edit link for the account number #(\d+)$/ do |item_n|
  #save_and_open_page
  within "table#accounts_table tr:nth-child(" << (item_n.to_i + 1).to_s << ")" do |scope| #_" + name do |scope|
    scope.click_link("Edit")
  end
end

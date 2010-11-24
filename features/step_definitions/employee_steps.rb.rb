Given /^I have added to such account the employees whose information are as follows:$/ do |employees_table|
  employees_table.hashes.each { |employees_hash|
    Given "I have added to such account an employee whose first name is \"#{employees_hash['First name']}\", his last name is \"#{employees_hash['Last name']}\" and his salary is #{employees_hash['Salary']}"
  }
end

Given /^I have added to such account an employee whose first name is "([^"]*)", his last name is "([^"]*)" and his salary is (\d+)$/ do |first_name, last_name, salary|
  @employee=Factory(:employee , :account => @account, :first_name => first_name, :last_name => last_name, :salary => salary)
end
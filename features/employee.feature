Feature: Employees
In order to keep track of employees
people should be able to
create, list, edit, delete employee
Note: Delete not supported for testing due to Webrat's lack of javascript support

Scenario: Add employee
Given I have created an account "My account" with bank name "My bank"
And I am on that account's page
When I follow "Add new employee"
And I fill in the following:
  | First name  | Homer     |
  | Last name   | Simpson   |
  | Salary      | 1500000   |
And I press "Create"
Then I should see "Homer"
And I should see "Simpson"

Scenario: Show employees
Given I have created an account "My account" with bank name "My bank"
And I have added to such account the employees whose information are as follows:
  | First name  | Last name     | Salary    |
  | Homer       | Simpson       | 1500000   |
  | Pedro       | Picapiedra    | 2000000   |
When I go to that account's page
Then I should see "Homer"
And I should see "Picapiedra"

Scenario: Edit employee (initial values verification)
Given I have created an account "My account" with bank name "My bank"
And I have added to such account an employee whose first name is "Homer", his last name is "Simpson" and his salary is 1500000
When I am on the accounts page
And I follow "List"
And I follow "Edit"
Then the "First name" field should contain "Homer"
And the "Last name" field should contain "Simpson"
And the "Salary" field should contain "1500000"

Scenario: Edit employee (successfully edited)
Given I have created an account "My account" with bank name "My bank"
And I have added to such account an employee whose first name is "Homer", his last name is "Simpson" and his salary is 1500000
When I go to that employee's edit page
And I fill in the following:
  | First name  | Peter     |
  | Last name   | Griffin   |
  | Salary      | 1000000   |
And I press "Update"
Then I should see "Peter"
And I should see "Griffin"

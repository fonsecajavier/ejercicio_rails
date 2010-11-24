Feature: Accounts
In order to keep track of accounts
people should be able to
create, list, edit, delete accounts
Note: Delete not supported for testing due to lack of Webrat's javascript support

Scenario: List accounts
Given I have created an account "Account 1" with bank name "Bank 1"
When I go to the accounts page
Then I should see "Account 1"

Scenario: Create account
Given I am on the accounts page
When I follow "Add new account"
And I fill in the following:
  | Name of the account | A new account |
  | Name of the bank    | A new bank    |
# When I fill in "Name of the account" with "A new account"
# And I fill in "Name of the bank" with "A new bank"
And I press "Create"
Then I should see "A new account"
And I should see "A new bank"

Scenario: Edit account (initial values verification)
Given I have created an account "Account 1" with bank name "Bank 1"
When I am on the accounts page
And I follow "Edit"
Then the "Name of the account" field should contain "Account 1"
And the "Name of the bank" field should contain "Bank 1"

Scenario: Edit account (successfully edited)
Given I have created an account "Account 1" with bank name "Bank 1"
And I am on that account's edit page
When I fill in the following:
  | Name of the account | Edited account |
  | Name of the bank    | Edited bank    |
And I press "Update"
Then I should see "Edited account"
And I should see "Edited bank"

Scenario: Edit account (within test, just for learning)
Given I have created some accounts whose information (ascendant ordered by name) are as follows:
  | Name of the account | Name of the bank  |
  | Business            | Lord's Bank       |
  | Child               | Lord's Bank       |
  | Extra               | Tech Bank         |
  | Personal            | Megabank          |
  | Professional        | Geobank           |
And I am on the accounts page
When I follow the edit link for the account number #3
Then the "Name of the bank" field should contain "Tech Bank"

Feature: Add Files
  In order manage my data
  As a researcher
  I want to upload files for a particular session and particular study
 
 Background:
    Given I have logged in
    Given I have created a project with "My Biomechanics Project", "Fred Bloggs", "Masters of Biomechanics", "2011-04-01 00:00:00", "2011-04-01 00:00:00", "Studying some stuff", "Alice Smith"
    Given I have created a study with "My Biomechanics Study", "1073A", "No", "Test Description", "Partner1", "Collaborator1", "2011-04-01 00:00:00", "2011-04-01 00:00:00", "10", "Test Criteria"
   
    Given I am on the home page
    And I follow "My Biomechanics Study"
    Then I follow "Components"
    Then I should see "Add Component"
    Then I follow "Add Component"
    Then I should see "Add New Component"
    And I fill in "name" with "TestComponent"
    And I fill in "description" with "Some Description"
    And I press "save"
    Then I should see "saved"
    Then I should see "TestComponent"

    Given I am on the home page
    And I follow "My Biomechanics Study"
    Then I follow "Components"
    Then I should see "Add Session"
    Then I follow "Add Session"
    Then I should see "Add New Session"
    Then I fill in "name" with "TestSession"
    Then I fill in "description" with "Some Description"
    And I press "save"
    Then I should see "TestSession"  

	Scenario: Add Files
	Given I am on the home page
	And I follow "My Biomechanics Study"
	Then I follow "Files"
	Then I should see "TestComponent"
	Then I should see "TestSession"
	Then I press "upload[0-0]"
	Then I should see "Browse For Files"
	Then I press "OK"
	Then I should see "TestComponent"
	Then I should see "TestSession"
	Then I press "upload[0-0]"
	Then I should see "Browse For Files"
	Then I press "Cancel"
	Then I should see "TestComponent"
	Then I should see "TestSession"
	
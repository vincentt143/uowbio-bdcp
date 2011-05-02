Feature: Edit Study
  In order manage my data
  As a researcher
  I want to edit a study
 
 Background:
    Given I have logged in
 	Given I have created a project with "My Biomechanics Project", "Fred Bloggs", "Masters of Biomechanics", "2011-04-01 00:00:00", "2011-04-01 00:00:00", "Studying some stuff", "Alice Smith"
    Given I have created a study with "My Biomechanics Study", "1073A", "No", "Test Description", "Partner1", "Collaborator1", "2011-04-01 00:00:00", "2011-04-01 00:00:00", "10", "Test Criteria"
   
  Scenario: Edit Study
  Given I am on the home page
  And I follow "My Biomechanics Study"
  And I should see table "studyTable" with contents
      | Study Title                    | My Biomechanics Study   |
      | UOW Ethics Number              | 1073A                   |
      | Additional Ethics Requirements | No                      |
      | Description                    | Test Description        |
      | Industry Partners              | Partner1                |
      | Collaborators                  | Collaborator1           |
      | Start Date                     | 03/2011                 |
      | End Date                       | 03/2011                 |
      | Number of Participants         | 10                      |
      | Inclusion Exclusion Criteria   | Test Criteria           |
   
   Given I am on the home page
   And I follow "My Biomechanics Study"
   Then I press "edit"
   Then I should see "Edit Study"
   When I press "cancel"
   Then I should see "My Biomechanics Study"
   And I should see table "studyTable" with contents
      | Study Title                    | My Biomechanics Study   |
      | UOW Ethics Number              | 1073A                   |
      | Additional Ethics Requirements | No                      |
      | Description                    | Test Description        |
      | Industry Partners              | Partner1                |
      | Collaborators                  | Collaborator1           |
      | Start Date                     | 03/2011                 |
      | End Date                       | 03/2011                 |
      | Number of Participants         | 10                      |
      | Inclusion Exclusion Criteria   | Test Criteria           |  
    
    Then I press "edit"
    Then I should see "Edit Study"
    When I fill in "studyTitle" with " 1"
    Then I press "save"
    Then I should see "My Biomechanics Study 1"
    And I should see table "studyTable" with contents
      | Study Title                    | My Biomechanics Study 1 |
      | UOW Ethics Number              | 1073A                   |
      | Additional Ethics Requirements | No                      |
      | Description                    | Test Description        |
      | Industry Partners              | Partner1                |
      | Collaborators                  | Collaborator1           |
      | Start Date                     | 03/2011                 |
      | End Date                       | 03/2011                 |
      | Number of Participants         | 10                      |
      | Inclusion Exclusion Criteria   | Test Criteria           |
      
    Then I press "edit"
    Then I should see "Edit Study"
    And I select "Yes" from "hasAdditionalEthicsRequirements"
    And I fill in "additionalEthicsRequirements" with "Some Additional Requirements"
    Then I press "save"
    Then I should see "My Biomechanics Study 1"
    And I should see table "studyTable" with contents
      | Study Title                    | My Biomechanics Study 1       |
      | UOW Ethics Number              | 1073A                         |
      | Additional Ethics Requirements | Yes                           |
      | Additional Ethics Details      | Some Additional Requirements  |
      | Description                    | Test Description              |
      | Industry Partners              | Partner1                      |
      | Collaborators                  | Collaborator1                 |
      | Start Date                     | 03/2011                       |
      | End Date                       | 03/2011                       |
      | Number of Participants         | 10                            |
      | Inclusion Exclusion Criteria   | Test Criteria                 |
     
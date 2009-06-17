Feature: Documents
  In order to store actual information in the system
  As a developer
  I want to CRUD Documents

  Background:
    Given these databases
      | name |
      | foo  |
    And these documents
      | database | name | revision | data               |
      | foo      | bar  | 12345    | { "Key": "Value" } |

  Scenario: Showing a Document
    When I get /foo/bar
    Then I should see status 200 OK
    And  I should see json '{"_id": "bar", "_rev":"12345", "Key": "Value"}'

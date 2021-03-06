Feature: Views
  In order to query the database
  As a developer
  I want to use views

  Background:
    Given these databases
      | name     |
      | petstore |
    And these documents
      | database | name         | data                                                                                                                     |
      | petstore | ab12cd34     | { 'document_type' => 'dog', 'name' => 'rover' }                                                                          |
      | petstore | ef56ab34     | { 'document_type' => 'cat', 'name' => 'fluffy' }                                                                         |
      | petstore | _design/dogs | { 'views' => { 'all_name' => { 'map' => 'function(doc) { if (doc.document_type == "dog") { emit(doc.name, doc); } }' }}} |

  Scenario: Showing a View
    When I get /petstore/_design/dogs/_view/all_name
    Then I should see json '{"total_rows":1, "offset":0, "rows":[{"id":"ab12cd34", "key":"rover", "value":{"document_type":"dog", "name":"rover"}}]}'

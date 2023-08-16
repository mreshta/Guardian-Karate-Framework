@Regression
Feature: Generate Token for tests
# This is the step where we can create token and we can use this step in other classes 
# by using callonce read("classname")
  Scenario: 
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username" : "supervisor", "password" : "tek_supervisor"}
    When method post
    Then status 200
    And print response

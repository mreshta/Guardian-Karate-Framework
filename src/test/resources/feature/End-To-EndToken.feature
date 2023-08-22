@Regression
Feature: End to End test for account creation

  # step 1
  Scenario: Create Valid Token
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor", "password": "tek_supervisor"}
    When method post
    Then status 200
		And print response
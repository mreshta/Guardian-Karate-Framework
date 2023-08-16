@Smoke
Feature: Security Token Tests

  Background: 
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"

  #Scenario # 1: Manual & Automation
  #Endpoint = /api/token
  #Login with valid user and password and validate response. Status code should be 200.
  #And you have to see token in response body.
  Scenario: Generate valid token with valid username and password
    And request {"username":"supervisor","password":"tek_supervisor"}
    When method post
    Then status 200
    And print response

  #2
  #Scenario # 2: Manual & Automation
  #Endpoint = /api/token
  #Login with wrong username valid password. Validate response
  #Status code 400
  #ErrorMessage = User not found.
  Scenario: Validate token with invalid username
    And request
      """
      {"username":"wrong username",
      "password":"tek_supervisor"}
      """
    When method post
    Then status 400
    And print response
    And assert response.errorMessage == "User not found"

  #Scenario # 3: Manual & Automation
  #Endpoint = /api/token
  #Login with valid user and invalid password
  #Validate response
  #Status code 400
  #Error message = Password Not Matched
  #3 AND #2 both in one Scenario that is why it is Scenario Outline
  Scenario Outline: Validate Login with valid username and invalid password
    And request
      """
      {
        "username": "<username>",
        "password": "<password>"
      }
      """
    When method post
    Then status 400
    And print response
    And assert response.errorMessage == "<errorMessage>"

    Examples: 
      | username   | password       | errorMessage         |
      | wrong      | tek_supervisor | User not found       |
      | supervisor | wrong          | Password Not Matched |
  

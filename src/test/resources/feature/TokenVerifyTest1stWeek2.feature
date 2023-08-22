@Smoke
Feature: Token Verify Tests

  #have to work on it again
  Background: setup test
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username" : "supervisor", "password" : "tek_supervisor"}
    When method post
    Then status 200

  #4
  #Scenario # 4: Manual & Automation
  #Endpoint = /api/token/verify
  #Verify valid token and validate response
  #Status code 200
  #Response it true
  #Steps:
  #1) send request to /api/token to generate new token.
  #2) get token from response
  #3) send new request to /api/token/verify
  Scenario: Verify a valid token
    And print response
    And path "/api/token/verify"
    And param username = "supervisor"
    And param token = response.token
    When method get
    Then status 200
    And print response
    And assert response == "true"

  #5
  #Scenario # 5: Manual & Automation
  #Endpoint: /api/token/verify
  #Validate a valid token and invalid username.
  #Validate response should 400
  #Message == Wrong Username send along with Token
  Scenario: verify with valid token and invalid username
    And print response
    And path "/api/token/verify"
    And param username = "wronguserName"
    And param token = response.token
    When method get
    Then status 400
    And print response
    And assert response.errorMessage == "Wrong Username send along with Token"

  #6
  #Scenario # 6: Manual & Automation
  #Endpoint: /api/token/verify
  #send Invalid token and valid username
  #Validate response status code 400
  #Message = Token Expired or Invalid Token
  Scenario: verify with invalid token and valid username
    And print response
    And path "/api/token/verify"
    And param username = "supervisor"
    And param token = "wrongToken"
    When method get
    Then status 400
    And print response
    And assert response.errorMessage == "Token Expired or Invalid Token"

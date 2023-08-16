@Regression
Feature: Verify Account

  Background: setup test
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def result = callonce read('GenerateToken2WeekMonday2.feature')
    * def validToken = result.response.token

  #7
  #Scenario # 7: Manual & Automation
  #End point: /api/accounts/get-account
  #Send a valid / existing primary person id and validate response.
  #Response status code 200
  #Response should contain id = same existing id
  Scenario: Verify an account that exists
    And path "/api/accounts/get-account"
    * def existingId = 9620
    And param primaryPersonId = existingId
    And header Authorization = "Bearer " + validToken
    When method get
    Then status 200
    And print response
    And assert response.primaryPerson.id == existingId

  # here I have used the * def key word which is like assigngin a value to it then using it
  # with def step we create variable and assign value for reusebility
  #8
  #Scenario # 8: Manual & Automation
  #End point : /api/accounts/get-account
  #Send an primary person id that is not exist.
  #Validate response status code 404
  #Validate error message = Account with id "" not found
  Scenario: Verify a person that does not exist
    And path "/api/accounts/get-account"
    And header Authorization = "Bearer " + validToken
    * def notExistingId = 20020202
    And param primaryPersonId = notExistingId
    When method get
    Then status 404
    And print response
    And assert response.errorMessage == "Account with id "+ notExistingId +" not found"

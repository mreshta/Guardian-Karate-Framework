@Smoke
Feature: Delete Account functionality

  #Scenario # 11: Manual & Automation
  #Endpoint: /api/accounts/delete-account
  #With this api request delete the created with previous Scenario.
  #Response status code 200.
  #Response Body Account Successfully deleted
  #Account should exist to so we can delete it. 200 status code
  #Make sure Account that does not exist to get 404 Status code
  Background: Created New Account, Token connection and Setup
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def tokenWay = callonce read('GenerateToken2WeekMonday2.feature')
    * def validToken = tokenWay.response.token
    * def CreateAccount = callonce read('CreateAccount2WeekMonday4.feature')
    #second way
    #* def validToken = CreateAccount.validToken
    * def CreatedAccountID = CreateAccount.response.id

  # 11
  Scenario: Delete Account Here
    Given path "/api/accounts/delete-account"
    And param primaryPersonId = CreatedAccountID
    And header Authorization = "Bearer " + validToken
    When method delete
    Then status 200
    And print response
    And assert response == "Account Successfully deleted"
    
    #Scenario # 13: Manual & Automation
    #Endpoint = /api/accounts/delete-account
    #Delete and primary person that is not exist.
    #Response status code 404
    #response errorMessage should = "Account with ID  <primaryPersonId> not exist"
    Given path "/api/accounts/delete-account"
    And param primaryPersonId = CreatedAccountID
    And header Authorization = "Bearer " + validToken
    When method delete
    Then status 404
    And print response
    And assert response.errorMessage == "Account with id " + CreatedAccountID + " not exist"

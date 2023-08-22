@Smoke
Feature: Add Car to created account

  #step 5
  Background: 
    * def pathToCreatedAccount = callonce read('End-To-EndCreateNewAccount.feature')
    * def validToken = pathToCreatedAccount.validToken
    * def pPID = pathToCreatedAccount.response.id
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Add car to the Created Account
    Given path "/api/accounts/add-account-car"
    And header Authorization = "Bearer " + validToken
    And param primaryPersonId = pPID
    And request
      """
      {
        "make": "BMW",
        "model": "SUV",
        "year": "2023",
        "licensePlate": "VM23"
      }
      """
    When method post
    Then status 201
    And print response

@Smoke
Feature: Add phone Number
#step 3
  Background: 
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def createdAccount = callonce read("End-To-EndCreateNewAccount.feature")
    * def validToken = createdAccount.validToken
    * def pPID = createdAccount.response.id

  Scenario: Add phone number steps
    Given path "/api/accounts/add-account-phone"
    And header Authorization = "Bearer " + validToken
    And param primaryPersonId = pPID
    * def pathToPhoneNumber = Java.type("api.Utility.GenerateDate")
    * def phoneNumber = pathToPhoneNumber.getPhoneNumber()
    And request
      """
      {
        "phoneNumber": "#(phoneNumber)",
        "phoneExtension": "string",
        "phoneTime": "string",
        "phoneType": "string"
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.phoneNumber == phoneNumber

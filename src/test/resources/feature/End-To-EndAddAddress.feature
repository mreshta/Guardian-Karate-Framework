@Smoke
Feature: Add address to the account
#step 4
  Background: 
    * def pathToCreatedAccount = callonce read('End-To-EndCreateNewAccount.feature')
    * def validToken = pathToCreatedAccount.validToken
    * def pPID = pathToCreatedAccount.response.id
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Add address to the created account
    Given path "/api/accounts/add-account-address"
    And header Authorization = "Bearer " + validToken
    And param primaryPersonId = pPID
    * def pathToAutoAddress = Java.type("api.Utility.GenerateDate")
    * def autoAddress = pathToAutoAddress.getAdressLine()
    And request
      """
      {
      "addressType": "Apt",
      "addressLine1": "#(autoAddress)",
      "city": "San Diego",
      "state": "CA",
      "postalCode": "220202",
      "countryCode": "20202",
      "current": true
      }
      """
    When method post
    Then status 201
    And print response
     

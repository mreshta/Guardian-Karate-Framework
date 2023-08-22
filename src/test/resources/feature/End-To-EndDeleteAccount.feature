@Smoke
Feature: Delete the created account
#final step
  Background: 
    * def pathToCreatedAccount = callonce read('End-To-EndCreateNewAccount.feature')
    * def validToken = pathToCreatedAccount.validToken
    * def pPID = pathToCreatedAccount.response.id
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Deletion of the Created Account
    Given path "/api/accounts/delete-account"
    And header Authorization = "Bearer " + validToken
    And param primaryPersonId = pPID
    And method delete
    Then status 200
    And print response
    And assert response == "Account Successfully deleted"

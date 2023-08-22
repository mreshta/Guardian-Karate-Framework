@Smoke
Feature: Create new account
 #step 2
  Background: 
    * def validTokenResult = callonce read("End-To-EndToken.feature")
    * def validToken = validTokenResult.response.token
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Creating new account
    Given path "/api/accounts/add-primary-account"
    And header Authorization = "Bearer " + validToken
    * def pathToAutoEmail = Java.type("api.Utility.GenerateDate")
    * def autoEmail = pathToAutoEmail.getEmail()
    And request
      """
      {
        "email": "#(autoEmail)",
        "firstName": "V",
        "lastName": "Venom",
        "title": "Alein",
        "gender": "MALE",
        "maritalStatus": "MARRIED",
        "employmentStatus": "Alien",
        "dateOfBirth": "2023-08-09",
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.email == autoEmail

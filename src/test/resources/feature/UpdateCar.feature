@Regression
Feature: Update the car infomation that already exist

  Background: 
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def Generatetoken = callonce read("GenerateToken2WeekMonday2.feature")
    * def validToken = Generatetoken.response.token
    * def createdAccount = callonce read("CreateAccount2WeekMonday4.feature")
    * def createdAccountID = createdAccount.response.id

  Scenario: 
    Given path "/api/accounts/add-account-car"
    And header Authorization = "Bearer " + validToken
    And param primaryPersonId = createdAccountID
    And request
      """
      {
      "id": 0,
      "make": "Tesla",
      "model": "Cyber",
      "year": "2024",
      "licensePlate": "TS24"
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.model == "Cyber"
    And assert response.licensePlate == "TS24"
     * def carId = response.id
    #updating the car
    Given path "/api/accounts/update-account-car"
    And header Authorization = "Bearer " + validToken
    And param primaryPersonId = createdAccountID
    And request
      """
       {
       "id": "#(carId)",
       "make": "Tesla",
       "model": "CyberSpaceX",
       "year": "2024",
       "licensePlate": "TS24"
       }
      """
    When method put
    Then status 202
    And print response
    And assert response.model == "CyberSpaceX"
    And assert response.licensePlate == "TS24"
    

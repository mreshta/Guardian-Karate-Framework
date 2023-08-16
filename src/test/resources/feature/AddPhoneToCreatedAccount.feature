@Regression
Feature: Adding Phone Number to the Created Account

  #Scenario # 12: Manual & Automation
  #Using Scenario 10 Create A new Account.
  #Using Endpoint: /api/account/add-account-phone
  #Add a phone record to the account you create
  #Response status code 201
  Background: 
    * def CreateAccount4Phone = callonce read("CreateAccount2WeekMonday4.feature")
    * def CreatedAccountID = CreateAccount4Phone.response.id
    * def validToken = CreateAccount4Phone.validToken
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Adding Phone Number to the Created Account
    Given path "/api/accounts/add-account-phone"
    And header Authorization = "Bearer " + validToken
    And param primaryPersonId = CreatedAccountID
    * def phoneNumberObject = Java.type("api.Utility.GenerateDate")
    * def phoneNumber = phoneNumberObject.getPhoneNumber()
    And request
      """
      {
       "phoneNumber": "#(phoneNumber)",
       "phoneExtension": "",
       "phoneTime": "Mornings",
       "phoneType": "CellPhone"
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.phoneNumber == phoneNumber

@Regression
Feature: Create Account feature

  #Scenario # 10: Manual & Automation
  #Endpoint = /api/accounts/add-primary-account
  #Create new Account using above endpoint.
  #Validate response 201.
  #Validate response body have your information
  #Validate a record added to primary_person table in database
  Background: Setup test and generate token
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def result = callonce read("GenerateToken2WeekMonday2.feature")
    * def validToken = result.response.token

  Scenario: Create Valid account
    And path "/api/accounts/add-primary-account"
    And header Authorization = "Bearer " + validToken
    # Calling Java class in feature file. this utility will create object of Java class.
    # the address should contain the package and class name
    * def generateDataObject = Java.type("api.Utility.GenerateDate")
    * def autoEmail = generateDataObject.getEmail()
    And request
      """
      {
        "email": "#(autoEmail)",
        "firstName": "Alpha",
        "lastName": "Wolf",
        "title": "Mr.",
        "gender": "MALE",
        "maritalStatus": "MARRIED",
        "employmentStatus": "CEO",
        "dateOfBirth": "2023-08-08"
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.email == autoEmail
    #* def Id = response.id
    #* def emailAddress = response.email
    #And path "/api/accounts/delete-account"
    #And header Authorization = "Bearer " + validToken
    #And param primaryPersonId = Id
    #When method delete
    #And status 200
    #And print response

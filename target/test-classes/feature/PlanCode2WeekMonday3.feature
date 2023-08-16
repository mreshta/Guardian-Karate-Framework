@Regression
Feature: end point plan code

  Background: 
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def result = callonce read("GenerateToken2WeekMonday2.feature")
    * def validToken = result.response.token

  #9
  #Scenario # 9: Manual & Automation
  #Endpoint = /api/plans/get-all-plan-code
  #Send request to this end point validate response status code 200.
  #Validate response is JSON Array and have 4 JSON Object.
  Scenario: Validate response is JSON Array and have 4 JSON Object.
    And path "/api/plans/get-all-plan-code"
    And header Authorization = "Bearer " + validToken
    And method get
    And status 200
    And print response
    And assert response [0].planExpired == false
    And assert response [1].planExpired == false
    And assert response [2].planExpired == false
    And assert response [3].planExpired == false

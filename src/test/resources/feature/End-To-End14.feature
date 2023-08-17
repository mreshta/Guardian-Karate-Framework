@Regression
Feature: End to end Test for account 

Background: 
Given url "https://tek-insurance-api.azurewebsites.net"
* def createdAccount = callonce read("End-To-EndCreateNewAccount.feature")
* def validToken = createdAccount.validToken
* def createdAccountID = createdAccount.response.id

Scenario: Add phone
Given path "/api/accounts/add-account-phone"
And header Authorization = "Bearer " + validToken 
And param primaryPersonId = createdAccountID
#* def phoneNumberGDPath = Java.type("api.Utility.GenerateDate")
#* def phoneNumberGD = phoneNumberGDPath.getPhoneNumber()
And request 
"""
{
 
  "phoneNumber": "4934934",
  "phoneExtension": "530",
  "phoneTime": "Morning",
  "phoneType": "CellPhone"
}
"""
When method post 
Then status 201
And print response

Scenario: Add Address 
Given path "/api/accounts/add-account-address"
And header Authorization = "Bearer " + validToken
And param primaryPersonId = createdAccountID
And request
"""
{
  
  "addressType": "blah",
  "addressLine1": "blahh",
  "city": "blahh",
  "state": "CA",
  "postalCode": "20020",
  "countryCode": "2929",
  "current": true
}
"""
When method post 
Then status 201
And print response

Scenario: Add Car 
Given path "/api/accounts/add-account-car"
And header Authorization = "Bearer " + validToken
And param primaryPersonId = createdAccountID
And request
"""
{
  "id": 0,
  "make": "Tesla",
  "model": "Tesla EV",
  "year": "2020",
  "licensePlate": "939393"
}
""" 
When method post 
Then status 201
And print response 


Scenario: Delete Account
Given path "/api/accounts/delete-account"
And header Authorization = "Bearer " + validToken
And param primaryPersonId = createdAccountID
When method delete 
Then status 200
And print response




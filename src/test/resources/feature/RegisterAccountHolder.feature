@Regression
Feature: Register with Account Holder to Tek insurance 
Background: 
  Given url "https://tek-insurance-api.azurewebsites.net"
	* def createdAccount = callonce read("CreateAccount2WeekMonday4.feature")
	* def createdAccountId = createdAccount.response.id
	* def fullname = createdAccount.response.firstName + " "+ createdAccount.response.lastName
	* def generateData = Java.type("api.Utility.GenerateDate")
	* def userName = generateData.getUsername()
	Scenario: 
	And path "/api/sign-up/register"
	And request 
	"""
	{
  "primaryPersonId": "#(createdAccountId)",
  "fullname": "#(fullname)",
  "username": "#(userName)",
  "password": "user987%",
  "authority": "CUSTOMER",
  "accountType": "CUSTOMER"
}
	"""
	When method post
	Then status 201
	And print response
	And assert response.username == userName
	And assert response.accountType == "CUSTOMER"
	And assert response.fullName == fullname
	
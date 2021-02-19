Feature: Validating Place API's

@AddPlace @Regression
Scenario Outline: Verify if place is being successfully added using AddPlaceAPI
	Given Add Place Payload with "<name>" "<language>" "<address>"
	When User calls "AddPlaceAPI" with "POST" Http Request
	Then API call is success with status code 200
	And "status" in response body is "OK"
	And "scope" in response body is "APP"
	And verify place_Id created maps to "<name>" using "getPlaceAPI"
	
Examples:
	|name     |language      | address            |
	|AAhouse  | English      | World cross center |
#	|BBhouse  | Spanish      | Sea Cross Center   |

@DeletePlace @Regression
Scenario: Verify if Delete Place functionality is working
	Given DeletePlace Payload
	When User calls "deletePlaceAPI" with "POST" Http Request
	Then API call is success with status code 200
	
	
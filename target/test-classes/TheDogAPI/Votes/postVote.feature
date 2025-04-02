Feature: Voting on the Dog API

  Background:
    * url dogApiBaseUrl
    * header x-api-key = dogApiKey

  Scenario Outline: Test that you can Post a vote on the Dog API successfully
    Given path votesPath
    And request { image_id: <imageId>, sub_id: <subId>, value: <value> }
    When method POST
    Then status <postStatusCode>
    * def vote = response.id
    * def callGenericGetVoteById = call read('generics/genericGetVoteById.feature'){'id' : '#(vote)'}
    * match callGenericGetVoteById.response.id == vote
    * match callGenericGetVoteById.responseStatus == <getStatusCode>
    * def callGenericDeleteVote = call read('generics/genericDeleteVote.feature'){'id' : '#(vote)'}
    * match callGenericDeleteVote.responseStatus == <delStatusCode>
    * match callGenericDeleteVote.response.message == "SUCCESS"



    Examples:
      |imageId    |subId   |value|postStatusCode|getStatusCode|delStatusCode|
      |'M4o-vpkFc'|"Kopano"|1    |201           |200          |200          |
      |'wrongId'  |"Kopano"|1    |201           |200          |200          |


  Scenario Outline: Test that you can't Post a vote on the Dog API
    Given path votesPath
    And request { image_id: <imageId>, sub_id: <subId>, value: <value> }
    When method POST
    Then status <statusCode>
    * match response == <response>

    Examples:
      |imageId    |subId   |value|statusCode|response|
      |'M4o-vpkFc'|        |0    |400       |'"sub_id" is not allowed to be empty'|
      |           |        |null |400       |'"image_id" is not allowed to be empty'|

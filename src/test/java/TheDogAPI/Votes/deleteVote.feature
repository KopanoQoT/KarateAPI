Feature:Test that you can delete or not delete vote from API

  Background:
    * url dogApiBaseUrl
    * header x-api-key = dogApiKey

  Scenario Outline: Test that you can delete vote
    * def callGenericDeleteVote = call read('generics/genericDeleteVote.feature'){'id' : <vote>}
    * match callGenericDeleteVote.responseStatus == <status>
    * match callGenericDeleteVote.response.message == "SUCCESS"


  Examples:
    |vote  |status|
    |195347|200   |
    |195350|200   |
    |195351|200   |
    |195352|200   |
    |195353|200   |


  Scenario Outline: Test that you fail to delete vote that is not in the
    * def callGenericDeleteVote = call read('generics/genericDeleteVote.feature'){'id' : <vote>}
    * match callGenericDeleteVote.responseStatus == <status>
    * match callGenericDeleteVote.response == "NO_VOTE_FOUND_MATCHING_ID"


    Examples:
      |vote  |status|
      |193521|404   |
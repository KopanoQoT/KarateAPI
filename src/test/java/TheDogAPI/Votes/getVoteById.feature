Feature:Test that you can get a vote by ID and that you can not get a vote by a non existant ID

  Background:
    * url dogApiBaseUrl
    * header x-api-key = dogApiKey

  Scenario Outline:Test that you can get a vote by ID
    * def callGenericGetVoteById = call read('generics/genericGetVoteById.feature'){'id' : <vote>}
    * match callGenericGetVoteById.responseStatus == <status>
    * match callGenericGetVoteById.response.id == <vote>

    Examples:
      |vote  |status|
      |195338|200   |

  Scenario Outline:Test that you can not get a vote by a non existant ID
    * def callGenericGetVoteById = call read('generics/genericGetVoteById.feature'){'id' : <vote>}
    * match callGenericGetVoteById.responseStatus == <status>
    * match callGenericGetVoteById.response == 'NOT_FOUND'

    Examples:
      |vote  |status|
      |111111|404 |



Feature:Gets dog breed by Id

  Background:
    * url dogApiBaseUrl
    * header x-api-key = dogApiKey

  Scenario Outline:Test that you can get a breed by id
    * def GenericGetBreedById = call read('generics/genericGetBreedById.feature'){'id' : <breedId>}
    * match GenericGetBreedById.responseStatus == <responseStatus1>


    Examples:
    |breedId|responseStatus1|
    |10     |200           |
#    |       ||
#    |2000   ||

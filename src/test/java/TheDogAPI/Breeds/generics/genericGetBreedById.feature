Feature:gets all breeds

  Background:
    * url dogApiBaseUrl
    * header x-api-key = dogApiKey

  Scenario: gets a limited number of images
    * def brdId = $breedId
    Given path getBreedPath, brdId
    When method get

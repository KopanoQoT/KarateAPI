Feature:gets all breeds

  Background:
    * url dogApiBaseUrl
    * header x-api-key = dogApiKey

  Scenario: gets a limited number of images
    Given path getBreedPath
    When method get
    Then status 200
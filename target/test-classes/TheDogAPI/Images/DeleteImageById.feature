Feature:Delete Image from Dog API by image Id

  Background:
    * url dogApiBaseUrl
    * header x-api-key = dogApiKey

  Scenario: Get images
    Given path '/images', imageId
    When method DELETE
    Then status 204
    And match response == '#string'

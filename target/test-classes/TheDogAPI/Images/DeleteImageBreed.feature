Feature:Deleting a breed associated with an image from the Dog API

  Background:
    * url dogApiBaseUrl
    * header x-api-key = dogApiKey

  Scenario: Deleting a breed associated with an image
    Given path '/images/', imageId, '/breeds/', breeds_id
    When method DELETE
    Then status 204
    And match response == '#string'

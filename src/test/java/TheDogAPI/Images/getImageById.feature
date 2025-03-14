Feature:

  Background:
    * url dogApiBaseUrl
    * header x-api-key = dogApiKey

  Scenario: Get images
    Given path '/images', imageId
    When method GET
    Then status 200
    And match response.id == imageId
    And match response.sub_id == '#regex Kopano.*'

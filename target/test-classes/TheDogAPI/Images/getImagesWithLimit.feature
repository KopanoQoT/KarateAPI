Feature:gets a limited number of images

  Background:
    * url dogApiBaseUrl
    * header x-api-key = dogApiKey

  Scenario: gets a limited number of images
    Given path 'images'
    And params {limit: 10, page: 0, order: 'DESC'}
    When method get
    Then status 200
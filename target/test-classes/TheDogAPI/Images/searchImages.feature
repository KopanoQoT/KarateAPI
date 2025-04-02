Feature: Search for images using parameters

  Background:
    * url dogApiBaseUrl
    * header x-api-key = dogApiKey

  Scenario:
    Given path '/images/search'
    And params {size: 'med', mime_types: 'jpg', format: 'json', limit: 1, page: 0, has_breeds: 1, order: 'RAND'}
    When method get
    Then status 200
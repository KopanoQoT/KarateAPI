Feature: Posting breeds for a specific dog image to the Dog API

  Background:
    * url dogApiBaseUrl
    * header x-api-key = dogApiKey

  Scenario: Post breeds for a specific dog image
    Given  path '/images/' + imageId + '/breeds'
    When request { breed_id: '#(breeds_id)'}
    And  method POST
    Then status 200
    And match response.id == '#(breeds_id)'
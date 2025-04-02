Feature: Retrieving breeds associated with an image from the Dog API

  Background:
    * url baseUrl
    * header x-api-key = api-key

  Scenario: Retrieve breeds associated with an image
    Given path '/images/'+ imageId +'/breeds'
    When method GET
    Then status 200
    And match response[0].id == '#(breeds_id)'
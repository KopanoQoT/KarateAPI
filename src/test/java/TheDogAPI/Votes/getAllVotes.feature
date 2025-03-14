Feature: Getting all votes from the Dog API

  Background:
    * url dogApiBaseUrl
    * header x-api-key = dogApiKey
    * header Content-Type = 'application/json'

  Scenario: Get all votes from the Dog API
    Given path votesPath
    When method GET
    Then status 200
Feature: Delete a vote from the Dog API

  Background:
    * url dogApiBaseUrl
    * header x-api-key = dogApiKey

  Scenario: Delete a vote by ID from the Dog API
    Given path votesPath, vote
    When method DELETE
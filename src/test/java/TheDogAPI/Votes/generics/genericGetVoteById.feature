Feature: Getting a vote by ID from the Dog API

  Background:
    * url dogApiBaseUrl
    * header x-api-key = dogApiKey

  Scenario: Get a vote by ID from the Dog API
    Given path votesPath, vote
    When method GET
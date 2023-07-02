Feature: Delete the register of meter information
  in the meter manager


  Background:
    * url "https://ops.enerbit.dev/learning/"

  Scenario: Delete a Meter
    * call read("../meterPost/utils-post.feature@Createmeter")
    Given path "api/v1/meters/" + meterid
    When method delete
    Then status 202

  Scenario: nonexistent meter
    Given path "api/v1/meters/"+"-5"
    When method delete
    Then status 404
    And match $.detail == 'meter not found'

  Scenario: Delete no allowed
    Given path "api/v1/meters/"
    When method delete
    Then status 405
    And match $.detail == 'Method Not Allowed'

  Scenario: Unprocessable entity by Id invalid
    * def jsonResponse = read ('../jsonReferences/jsonResponseUnprocessableEntityByIdInvalid.json')
    Given path "api/v1/meters/"+"invalid data"
    When method delete
    Then status 422
    And match $ == jsonResponse




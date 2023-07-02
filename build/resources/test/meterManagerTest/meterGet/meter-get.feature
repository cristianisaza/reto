Feature: Get the register of meter information
  recorded in the meter manager


  Scenario: Succesful consult
    * call read("../meterPost/utils-post.feature@Createmeter")

    Given url "https://ops.enerbit.dev/learning/" + "api/v1/meters/" + meterid
    When method get
    Then status 200

  Scenario: Nonexistent Id
    Given url "https://ops.enerbit.dev/learning/" + "api/v1/meters/" + "-4"
    When method get
    Then status 404
    And match $.detail == 'meter not found'

  Scenario: Nonexistent Id
    Given url "https://ops.enerbit.dev/learning/" + "api/v1/meters/" + "tx"
    When method get
    Then status 422
    And match $.detail[:2].msg contains "value is not a valid integer"

    

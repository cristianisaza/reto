Feature: post the meter information in the meter manager

Background:
  * url "https://ops.enerbit.dev/learning/"
  * path "api/v1/meters/"


  Scenario: Succesful creation
    Given request {"serial": "3424234233kj","connection_type": "directa","storage_system": "interno","condition":"nuevo","owner": "RF","location": "Almacen ","manufacturer":"yes","purchase": "2022-07-28 03:08:49.340514","i_max": 6345.654,"i_b": 21.5,"i_n": 876.5,"seals": 545.65}
    When method post
    Then status 201

  Scenario: Body null
    Given request {}
    When method post
    Then status 500

   Scenario: Conection type invalid
     * def jsonResponse = read ('../jsonReferences/jsonResponseConectionTipeInvalid.json')
     Given request {"serial": "3424234233kj","connection_type": "invalid data","storage_system": "interno","condition":"nuevo","owner": "RF","location": "Almacen ","manufacturer":"yes","purchase": "2022-07-28 03:08:49.340514","i_max": 6345.654,"i_b": 21.5,"i_n": 876.5,"seals": 545.65}
     When method post
     Then status 422
     And match $ == jsonResponse
     
  Scenario: Storage system invalid
    * def jsonResponse = read ('../jsonReferences/jsonResponseStorageSystemInvalid.json')
    Given request {"serial": "3424234233kj","connection_type": "directa","storage_system": "invalid data","condition":"nuevo","owner": "RF","location": "Almacen ","manufacturer":"yes","purchase": "2022-07-28 03:08:49.340514","i_max": 6345.654,"i_b": 21.5,"i_n": 876.5,"seals": 545.65}
    When method post
    Then status 422
    And match $ == jsonResponse
#escenario con cierta inestabilidad, en ocaciones responde 502

  Scenario:  Condition invalid
    * def jsonResponse = read ('../jsonReferences/jsonResponseCondionInvalid.json')
    Given request {"serial": "3424234233kj","connection_type": "directa","storage_system": "interno","condition":"invalid data","owner": "RF","location": "Almacen ","manufacturer":"yes","purchase": "2022-07-28 03:08:49.340514","i_max": 6345.654,"i_b": 21.5,"i_n": 876.5,"seals": 545.65}
    When method post
    Then status 422
    And match $ == jsonResponse

  Scenario:  Owner invalid
    * def jsonResponse = read ('../jsonReferences/jsonResponseInvalidOwner.json')
    Given request {"serial": "3424234233kj","connection_type": "directa","storage_system": "interno","condition":"nuevo","owner": "invalid data","location": "Almacen ","manufacturer":"yes","purchase": "2022-07-28 03:08:49.340514","i_max": 6345.654,"i_b": 21.5,"i_n": 876.5,"seals": 545.65}
    When method post
    Then status 422
    And match $ == jsonResponse

  Scenario: i_max invalid data type
    * def jsonResponse = read ('../jsonReferences/jsonResponseInvalidIMax.json')
    Given request {"serial": "3424234233kj","connection_type": "directa","storage_system": "interno","condition":"nuevo","owner": "RF","location": "","manufacturer":"yes","purchase": "2022-07-28 03:08:49.340514","i_max": "Invalid data","i_b": 21.5,"i_n": 876.5,"seals": 545.65}
    When method post
    Then status 422
    And match $ == jsonResponse

  Scenario: i_b invalid data type
    * def jsonResponse = read ('../jsonReferences/jsonResponseInvalidIb.json')
    Given request {"serial": "3424234233kj","connection_type": "directa","storage_system": "interno","condition":"nuevo","owner": "RF","location": "Almacen ","manufacturer":"yes","purchase": "2022-07-28 03:08:49.340514","i_max": 6345.654,"i_b": "Invalid data","i_n": 876.5,"seals": 545.65}
    When method post
    Then status 422
    And match $ == jsonResponse

  Scenario: i_n invalid data type
    * def jsonResponse = read ('../jsonReferences/jsonResponseInvalidIn.json')
    Given request {"serial": "3424234233kj","connection_type": "directa","storage_system": "interno","condition":"nuevo","owner": "RF","location": "Almacen ","manufacturer":"yes","purchase": "2022-07-28 03:08:49.340514","i_max": 6345.654,"i_b": 25362,"i_n": "invalid data","seals": 545.65}
    When method post
    Then status 422
    And match $ == jsonResponse

  Scenario: Seals invalid data type
    * def jsonResponse = read ('../jsonReferences/jsonResponseInvalidSeals.json')
    Given request {"serial": "3424234233kj","connection_type": "directa","storage_system": "interno","condition":"nuevo","owner": "RF","location": "Almacen ","manufacturer":"yes","purchase": "2022-07-28 03:08:49.340514","i_max": 6345.654,"i_b": 25362,"i_n": 58652,"seals": "invalid data"}
    When method post
    Then status 422
    And match $ == jsonResponse
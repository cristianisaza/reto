Feature: post the meter information in the meter manager

  

    
  Background:
    * url "https://ops.enerbit.dev/learning/"
    * call read("../meterPost/utils-post.feature@Createmeter")
    * path "api/v1/meters/" + meterid

  Scenario: Id null
    Given url "https://ops.enerbit.dev/learning/"
    And path "api/v1/meters/"
    Given request {"serial": "3424234233kj","connection_type": "direct","storage_system": "interno","condition": "nuevo","owner": "RF","location": "55865","manufacturer": "yes","purchase": "2022-07-28 03:08:49.340514","i_max": 6345.654,"i_b": 21.5,"i_n": 876.5,"seals": 545.65}
    When method patch
    Then status 404

  Scenario: Invalid Id
    Given url "https://ops.enerbit.dev/learning/"
    And path "api/v1/meters/test"
    Given request {"serial": "3424234233kj","connection_type": "direct","storage_system": "interno","condition": "nuevo","owner": "RF","location": "55865","manufacturer": "yes","purchase": "2022-07-28 03:08:49.340514","i_max": 6345.654,"i_b": 21.5,"i_n": 876.5,"seals": 545.65}
    When method patch
    Then status 404

  Scenario: Succesful update
    Given request {"serial": "3424234233kj","connection_type": "directa","storage_system": "interno","condition":"nuevo","owner": "RF","location": "Almacen ","manufacturer":"yes","purchase": "2022-07-28 03:08:49.340514","i_max": 6345.654,"i_b": 21.5,"i_n": 876.5,"seals": 545.65}
    When method patch
    Then status 200

  Scenario: Body null
    Given request {}
    When method patch
    Then status 200
  #En este escenario se recomienda hacer un control de este tipo de solicitud, ya que el statuscode corresponde a una solicitud exitosa
  # y de hecho no se modifica el registro. A no ser que se tengan razones por las cuales deba ser asi y no se
  # tenga conocimiento al momento de solucionar este reto.



  Scenario: Conection type invalid
    Given request {"serial": "3424234233kj","connection_type": "invalid data","storage_system": "interno","condition":"nuevo","owner": "RF","location": "Almacen ","manufacturer":"yes","purchase": "2022-07-28 03:08:49.340514","i_max": 6345.654,"i_b": 21.5,"i_n": 876.5,"seals": 545.65}
    When method patch
    Then status 422

  Scenario: Storage system invalid
    Given request {"serial": "3424234233kj","connection_type": "directa","storage_system": "invalid data","condition":"nuevo","owner": "RF","location": "Almacen ","manufacturer":"yes","purchase": "2022-07-28 03:08:49.340514","i_max": 6345.654,"i_b": 21.5,"i_n": 876.5,"seals": 545.65}
    When method patch
    Then status 422


  Scenario:  Condition invalid
    Given request {"serial": "3424234233kj","connection_type": "directa","storage_system": "interno","condition":"invalid data","owner": "RF","location": "Almacen ","manufacturer":"yes","purchase": "2022-07-28 03:08:49.340514","i_max": 6345.654,"i_b": 21.5,"i_n": 876.5,"seals": 545.65}
    When method patch
    Then status 422

  Scenario:  Owner invalid
    Given request {"serial": "3424234233kj","connection_type": "directa","storage_system": "interno","condition":"nuevo","owner": "invalid data","location": "Almacen ","manufacturer":"yes","purchase": "2022-07-28 03:08:49.340514","i_max": 6345.654,"i_b": 21.5,"i_n": 876.5,"seals": 545.65}
    When method patch
    Then status 422

  Scenario: i_max invalid data type
    Given request {"serial": "3424234233kj","connection_type": "directa","storage_system": "interno","condition":"nuevo","owner": "RF","location": "","manufacturer":"yes","purchase": "2022-07-28 03:08:49.340514","i_max": "Invalid data","i_b": 21.5,"i_n": 876.5,"seals": 545.65}
    When method patch
    Then status 422

  Scenario: i_b invalid data type
    Given request {"serial": "3424234233kj","connection_type": "directa","storage_system": "interno","condition":"nuevo","owner": "RF","location": "Almacen ","manufacturer":"yes","purchase": "2022-07-28 03:08:49.340514","i_max": 6345.654,"i_b": "Invalid data","i_n": 876.5,"seals": 545.65}
    When method patch
    Then status 422

  Scenario: i_n invalid data type
    Given request {"serial": "3424234233kj","connection_type": "directa","storage_system": "interno","condition":"nuevo","owner": "RF","location": "Almacen ","manufacturer":"yes","purchase": "2022-07-28 03:08:49.340514","i_max": 6345.654,"i_b": 25362,"i_n": "invalid data","seals": 545.65}
    When method patch
    Then status 422

  Scenario: i_n invalid data type
    Given request {"serial": "3424234233kj","connection_type": "directa","storage_system": "interno","condition":"nuevo","owner": "RF","location": "Almacen ","manufacturer":"yes","purchase": "2022-07-28 03:08:49.340514","i_max": 6345.654,"i_b": 25362,"i_n": 58652,"seals": "invalid data"}
    When method patch
    Then status 422
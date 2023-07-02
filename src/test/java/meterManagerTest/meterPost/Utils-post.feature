@ignore
Feature:  Reusable scenarios for delete test

@Createmeter
  Scenario: Succesful creation
    Given url "https://ops.enerbit.dev/learning/"
    And path "api/v1/meters/"
    Given request {"serial": "3424234233kj","connection_type": "directa","storage_system": "interno","condition":"nuevo","owner": "RF","location": "Almacen ","manufacturer":"yes","purchase": "2022-07-28 03:08:49.340514","i_max": 6345.654,"i_b": 21.5,"i_n": 876.5,"seals": 545.65}
    When method post
    Then status 201
    And def meterid = $.id
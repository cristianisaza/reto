# reto

Bugs encontrados:
*Se encuentra BUg en scenario "Body null" del metodo patch. Este esta respopndiendo status code 200. Para efectos del reto este escenario se esta 
validando con status code 200

Recomendaciones:
*Al momento de paralelizar las pruebas con mas de 2 hilos en opcaciones se encuentra que la API falla por concurrencia al responder status code 500
en escenarios que deberian tener un status code diferente.

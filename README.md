# reto

Bugs encontrados:
*Se encuentra BUg en scenario "Body null" del metodo patch. Este esta respopndiendo status code 200. Para efectos del reto este escenario se esta 
validando con status code 200

Recomendaciones:
*Al momento de paralelizar las pruebas con mas de 2 hilos en opcaciones se encuentra que la API falla por concurrencia al responder status code 500
en escenarios que deberian tener un status code diferente.

Ejecución de pruebas:
*Para ejecutar todas las pruebas se debe correr el Runner AllTestParallel
de la carpeta "src/test/java/AllTestParallel.java"
para ejecutar pruebas por metodos en la carpeta de cada metodo se encuentra su propio runner


Nota:
Las pruebas se abordaron como pruebas de integración, por esto se establecio la estructura de carpetas



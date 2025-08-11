//
//  README.md
//  Umas
//
//  Created by Ángel González on 11/8/25.
//

# Kata de actores

Este proyecto es una micro aplicación cuyo fin es ver cómo aplicar los actores al mismo.

Antes de empezar, es conveniente leerse [este resumen](./AboutActors.md).

## Ejercicios

Consta de los siguientes ejercicios:

1. El ejercicio 1 consta en migrar la micro aplicación a su uso con async/await. Aunque toda la carga de datos se hace en local y podría realizarse de forma síncrona, vamos a plantear una situación donde nos pidan moverlo a un API (que es inherentemente asíncrona). Se comienza desde la rama main.
2. El ejercicio 2 consta en añadir un actor (o convertir clases en actores) para gestionar la concurrencia en datos. Se comienza desde la rama exercise1.
3. El ejercicio 3 consta en adaptar el código realizado a swift6, resolviendo la implicaciones que conlleve. Se comienza desde la rama exercise2.

Los ejercicios resueltos se encuentran en las ramas exercise1 para el primer ejercicio, exercise2 para el segundo y exercise3 para el tercero. Si al completar el ejercicio te encuentras diferencias con respecto al resuelto, eso no implica que esté mal. Se puede llegar a resultados válidos diferentes.

## Flujo de la app

La microaplicación de ejemplo es un listado de personajes de Uma Musume. En el listado se encuentra una imagen de cada personaje, su nombre y si el usuario ha marcado como favorito.

El listado incluye una opción para solo mostrar los personajes favoritos.

Pulsando en un elemento de la lista se abre el detalle que, para este ejemplo, contiene lo mismo que el listado en otra disposición. La estrella de favoritos es un botón que permite marcar o desmarcar como tal el personaje.



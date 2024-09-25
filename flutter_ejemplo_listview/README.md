# Ejemplo de ListView

Proyecto de ejemplo de uso de ListView. En el que hemos creado dos pantallas: la primera contiene un ListView muy sencillo con el constructor por defecto, la segunda utiliza el constructor ListView.builder.

Como hemos comentado, cuando necesitamos optimizar el rendimiento de nuestras listas, necesitamos utilizar el constructor ListView.builder que toma dos parámetros clave:

- **itemCount**: El número total de ítems en la lista.
- **itemBuilder**: Una función que define cómo se construye cada ítem de la lista. Esta función se llama cada vez que se necesita crear un nuevo ítem visible.

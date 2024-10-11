# flutter_fetch_datos

Proyecto de ejemplo en el que obtenemos datos de la api de jsonplaceholder. La estructura de directorios sigue el enfoque marcado por la Arquitectura Limpia (Clean Architecture) en la que diferenciamos 3 capas principales:

1. **Capa de Presentación (presentation)**: Esta capa se encarga de la interfaz de usuario y la interacción con el usuario. Aquí se encuentran los widgets de Flutter que representan la interfaz gráfica y se encargan de recibir las acciones del usuario.

2. **Capa de Dominio (domain)**: Esta capa contiene la lógica de negocio de la aplicación. Aquí se definen los casos de uso y las reglas de negocio. Es independiente de cualquier framework o tecnología específica y puede ser reutilizada en diferentes plataformas.

	- *UseCase*: Clases que encapsulan la lógica particular de un caso de uso de la aplicación (por ejemplo, obtener toda la información de los Álbums)
	
	![Picture](https://i0.wp.com/resocoder.com/wp-content/uploads/2019/08/domain-layer-diagram.png?w=141&ssl=1){style="display: block; margin: 0 auto"}
	
	-  *Entities*: Objetos con los que nuestra aplicación trabaja (Album)
	- *Repositories*: Clases abstractas que definen la funcionalidad esperada de otras capas (la de datos)

 
3. **Capa de Datos (data)**: Esta capa se encarga de acceder a los datos de la aplicación, ya sea a través de una API, una base de datos local o cualquier otro origen de datos. Aquí se implementan los repositorios y los data sources.

	- *Repositories*: Cada Repositorio debe implementar Repository de la capa de dominio.
	- *Datasources*: Clases encargadas de implementar la lógica necesaria para obtener la información de la fuente (API, Base de Datos, etc)
	- *Models*: Extensiones de Entidades con la adición de miembros adicionales que pueden ser dependientes de la plataforma. Por ejemplo, en el caso de analizar objetos JSON de la respuesta del servidor, esto puede agregar alguna funcionalidad específica (toJson, fromJson) o campos adicionales para la base de datos.

![Picture](https://i0.wp.com/resocoder.com/wp-content/uploads/2019/08/data-layer-diagram.png?w=329&ssl=1){style="display: block; margin: 0 auto"}

La comunicación entre estas capas se realiza a través de interfaces y contratos, lo que permite una mayor flexibilidad y desacoplamiento. Por ejemplo, la capa de Presentación interactúa con la capa de Dominio a través de los casos de uso, y la capa de Datos implementa los contratos definidos en la capa de Dominio.

  

![Picture](https://i0.wp.com/resocoder.com/wp-content/uploads/2019/08/Clean-Architecture-Flutter-Diagram.png?w=556&ssl=1){style="display: block; margin: 0 auto"}

  

Esta estructura de capas en la Arquitectura Limpia ayuda a mantener un código más organizado, facilita las pruebas unitarias y permite realizar cambios en una capa sin afectar a las demás. Además, promueve la reutilización de código y facilita la escalabilidad de la aplicación.

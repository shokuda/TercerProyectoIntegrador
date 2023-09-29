# API
Aplicacion simple para catalogar peliculas o series. Creada en NodeJS usando bases de datos MySQL.


#### Especificaciones
- Servidor: http://127.0.0.1:3000
- Versión: 1.0.0
- Autor: Okuda Santiago
- Repositorio GitHub: git+ https://github.com/shokuda/TercerProyectoIntegrador.git

#### Requerimientos
- Node.js v20.5.1
- MySQL2 v3.6.1
- GIT v2.40.1
- IDE - Visual Studio Code v1.82.2

#### Estructura de directorios
``` tree
    ├── node_modules
    ├── src
    │   ├── public
    |   |   ├── css
    │   │   |   └── **/*.css
    |   |   ├── img
    │   │   |   └── **/*.jpg **/*.png
    ├── .env
    ├── .env.dist
    ├── .eslintrc.json
    ├── .gitignore
    ├── package.json
    ├── package-lock.json 
    ├── readme_api.jpg
    └── README.md
```

---
### CONFIGURACION DE ENTORNO
Se debe hacer una copia del archivo **.env.dist** y renombrarlo como **.env**. Con respecto a su contenido, es necesario asignar los valores a correspondientes a las variables `SERVER_PORT`, `SERVER_HOST`,`DATABASE_URL` y `DATABASE_NAME`

---
### MÓDULO DE COCHES

Este módulo permite la gestión de coches. El mismo, ofrece funciones para agregar, modificar, borrar o leer el registro de un coche. Además, permite visualizar reportes filtrados por diferentes criterios de búsqueda.

#### Métodos HTTP
| Tipo | URI | Descripción |
|------|-----|-------------|
| GET | http://127.0.0.1:3000/api/v1/coches | Obtiene los registros de los coches (permite filtros) |
| GET | http://127.0.0.1:3000/api/v1/coches/1 | Obtiene el registro de un coche en específico |
| POST | http://127.0.0.1:3000/api/v1/coches | Crea un registro de un nuevo coche |
| PUT | http://127.0.0.1:3000/api/v1/coches/1 | Modifica el registro de un coche en específico |
| DELETE | http://127.0.0.1:3000/api/v1/coches/1 | Elimina el registro de un coche en específico |


#### Método GET:
- Request:
  - Parámetros opcionales de tipo QUERY:
    - marca=Ford              *(tipo: string. Trae los coches de una misma marca)* 
    - precio=min              *(tipo: string. Trae el coche que tiene el precio más bajo)*
    - precio=max              *(tipo: string. Trae el coche que tiene el precio más alto)*
    - precio_mayor_que=670000 *(tipo: decimal. Trae los coches que tienen un precio mayor que $6.700.000)* 
- Response:
  - Código HTTP: **200** *Ok*
    ``` json
        [
            {
                "_id": "649cb2a00908be857242c85a",
                "id": 1,
                "marca": "Ford",
                "modelo": "Ranger",
                "anio": 2023,
                "precio": 12500250,
                "descuento": 3.5,
                "velocidad_crucero": "Control en el volante",
                "es_0km": true
            }
        ]
    ```
  - Código HTTP: **500** *Hubo un error en el servidor*


#### Método GET - Específico:
- Request:
  - Parámetro obligatorio de tipo URL:
    - 8 *(tipo: integer. Indica el id del coche que se requiere obtener)*
- Response:
  - Código HTTP: **200** *Ok*
    ``` json
        {
            "_id": "649cb2a00908be857242c860",
            "id": 8,
            "marca": "Fiat",
            "modelo": "Duna",
            "anio": 2012,
            "precio": 3200544,
            "es_0km": false
        }
    ```
  - Código HTTP: **400** *Error. El Id no corresponde a un coche existente*;
  - Código HTTP: **500** *Hubo un error en el servidor*


#### Método POST:
- Request:
  - Parámetros requeridos del BODY:
    - marca=Ford     *(tipo: string. Establece el valor de la marca)* 
    - modelo=Fiesta  *(tipo: string. Establece el valor del modelo)* 
    - anio=2018      *(tipo: integer. Establece el valor del anio)* 
    - precio=2500750 *(tipo: decimal. Establece el valor del precio)* 
  - Parámetros opcionales del BODY:
    - descuento=3.5 *(tipo: decimal. Establece el valor del descuento)* 
    - es_0km=true   *(tipo: boolean. Establece si es un coche 0km)* 
- Response:
  - Código HTTP: **201** *Created*
  - Código HTTP: **400** *Error. Faltan datos de relevancia*;
  - Código HTTP: **500** *Hubo un error en el servidor*


#### Método PUT:
- Request:
  - Parámetro obligatorio de tipo URL:
    - 15 *(tipo: integer. Indica el id del coche que se requiere modificar)*
  - Parámetros requeridos del BODY:
    - marca=Ford     *(tipo: string. Establece el valor de la marca)* 
    - modelo=Fiesta  *(tipo: string. Establece el valor del modelo)* 
    - anio=2018      *(tipo: integer. Establece el valor del anio)* 
    - precio=2500750 *(tipo: decimal. Establece el valor del precio)* 
  - Parámetros opcionales del BODY:
    - descuento=3.5 *(tipo: decimal. Establece el valor del descuento)* 
    - es_0km=true   *(tipo: boolean. Establece si es un coche 0km)* 
- Response:
  - Código HTTP: **200** *Ok*
  - Código HTTP: **400** *Error. El Id no corresponde a un coche existente*;
  - Código HTTP: **400** *Error. Faltan datos de relevancia*;
  - Código HTTP: **500** *Hubo un error en el servidor*


#### Método DELETE:
- Request:
  - Parámetro obligatorio de tipo URL:
    - 10 *(tipo: integer. Indica el id del coche que se requiere eliminar)*
- Response:
  - Código HTTP: **200** *Ok*
  - Código HTTP: **500** *Hubo un error en el servidor*
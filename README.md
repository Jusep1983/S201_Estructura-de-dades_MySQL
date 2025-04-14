# S201_Estructura-de-dades_MySQL

## 📄 Descripción

Este repositorio contiene el diseño y creación de bases de datos a partir de tres supuestos reales, modelados a través de diagramas Entidad-Relación (E/R) y llevados a la práctica mediante scripts SQL.

## 🔽 Enunciados:
 <details>
 <summary>
  Nivel 1 (clica en el desplegable para ver los enunciados completos)
   
   - Ejercicio 1 - Òptica: Diseño de una base de datos para gestionar clientes, proveedores, productos (gafas), empleados y ventas de una óptica llamada Cul d'Ampolla.
   - Ejercicio 2 - Pizzería: Modelado de una base de datos para una web de pedidos de comida a domicilio, incluyendo clientes, pedidos, productos, empleados, tiendas, localizaciones, etc.
   
  </summary>
  
    ## Ejercicio 1 - Óptica
    Una óptica llamada "Cul d'Ampolla" quiere informatizar la gestión de clientes y ventas de gafas.
    
    Proveedores:
    - Nombre
    - Dirección (calle, número, piso, puerta, ciudad, código postal y país)
    - Teléfono
    - Fax
    - NIF
    
    Política de compras:
    Las gafas de una marca se compran a un único proveedor (para obtener mejores precios), pero pueden comprarse gafas de varias marcas a un mismo proveedor.
    
    Datos de las gafas:
    - Marca
    - Graduación de cada lente
    - Tipo de montura (flotante, pasta o metálica)
    - Color de la montura
    - Color de cada lente
    - Precio
    
    Datos de clientes:
    - Nombre
    - Dirección postal
    - Teléfono
    - Correo electrónico
    - Fecha de registro
    - Cliente que lo recomendó (si aplica)
    - Empleado/a que realizó la venta
  
    Consultas de verificación:
    - Listar el total de facturas de un cliente/a en un periodo determinado.
    - Listar los diferentes modelos de gafas vendidas por un empleado durante un año.
    - Listar los proveedores que han suministrado gafas vendidas por la óptica.
    
    ## Ejercicio 2 - Pizzería
    
    Diseño de web para pedidos de comida a domicilio por internet.
    
    Datos de clientes (identificador único):
    - Nombre  
    Apellidos
    Dirección
    Código postal
    Localidad
    Provincia
    Teléfono
    
    Estructura adicional:
    Localidades y provincias en tablas separadas
    Una localidad pertenece a una provincia
    Una provincia tiene muchas localidades
    
    Pedidos (identificador único):
    - Fecha/hora
    - Tipo (domicilio o recoger en tienda)
    - Cantidad de productos por tipo
    - Precio total
    
    Productos (identificador único):
    - Nombre
    - Descripción   
    - Imagen 
    - Precio
   
    Especificaciones:
    Pizzas tienen categorías (nombre variable)
    Una pizza solo tiene una categoría
    Una categoría puede tener muchas pizzas
    
    Tiendas (identificador único):
    - Dirección
    - Código postal
    - Localidad
    - Provincia
    
    Empleados (identificador único):
    - Nombre
    - Apellidos
    - NIF
    - Teléfono
    - Rol (cocinero/a o repartidor/a)
    
    Datos de reparto:
    - Repartidor/a asignado
    - Fecha/hora de entrega
 
    Consultas de verificación:
    - Listar cuántos productos de categoría 'Bebidas' se han vendido en una determinada localidad.
    - Listar cuántos pedidos ha efectuado un determinado empleado/a.

</details>

 <details>
 <summary>
      Nivel 2  (clica para ver el enunciado completo)
   
   - Ejercicio YouTube: Diseño de una base de datos que representa una versión reducida de YouTube, incluyendo usuarios/as, vídeos, canales, suscripciones, likes, dislikes, playlists y comentarios.
    
  
  </summary>
  
    Ejercicio - YouTube
    Desarrollaremos un modelo sencillo de cómo sería la base de datos para una versión reducida de YouTube.
    
    De cada usuario/a guardamos un identificador único:
    
    - Email.
    - Contraseña. 
    - Nombre de usuario/a.  
    - Fecha de nacimiento.
    - Sexo.
    - País.
    - Código postal.
  
    Un usuario/a publica videos. De cada video guardamos un identificador único:
    - Un título.
    - Una descripción.
    - Un tamaño.
    - El nombre del archivo de video. 
    - Duración del video.
    - Una miniatura (thumbnail).
    - El número de reproducciones.
    - El número de likes.
    - El número de dislikes.
    
    Un video puede tener tres estados diferentes: público, oculto y privado.
    Un video puede tener muchas etiquetas. Una etiqueta se identifica por un identificador único y un nombre de etiqueta.
    Es importante registrar quién es el usuario/a que publica el video y en qué fecha/hora lo hace.
    
    Un usuario/a puede crear un canal. Un canal tiene un identificador único:
    - Un nombre.
    - Una descripción.
    - Una fecha de creación.
    
    Un usuario/a puede suscribirse a los canales de otros usuarios/as.
    Un usuario/a puede darle un like o un dislike a un video una única vez.
    Se debe llevar un registro de los usuarios/as que han dado like o dislike a un video determinado, y en qué fecha/hora lo hicieron.
    
    Un usuario/a puede crear playlists con los videos que le gustan. Cada playlist tiene un identificador único: 
    - Un nombre.
    - Una fecha de creación.
    - Un estado que indica si puede ser pública o privada.
    - Un usuario/a puede escribir comentarios en un video determinado. Cada comentario está identificado por un identificador único:
    - El texto del comentario.
    - La fecha/hora en la que se realizó.
    
    Un usuario/a puede marcar un comentario como me gusta o no me gusta.
    Se debe llevar un registro de los usuarios/as que han marcado un comentario como me gusta/no me gusta, y en qué fecha/hora lo hicieron.

    Consultas de verificación:
    - Obtener los vídeos subidos por un usuario/a con más de X reproducciones.
    - Listar los comentarios con más likes en un vídeo determinado.
    - Saber cuántas veces un vídeo ha sido marcado como like o dislike.

    
</details>

## 💻 Tecnologías Utilizadas

El proyecto ha sido desarrollado utilizando:

- MySQL como sistema gestor de base de datos

- MySQL Workbench como herramienta de diseño y ejecución de scripts SQL

- Git y GitHub para control de versiones

## 📋 Requisitos

Para ejecutar el proyecto es necesario contar con:

- MySQL Server

- MySQL Workbench u otro entorno compatible con SQL

- Git instalado

## 🛠️ Instalación

Clona el repositorio:

- git clone https://github.com/tu-usuario/tu-repo.git

- Abre MySQL Workbench u otra herramienta compatible.

- Ejecuta los scripts SQL por orden: creación de BD, creación de tablas y carga de datos.

## ▶️ Ejecución

Ejecuta las consultas de verificación que encontrarás en cada nivel para comprobar la integridad de las relaciones y datos insertados.

## 🌐 Despliegue

Este proyecto está pensado para entorno local. No se contempla despliegue online, pero puedes usar plataformas como XAMPP o Docker para entornos portables.

## 🤝 Contribuciones

Si deseas colaborar, puedes:

- Abrir una issue con sugerencias o problemas detectados

- Hacer un fork y luego una pull request con tus propuestas de mejora

¡Gracias por tu interés en este proyecto! 🚀


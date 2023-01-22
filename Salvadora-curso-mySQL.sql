use salvadora;
SELECT * from cliente;
select CI, nombre from cliente;
SELECT * from salvadora.cliente WHERE  apellido = "cruz";
SELECT * from producto where marca = "continental" and precio >= 3000;
-- WHERE y LIKE
SELECT * from salvadora.cliente WHERE  apellido like "c%"; -- cualquier apellido que comienza con "C"
SELECT * from salvadora.cliente WHERE  apellido like "%z"; -- cualquier apellido que termina en "z"
SELECT * from salvadora.cliente WHERE  apellido like "c"; -- cualquier apellido que comienza con "C"
SELECT * from salvadora.proveedor WHERE ID_PROVEEDOR like "%0%"; -- cualquier proveedor que tenga un "0" en su ID
SELECT * from salvadora.cliente WHERE CI like "18%"; -- cualquier cliente que su CI comience con 18
SELECT * from salvadora.cliente WHERE CI not like "18%"; -- cualquier cliente que su CI no comience con 18
SELECT * FROM salvadora.producto WHERE cod_producto like "10_"; -- que el código comience con 10 pero tenga solo 3 caracteres
-- BETWEEN
select nombre, marca, color, precio from producto WHERE precio BETWEEN 1500 and 3000; -- mostrar los registros donde precio esta entre 1500 y 3000
select nombre, marca, color, precio from producto WHERE precio not BETWEEN 1500 and 3000; -- mostrar los registros donde precio no esta entre 1500 y 3000
-- IN
select * from producto WHERE  precio IN (1800, 2300, 3000); -- selecciono los productos que tienen esos tres precios 
select nombre, marca, color from producto WHERE color  IN ("rojo", "blanco","negro");  -- selecciono los productos donde el color sea...
-- sum() count() min() max()
select sum(precio) from producto; -- summamos el precio de todos los artículos
select count(id_proveedor) from proveedor;  -- contamos la cantidad de id_proveedor ( llave primaria) que hay en proveedor
select min(precio) from producto; -- producto con el valor minimo
select max(precio) from producto; -- producto con el valor máximo
-- GROUP BY
select marca, sum(precio) from producto GROUP BY(marca); -- agrupo por marca la suma de los precios de cada marca
select marca, count(*) from producto GROUP BY(marca); -- cuantos productos hay por cada marca
select marca, count(*) from producto GROUP BY(marca) ORDER BY marca; -- cuantos productos hay por cada marca ordenados por marca
select marca, count(*) from producto GROUP BY(marca) ORDER BY count(*); -- cuantos productos hay por cada marca ordenados por cantidad de productos de forma ascendente
select marca, count(*) from producto WHERE color = "negro" GROUP BY(marca); -- cuantos productos hay de color negro por cada marca
select marca, min(precio) FROM producto GROUP BY(marca); -- cual es el precio minimo de cada marca agrupado por marca 
-- HAVING
SELECT marca, sum(stock) from producto -- mostrar las marcas cuyo stock sea mas de 30 productos
GROUP BY marca
having sum(stock) > 30;
SELECT modelo, sum(stock)   from producto -- mostrar los modelos cuyo stock sea mas de 30 productos
GROUP BY modelo
having sum(stock) > 30;
SELECT color, count(*) from producto -- mostrar los productos por su color donde haya menos de 4 elementos del mismo color
group by color
having count(*) < 4;
-- ORDER BY
SELECT * from producto -- todos los productos de marca continental ordenados por nombre de forma descendente (por defecto es ascendente)
WHERE marca = "continental"
ORDER BY nombre DESC; 
SELECT * from producto -- todos los productos de marca con primera letra b ordenados por nombre de forma ascendente
WHERE marca LIKE "b%"
ORDER BY marca ASC;
 
-- Ejercicios
-- 01 Obtener los nombes de los clientes de Salvadora
SELECT nombre from cliente;

-- 02 Obtener los nombres, marcas y precios de los productos de Salvadora
SELECT nombre, marca, precio from producto; 

-- 03 Obtener todos los datos de los productos cuyo precio esté entre 2000 y 3000
select * from producto WHERE precio BETWEEN 2000 and 3000;

-- 04 Obtener el numero de productos cuyo precio sea igual a 1250
select count(cod_producto) from producto where precio = 1250;

-- 05 obtener nombre, marca y precio del producto mas barato
select nombre, marca, precio 
from producto 
where precio = (select min(precio) from producto); -- uso otro query dentro de where para encontar el precio minimo

-- 06 seleccionar todos los clientes que no tengan celular, los celulares comienzan con 7 o 6
select * from cliente where telefono not like "7%" and telefono not like "6%";

-- Modificacion y eliminacion
create database prueba_db;
use prueba_db;

CREATE TABLE usuario( 
CI INT, 
COD_PRODUCTO INT, 
FECHA_COMPRA DATE, 
CANTIDAD INT, 
PRIMARY KEY (CI) ); 

CREATE TABLE PRODUCTO( 
COD_PRODUCTO INT  primary key, 
NOMBRE VARCHAR (22), 
MARCA VARCHAR (22), 
COLOR VARCHAR (22), 
MODELO VARCHAR (22), 
STOCK INT, 
PRECIO INT
); 
CREATE TABLE servicios( 
CI INT, 
COD_PRODUCTO INT, 
FECHA_COMPRA DATE, 
CANTIDAD INT,
PRIMARY KEY (CI), 
foreign key (COD_PRODUCTO) 
references producto (cod_producto) 
); 

show tables;
-- quiero cambiar el nombre de la tabla usuario por cliente
ALTER TABLE usuario rename cliente;
DESCRIBE cliente;
DESCRIBE producto;
DESCRIBE servicios;

-- de la tabla cliente eliminamos cantidad
ALTER  TABLE cliente DROP cantidad;

-- de la tabla producto eliminamos stock y color
ALTER  TABLE producto DROP stock, DROP color;

-- de la tabla servicios quiero eliminar el PK
ALTER TABLE servicios DROP PRIMARY KEY;

-- de la tabla servicios quiero eliminar el FK
ALTER TABLE servicios DROP FOREIGN KEY cod_producto;  -- me da un error
-- hago  
SHOW CREATE TABLE servicios;
ALTER TABLE servicios DROP FOREIGN KEY servicios_ibfk_1;  -- es el dato de la clave foranea del comando anterior

-- insertar datos en las tablas
DESCRIBE cliente;
-- quiero añadir telefono como columna
ALTER TABLE cliente ADD telefono INT;  -- la columna se insertó al final
-- quiero agregar una columna en un lugar especificado, despues de CI
ALTER TABLE cliente ADD nombre VARCHAR(15) AFTER CI;
-- quiero añadir una columna al inicio
ALTER TABLE cliente ADD codigo INT FIRST;
-- quiero hacer una modificacion
ALTER TABLE cliente CHANGE telefono CELULAR INT;
-- quiero cambiar el tipo de dato de cod_producto de INT a VARCHAR
ALTER TABLE cliente MODIFY cod_producto VARCHAR(20) NOT NULL;














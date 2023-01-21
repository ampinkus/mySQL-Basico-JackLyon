use salvadora;
SELECT * from cliente;
select CI, nombre from cliente;
SELECT * from salvadora.cliente WHERE  apellido = "cruz";
SELECT * from producto where marca = "continental" and precio >= 3000;
SELECT * from salvadora.cliente WHERE  apellido like "c%"; -- cualquier apellido que comienza con "C"
SELECT * from salvadora.cliente WHERE  apellido like "%z"; -- cualquier apellido que termina en "z"
SELECT * from salvadora.cliente WHERE  apellido like "c"; -- cualquier apellido que comienza con "C"
SELECT * from salvadora.proveedor WHERE ID_PROVEEDOR like "%0%"; -- cualquier proveedor que tenga un "0" en su ID
SELECT * from salvadora.cliente WHERE CI like "18%"; -- cualquier cliente que su CI comience con 18











/*pregunta si hay entradas menos de 2000 pesos*/
/*query positiva*/
/*categoria 1*/
SELECT *
FROM Recital R JOIN Banda B
ON R.id_banda_R = B.id_banda
WHERE R.precio_Entrada < 2000;

/*muestra elpromedio de los precios de las entradas*/
SELECT avg(R.precio_Entrada) AS promedio_precio
from Recital R;

/*trae la direccion de los bares con los sig id*/
SELECT DISTINCT direccion
FROM bar B
WHERE B.id_bar IN (1, 2, 5);

/*muestra canciones que sus bandas den un recital*/
SELECT C.titulo AS Canciones
FROM cancion C
WHERE C.id_banda_C IN (SELECT B.id_banda
                        FROM banda B
                     	LEFT JOIN recital R
                     	ON B.id_banda = R.id_banda_R
                        WHERE  R.id_banda_R IS NOT NULL);

/*pregunta si hay letra subidas*/
/*query negativa*/
/*categoria 2*/
SELECT C.letra
FROM Cancion C JOIN Banda B
ON C.id_banda_C = B.id_banda
WHERE C.letra IS NOT NULL;

/*encargados de bar con capacidad menor a 300*/
/*Seleccionar registros relacionados a un registro único*/
/*categoria 3*/
SELECT DISTINCT E.dni, E.nombre, E.apellido, E.telefono, E.telefono_Sec
FROM Encargado E INNER JOIN Bar B
ON E.dni = B.dni_encargado_B
WHERE B.capacidad > 300;

/*Tre la cancion, el nombre de la banda, la fecha del recital, la direccion del bar y el nombre del encargado*/
/*Registro relacionado con todos*/
/*categoria 4*/
SELECT C.titulo,Ba.nombre,R.fecha,B.direccion,E.nombre
FROM Cancion C,Banda Ba,Recital R,Bar B,Encargado E
WHERE C.titulo = 'dificil love' AND Ba.nombre = 'philips collin' AND R.fecha = '2022/08/09' AND B.id_bar = 4 AND E.nombre = 'gabriel'

/*trae banda con titulo y letra de sus canciones aunque no tenga letra*/
/*Outer Join*/
/*categoria 5*/
SELECT B.nombre, C.titulo ,C.letra
FROM banda B
LEFT OUTER JOIN cancion C
ON B.id_banda = C.id_banda_C;

/*pregunta el nombre los encargados si existen en un bar*/
/*Query anidada en el WHERE*/
/*categoria 6*/
SELECT E.nombre
from Encargado E
where EXISTS (SELECT 1
                    FROM bar B
                    WHERE E.dni = B.dni_encargado_B);

/*Bandas que no tengan canciones de mas de 4 min de duracion*/
/*Query anidada en el FROM*/
/*categoria 7*/
SELECT DISTINCT B.id_banda, B.nombre, B.genero
FROM banda B
LEFT JOIN
    (SELECT DISTINCT B.id_banda, B.nombre, B.genero
     FROM banda B JOIN Cancion C
     ON B.id_banda = C.id_banda_C
     WHERE C.duracion > 4) AS MAS_4
ON B.id_banda = MAS_4.id_banda
WHERE MAS_4.id_banda IS NULL;

/*Trae cantidad de encargados por direccion de bar*/
/*8. Query anidada en el SELECT*/
/*categoria 8*/
SELECT B.direccion, (SELECT COUNT(*)
                  		FROM Encargado E 
                  		WHERE B.dni_encargado_B = E.dni) as cantidad_encargados 
FROM Bar B;

/*une encargado con bar*/
/*Unión*/
/*categoria 9*/
SELECT E.nombre,E.apellido
FROM Encargado E
UNION
SELECT B.id_bar,B.direccion
FROM Bar B;

/*trae solo la direccion que le digas*/
/*Intersección*/
/*categoria 10*/
SELECT *
FROM Bar B INNER JOIN Encargado E
ON B.dni_encargado_B = E.dni
WHERE B.direccion = 'juan errique pinti 68';

/*trae todas las direcciones excepto la que se le indique *EXCEPT solo funciona en sql server**/
/*Diferencia*/
/*categoria 11*/
SELECT *
FROM Bar B
EXCEPT
SELECT * 
FROM Bar B
WHERE B.direccion = 'juan errique pinti 68';

/*muestra la cantidad de encargados asignados por bar*/
/*Funciones de agregacion*/
/*categoria 12*/
SELECT E.nombre, COUNT(*) AS CantEncargadosAsignadosXbar
FROM Encargado E JOIN Bar B 
ON E.dni = B.dni_encargado_B
GROUP BY E.nombre;

/*trae toda la tabla de bar y la ordena por direccion de manera descendente*/
/*Order by*/
/*categoria 13*/
SELECT *
FROM Bar B
ORDER BY B.direccion DESC;

/*trae titulo y album de canciones ordenadas por la duracion de manera ascendente*/
SELECT DISTINCT C.titulo,C.album, C.duracion
FROM Cancion C
ORDER BY duracion  ASC;
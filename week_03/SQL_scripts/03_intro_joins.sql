/* Al ver nuestro RD, sabemos que las editoriales y los títulos tienen una relación de uno a muchos. 
Unámoslos y obtengamos un recuento del número de títulos que ha publicado cada editorial. */
SELECT pub_name, title
FROM publishers
INNER JOIN titles
ON publishers.pub_id = titles.pub_id;

SELECT pub_name, COUNT(title_id) AS count_titles
FROM publishers
INNER JOIN titles
ON publishers.pub_id = titles.pub_id
GROUP BY pub_name;

SELECT pub_name, title
FROM publishers
INNER JOIN titles
ON publishers.pub_id = titles.pub_id
GROUP BY pub_name;


SELECT pub_name, COUNT(*) AS count_titles
FROM publishers
INNER JOIN titles
ON publishers.pub_id = titles.pub_id
GROUP BY pub_name;

/* Como hemos utilizado un INNER JOIN para esta consulta, sólo devuelve los resultados de las editoriales cuyo pub_id está en ambas tablas. 
¿Qué pasaría si quisiéramos que los resultados devolvieran los registros de todas las editoriales, independientemente de si han publicado algún título? 
Esto es exactamente lo que puede hacer un left join. 
Todo lo que tenemos que hacer es sustituir nuestro INNER JOIN por un LEFT JOIN y nos devolverá todos los registros de la tabla 
de editoriales y contará con cero registros para las que no tienen ningún título publicado.*/

SELECT pub_name, title
FROM publishers
LEFT JOIN titles
ON publishers.pub_id = titles.pub_id;

SELECT pub_name, COUNT(title_id) AS count_titles
FROM publishers
LEFT JOIN titles
ON publishers.pub_id = titles.pub_id
GROUP BY pub_name;


/* ¿Y si quisiéramos analizar cuántas unidades se han vendido de cada título? 
Podríamos declarar nuestra tabla de ventas en primer lugar, nuestra tabla de títulos en segundo lugar, 
y utilizar un RIGHT JOIN para garantizar que nuestra consulta
devuelva un registro para cada título (incluso los que no se vendieron). */


SELECT title, SUM(qty) AS vendidos
FROM sales
RIGHT JOIN titles
ON sales.title_id = titles.title_id
GROUP BY title;



SELECT title, SUM(qty) AS vendidos
FROM titles
LEFT JOIN sales
ON sales.title_id = titles.title_id
GROUP BY title;





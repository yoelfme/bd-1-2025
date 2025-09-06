SELECT name, composer
FROM track
WHERE name = 'Believe'  AND (composer IS null OR composer <> 'James Iha');

SELECT
    name AS nombre,
    composer,
    milliseconds / 1000 / 60 AS minutes,
    milliseconds
FROM track;

-- Obtiene todas las canciones donde el nombre contiene 'Of'
SELECT name
FROM track
-- WHERE lower(name) LIKE '%of%';
-- WHERE name LIKE '%of%' OR name LIKE '%Of%'
WHERE name ILIKE '%OF%';

-- Obtiene el nombre de todas las canciones que tardan entre 3 y 5 minutos
SELECT DISTINCT name, count(track_id)
FROM track
GROUP BY name
HAVING count(track_id) > 1;

SELECT
    name,
    milliseconds / 1000 / 60 minutes
FROM track
WHERE
    milliseconds / 1000 / 60 BETWEEN 3 AND 5
ORDER BY minutes DESC;

-- Obtener el top 10 de las canciones con mas duracion
-- Y que el nombre tenga la palabra of
SELECT name, milliseconds / 1000 / 60 minutes
FROM track
WHERE name ILIKE '%of%'
ORDER BY minutes DESC
LIMIT 10;

-- Obtener las canciones que duran entre 3 y 5 minutos,
-- ordenadas por duarcion
SELECT name,
       concat(milliseconds / 1000 / 60, ':', lpad((milliseconds / 1000 % 60)::text, 2, '0')) duration,
       milliseconds / 1000 / 60                                                              minutes,
       milliseconds / 1000 % 60                                                              seconds
FROM track
WHERE milliseconds / 1000 / 60 BETWEEN 3 AND 5
ORDER BY minutes DESC, seconds DESC;
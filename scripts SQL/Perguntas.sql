-- Em Qual circuito Lewis Hamilton teve mais vitórias?
SELECT 
    COUNT(nome), nome
FROM
    (SELECT 
        a.corrida_Id,
            a.piloto_Id,
            a.posição,
            b.circuito_id,
            d.nome,
            c.código
    FROM
        classificação_Pilotos AS a
    INNER JOIN corridas AS b, pilotos AS c, circuitos AS d
    WHERE
        posição LIKE 1
            AND a.corrida_Id LIKE b.race_Id
            AND c.código LIKE 'HAM'
            AND b.circuito_Id LIKE d.circuito_id) AS Bananinha
GROUP BY nome
ORDER BY COUNT(nome) DESC
LIMIT 10;
-- Quantidade de corredores brasileiros ao longo das historia e quantos pontos somaram ao longo de sua trajetória?
SELECT 
    concat(nome, sobrenome), nacionalidade
FROM
    pilotos
WHERE
    nacionalidade LIKE 'Brazilian';

SELECT 
    p.nome,p.sobrenome, p.nacionalidade, SUM(c.vitórias) AS soma
FROM
    pilotos AS p
        LEFT JOIN
    classificação_Pilotos AS c ON c.piloto_Id = p.piloto_Id
WHERE
    p.nacionalidade LIKE 'Bra%'
        AND c.vitórias > 0
GROUP BY p.piloto_Id
order by soma desc;

-- Qual construtora mais vitoriosa em pontos?
SELECT 
    c.constructor_Id, COUNT(c.pontos) AS soma_de_pontos, d.nome
FROM
    classificação_constructores AS c
        INNER JOIN
    construtores AS d ON c.constructor_Id = d.constructor_Id
GROUP BY c.constructor_Id
ORDER BY soma_de_pontos DESC
LIMIT 10;

-- Quantas corridas aconteceram na década de 80?

SELECT 
    ano, nome, datas
FROM
    corridas
WHERE
    ano >= 1980 AND ano < 1990
ORDER BY ano ASC;


-- Quantas corridas aconteceram na década de 90?

SELECT 
    ano, nome, datas
FROM
    corridas
WHERE
    ano >= 1990 AND ano < 2000
ORDER BY ano ASC;

-- Quantas corridas aconteceram na década de 2000?

SELECT 
    ano, nome, datas
FROM
    corridas
WHERE
    ano >= 2000 AND ano < 2010
ORDER BY ano ASC;

-- Quantos construtores tiveram pelo menos 5 vitorias em silverstone?
 
 With VI AS (
 SELECT
    count(constructor_id) AS contador, corrida_Id
 
 FROM
    classificação_constructores AS cl 
 
 WHERE cl.vitórias >= 5
 GROUP BY corrida_Id)
 SELECT 
  sum(contador) AS soma, ci.nome
 FROM 
 VI
 INNER JOIN corridas AS cor ON cor.race_Id = VI.corrida_Id
 INNER JOIN circuitos AS ci ON ci.circuito_Id= cor.circuito_Id
 GROUP BY ci.nome
 HAVING ci.nome = 'Silverstone Circuit';


-- Em quais circuitos Ayrton Senna teve mais vitórias?

SELECT * FROM pilotos;
SELECT 
    COUNT(nome), nome
FROM
    (SELECT 
        a.corrida_Id,
            a.piloto_Id,
            a.posição,
            b.circuito_Id,
            d.nome,
            c.código
    FROM
        classificação_Pilotos AS a
    INNER JOIN corridas AS b, pilotos AS c, circuitos AS d
    WHERE
        posição LIKE 1
            AND a.corrida_Id LIKE b.race_Id
            AND c.código LIKE 'SEN'
            AND b.circuito_Id LIKE d.circuito_Id) AS adelaide
GROUP BY nome
ORDER BY COUNT(nome) desc LIMIT 10;


-- Em quais circuitos os pilotos brasileiros tiveram mais vitórias?

SELECT * FROM pilotos;
SELECT 
    COUNT(nome), nome
FROM
    (SELECT 
        a.corrida_Id,
            a.piloto_Id,
            a.posição,
            b.circuito_Id,
            d.nome,
            c.código
    FROM
        classificação_Pilotos AS a
    INNER JOIN corridas AS b, pilotos AS c, circuitos AS d
    WHERE
        posição LIKE 1
            AND a.corrida_Id LIKE b.race_Id
            AND c.nacionalidade LIKE 'brazilian'
            AND b.circuito_Id LIKE d.circuito_Id) AS adelaide
GROUP BY nome
ORDER BY COUNT(nome) desc LIMIT 10;

-- Quantidade de corredores nascidos em cada década?

SELECT 
    COUNT(nascimento),
    CASE
        WHEN YEAR(nascimento) > 1990 THEN 'Década de 1990'
        WHEN YEAR(nascimento) > 1980 THEN 'Década de 1980'
        WHEN YEAR(nascimento) > 1970 THEN 'Década de 1970'
        WHEN YEAR(nascimento) > 1960 THEN 'Decada de 1960'
        WHEN YEAR(nascimento) > 1950 THEN 'Década de 1950'
        WHEN YEAR(nascimento) > 1940 THEN 'Década de 1940'
        WHEN YEAR(nascimento) > 1930 THEN 'Década de 1930'
        WHEN YEAR(nascimento) > 1920 THEN 'Década de 1920'
        WHEN YEAR(nascimento) > 1910 THEN 'Década de 1910'
        WHEN YEAR(nascimento) > 1900 THEN 'Década de 1900 - Inicío do Século'
        ELSE 'Nascidos no século passado'
    END AS decadas
FROM
    pilotos
GROUP BY decadas
ORDER BY decadas ASC;

-- Qual construtora conseguiu mais vice-campeonatos?

SELECT
con.nome, posição, count(con.nome) as vasco
From classificação_constructores as cl,
construtores as con
WHERE cl.constructor_Id = con.constructor_Id and posição =2
Group by cl.constructor_Id
Order by vasco DESC;

-- Quantidade de corridas por décadas?

SELECT 
    COUNT(datas),
    CASE
        WHEN YEAR(datas) between 2000 and 2010 then 'Década de 2000'
        WHEN YEAR(datas) between 1990 and 2000 then 'Década de 1990'
        WHEN YEAR(datas) between 1980 and 1990 then 'Década de 1980'
        WHEN YEAR(datas) between 1970 and 1980 then 'Década de 1970'
        ELSE "Outros"
    END AS decadas
FROM
    corridas
GROUP BY decadas
ORDER BY decadas ASC;
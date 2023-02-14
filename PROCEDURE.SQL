create table produtos(
  id serial PRIMARY KEY,
  Dia DATE NOT NULL,
  Barbie INT,
  Baby_Alive INT,
  Bratz INT,
  High_Monster INT
);

INSERT INTO produtos
(dia,Barbie,Baby_Alive,Bratz,High_Monster)
VALUES
('2023-02-01',10,15,30,40),
('2023-03-02',21,16,31,36),
('2023-04-03',13,27,32,42),
('2023-04-04',23,23,33,38),
('2023-05-05',24,34,39,44),
('2023-06-06',25,30,40,45),
('2023-02-07',55,36,41,46),
('2023-02-08',27,32,42,47),
('2023-04-09',28,32,43,48),
('2023-05-10',29,39,44,49);

CREATE or REPLACE PROCEDURE vendas_diarias(data_entrada DATE)
RETURNS TABLE produtos (id_dia INT, dia DATE, Barbie INT, Baby_Alive INT, Bratz INT, High_Monster INT) AS $$
BEGIN
  RETURN QUERY
  SELECT *
  FROM produtos
  WHERE produtos.dia = data_entrada;
END; $$
LANGUAGE plpgsql;

SELECT * FROM vendas_diarias('2023-01-05')
\\AO REPLICAR NO SQL ONLINE DEU ERRO NO RETURNS TABLE -NÃO CONSEGUI TER INFORMAÇÕES PRECISAS NO GOOGLE
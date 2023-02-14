CREATE TABLE clientes(
  id serial PRIMARY KEY,
  nome VARCHAR,
  sobrenome VARCHAR,
  data_cadastro DATE
);

INSERT INTO clientes
(nome, sobrenome, data_cadastro)
VALUES
('Amaro', 'de Souza','2023-02-07'),
( 'Amelia','Silva','2023-01-15'),
('Severina','Amaral','2023-02-07'),
('Giovanna', 'Martins','2023-02-07'),
('Ricardo ', 'Aparecido','2022-01-02'),
('Elaine', 'Ribeiro','2022-01-03'),
('Abigal', 'Souza','2022-01-03'),
('Antonio','Silva','2023-02-07'),
('Renato', 'Santos','2022-01-03'),
('Philipe', 'Furlan','2022-01-04'),
('Gabrielly', 'Carvalho','2023-02-07'),
('José Carlos', 'Terce','2023-02-07'),
('Juliana', 'Ribeiro','2022-01-05'),
('Rafaella', 'Cardoso','2023-02-07'),
('Rita de Cassia', 'Paranhos','2022-01-05');

CREATE OR REPLACE FUNCTION cadastros_por_dia (data_entrada date)
RETURNS INTEGER AS $$
DECLARE
  resultado INTEGER;
BEGIN
  SELECT 
    COUNT(*) INTO resultado
  FROM 
    clientes
  WHERE 
    data_cadastro = data_entrada;

  RETURN resultado;
END; $$
LANGUAGE plpgsql;

SELECT cadastros_por_dia('2023-02-07');
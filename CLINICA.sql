\\ CRIANDO 2 TABELAS PARA BD CLINICA MEDICA
CREATE DATABASE CLINICA

\\ USAR BD CLINICA MEDICA
USE DATABASE CLINICA

\\ CRIAR TABELA CONVENIO
CREATE TABLE convenio (
  id_convenio SERIAL PRIMARY KEY, 
  nome_convenio VARCHAR (50) NOT NULL,
  tipo_convenio VARCHAR (45)
  )
 \\ CRIAR TABELA PACIENTE
 CREATE TABLE paciente (
    id_paciente SERIAL PRIMARY KEY,
    nome_paciente VARCHAR (50) NOT NULL,
    convenio_id INT
 )
\\ ADICIONANDO FOREIGN KEY NA TABELA PACIENTE
ALTER TABLE paciente
ADD CONSTRAINT fk_convenio_id FOREIGN KEY (convenio_id) REFERENCES convenio(id_convenio);

\\ ADICIONANDO DADOS NA TABELA CONVENIO
INSERT INTO CONVENIO 
(nome_convenio, tipo_convenio)
VALUES
('Amil', 'Blue'),
('Notre Dame', 'Prata'),
('Bradesco', 'Gold'),
('Allianz', 'Platinum'),
('Amil', 'Yellow')

\\ VERIFICANDO INFORMAÇÕES
SELECT * FROM CONVENIO

\\ ADICIONANDO DADOS NA TABELA PACIENTE
INSERT INTO PACIENTE
(nome_paciente, convenio_id)
VALUES
('Robson', 1),
('Roberta', 2),
('Ayra', 3),
('Gabriella',4),
('Sergio', 5)

\\ VERIFICANDO INFORMAÇÕES
SELECT * FROM PACIENTE

\\ COMANDO DE JUNÇÃO DE TABELAS
select nome_convenio, nome_paciente from paciente
inner join convenio
on convenio.id_convenio = paciente.convenio_id;

select nome_convenio, nome_paciente from paciente
LEFT JOIN convenio
on convenio.id_convenio = paciente.convenio_id;

select nome_convenio, nome_paciente from paciente
RIGHT JOIN convenio
on convenio.id_convenio = paciente.convenio_id
UNION
select nome_convenio, nome_paciente from paciente
LEFT JOIN convenio
on convenio.id_convenio = paciente.convenio_id;


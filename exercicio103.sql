USE BD12022677;
SHOW TABLES;

Exercicios Banco de Dados - Enzo Carleti Teixeira

1 - Não tem como na puc

2 - CREATE TABLE funcionarios (id INT PRIMARY KEY, nome VARCHAR(100) NOT NULL, cargo VARCHAR(50) NOT NULL, salario DECIMAL(12,2));

INSERT INTO funcionarios (id, nome, cargo, salario) VALUES
("Ana", "Analista", "10020")
("Bruno", "Dev Jr", "2000");

3 - ALTER TABLE funcionarios
ADD COLUMN data_admissao DATE NOT NULL;

update funcionarios set data_admissao "2026-01-01";

4 - ALTER TABLE funcionarios
DROP COLUMN cargo;

5 - ALTER TABLE funcionarios
MODIFY COLUMN salario DECIMAL(12,2);

6 - CREATE TABLE departamentos (id INT PRIMARY KEY, nome VARCHAR(100) NOT NULL);
ALTER TABLE funcionarios
ADD FOREIGN KEY (departamento_id) REFERENCES departamentos (id);

7 - ALTER TABLE departamentos
CREATE COLUMN orcamento DECIMAL(12,2);

8 - ALTER TABLE departamentos
DROP COLUMN orcamento;

9 - ALTER TABLE departamentos
MODIFY COLUMN nome VARCHAR(150);

10 - ALTER TABLE departamentos
RENAME TO setores;

11 - DROP TABLE setores;

12 - ALTER TABLE funcionarios
ADD COLUMN status VARCHAR(20) DEFAULT "Ativo";

USE BD12022677;
SHOW TABLES;
CREATE TABLE funcionarios (id INT PRIMARY KEY, nome VARCHAR(100) NOT NULL, cargo VARCHAR(50) NOT NULL, salario DECIMAL(12,2));
SELECT * FROM funcionarios;

ALTER TABLE funcionarios
MODIFY COLUMN departamento_id INT;

CREATE TABLE departamentos (id INT PRIMARY KEY, nome VARCHAR(100) NOT NULL);
ALTER TABLE funcionarios
ADD FOREIGN KEY (departamento_id) REFERENCES departamentos (id);




ALTER TABLE departamentos
MODIFY COLUMN nome VARCHAR(150);

ALTER TABLE departamentos
RENAME TO setores;
USE BD12022674;
CREATE TABLE usuarios(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
sobrenome VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
numero_telefone INT NOT NULL,
senha_hash VARCHAR(50) NOT NULL,
nome_social VARCHAR(100) DEFAULT '',
novidades BOOLEAN DEFAULT false,
data_criacao DATE NOT NULL);

CREATE TABLE barbeiros(
id_barbeiro INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
sobrenome VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
numero_telefone VARCHAR(100) NOT NULL);

CREATE TABLE precos(
id_preco INT PRIMARY KEY AUTO_INCREMENT,
preco DECIMAL(10,2) NOT NULL,
tipo_corte VARCHAR(50));

CREATE TABLE agendamentos(
id_agendamento INT PRIMARY KEY AUTO_INCREMENT,
horario DATE NOT NULL,
id_usuario INT,
id_barbeiro INT,
id_preco INT,
CONSTRAINT fk_idUsuario
FOREIGN KEY agendamentos(id_usuario) REFERENCES usuarios(id),
CONSTRAINT fk_idBarbeiro
FOREIGN KEY agendamentos(id_barbeiro) REFERENCES barbeiros(id_barbeiro),
CONSTRAINT fk_idPreco
FOREIGN KEY agendamentos(id_preco) REFERENCES precos(id_preco)
);

SELECT * FROM barbeiros;

ALTER TABLE usuarios MODIFY COLUMN numero_telefone VARCHAR(11);

INSERT barbeiros(nome, sobrenome, email, numero_telefone) VALUES (
'Joses', 'Bedáni', 'josesbedani@gmail.com', '19997661697');
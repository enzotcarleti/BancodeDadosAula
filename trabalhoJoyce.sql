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

CREATE TABLE logs_auditoria (
    id_log INT PRIMARY KEY AUTO_INCREMENT,
    data_hora TIMESTAMP,
    id_usuario INT NOT NULL,
    acao VARCHAR(100),
    descricao TEXT,
    status_agendamento VARCHAR (10) DEFAULT 'Erro');

SELECT * FROM barbeiros;

ALTER TABLE usuarios MODIFY COLUMN numero_telefone VARCHAR(11);

INSERT barbeiros(nome, sobrenome, email, numero_telefone) VALUES (
'Joses', 'Bedáni', 'josesbedani@gmail.com', '19997661697');
INSERT barbeiros(nome, sobrenome, email, numero_telefone) VALUES (
'enzo', 'carleti', 'enzoup@gmail.com', '19967546789');
INSERT barbeiros(nome, sobrenome, email, numero_telefone) VALUES (
'eduardo', 'colmati', 'educp@gmail.com', '19982168348');

INSERT INTO usuarios(nome, sobrenome, email, numero_telefone, senha_hash, nome_social, novidades, data_criacao) VALUES
('João', 'Silva', 'joao.silva@gmail.com', '11987654321', 'hash123abc', 'João', true, '2026-01-15');
INSERT INTO usuarios(nome, sobrenome, email, numero_telefone, senha_hash, nome_social, novidades, data_criacao) VALUES
('Maria', 'Souza', 'maria.souza@gmail.com', '11912345678', 'hash456def', '', false, '2026-02-20');

INSERT INTO precos(preco, tipo_corte) VALUES (35.00, 'Corte Simples');
INSERT INTO precos(preco, tipo_corte) VALUES (55.00, 'Corte com Barba');

INSERT INTO agendamentos(horario, id_usuario, id_barbeiro, id_preco) VALUES ('2026-05-10', 1, 1, 1);
INSERT INTO agendamentos(horario, id_usuario, id_barbeiro, id_preco) VALUES ('2026-05-12', 2, 2, 2);

INSERT INTO logs_auditoria(data_hora, id_usuario, acao, descricao, status_agendamento) VALUES
(NOW(), 1, 'LOGIN', 'Usuário realizou login no sistema', 'OK');
INSERT INTO logs_auditoria(data_hora, id_usuario, acao, descricao, status_agendamento) VALUES
(NOW(), 2, 'AGENDAMENTO', 'Usuário criou um novo agendamento', 'OK');

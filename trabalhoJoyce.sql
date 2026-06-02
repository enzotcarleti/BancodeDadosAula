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
data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE barbeiros(
id_barbeiro INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
nome_social VARCHAR(100),
chave_pix VARCHAR(100) NOT NULL,
sobrenome VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
lgbd boolean DEFAULT FALSE,
data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
numero_telefone VARCHAR(100) NOT NULL);

CREATE TABLE precos(
id_preco INT PRIMARY KEY AUTO_INCREMENT,
preco DECIMAL(10,2) NOT NULL,
tipo_corte VARCHAR(50));

CREATE TABLE agendamentos(
id_agendamento INT PRIMARY KEY AUTO_INCREMENT,
horario TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
id_usuario INT,
id_barbeiro INT,
id_preco INT,
CONSTRAINT fk_idUsuario
FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
CONSTRAINT fk_idBarbeiro
FOREIGN KEY (id_barbeiro) REFERENCES barbeiros(id_barbeiro),
CONSTRAINT fk_idPreco
FOREIGN KEY (id_preco) REFERENCES precos(id_preco)
);

CREATE TABLE pagamentos (
id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
id_agendamento INT NOT NULL,
valor_pago DECIMAL(10,2) NOT NULL,
metodo_pagamento VARCHAR(50) NOT NULL,
status_pagamento VARCHAR(20) DEFAULT 'Pendente',
data_pagamento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT fk_idAgendamento
FOREIGN KEY (id_agendamento) REFERENCES agendamentos(id_agendamento));

CREATE TABLE logs_auditoria (
    id_log INT PRIMARY KEY AUTO_INCREMENT,
    data_hora TIMESTAMP,
    id_usuario INT NOT NULL,
    acao VARCHAR(100),
    descricao TEXT,
    status_agendamento VARCHAR(10) DEFAULT 'Erro',
    CONSTRAINT fk_idusuario
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

ALTER TABLE usuarios MODIFY COLUMN numero_telefone VARCHAR(11);

INSERT INTO barbeiros(nome, sobrenome, email, numero_telefone, chave_pix) VALUES
('Joses',   'Bedáni',  'josesbedani@gmail.com',    '19997661697', '19997661697'),
('Enzo',    'Carleti', 'enzoup@gmail.com',          '19967546789', '19967546789'),
('Eduardo', 'Colmati', 'educp@gmail.com',           '19982168348', '19982168348'),
('Lucas',   'Ferreira','lucas.ferreira@gmail.com', '11954321678', '11954321678'),
('Rafael',  'Mendes',  'rafael.mendes@gmail.com',  '21987654321', '21987654321'),
('Pedro',   'Almeida', 'pedro.almeida@gmail.com',  '31976543210', ''31976543210');

INSERT INTO usuarios(nome, sobrenome, email, numero_telefone, senha_hash, nome_social, novidades, data_criacao) VALUES
('Carlos', 'Oliveira', 'carlos.oliveira@gmail.com', '21998765432', 'hash789ghi', '', true, '2026-03-05'),
('Ana', 'Lima', 'ana.lima@hotmail.com', '31987654321', 'hash321jkl', 'Aninha', true, '2026-03-12'),
('Bruno', 'Costa', 'bruno.costa@gmail.com', '41976543210', 'hash654mno', '', false, '2026-04-01'),
('Fernanda', 'Rocha', 'fernanda.rocha@gmail.com', '51965432109', 'hash987pqr', 'Fê', true, '2026-04-18'),
('Gabriel', 'Martins', 'gabriel.martins@yahoo.com', '61954321098', 'hash147stu', '', false, '2026-05-02');
INSERT INTO usuarios(nome, sobrenome, email, numero_telefone, senha_hash, nome_social, novidades, data_criacao) VALUES
('Marcio', 'Silva', 'marcio.silva@gmail.com', '11987654321', 'hash123abc', 'Marcio', true, '2026-01-15');
INSERT INTO usuarios(nome, sobrenome, email, numero_telefone, senha_hash, nome_social, novidades, data_criacao) VALUES
('Maria', 'Souza', 'maria.souza@gmail.com', '11912345678', 'hash456def', '', false, '2026-02-20');

INSERT INTO precos(preco, tipo_corte) VALUES (35.00, 'Corte Simples');
INSERT INTO precos(preco, tipo_corte) VALUES (55.00, 'Corte com Barba');
INSERT INTO precos(preco, tipo_corte) VALUES (40.00, 'Corte com sobrancelha');
INSERT INTO precos(preco, tipo_corte) VALUES (30.00, 'Barba Completa');

INSERT INTO agendamentos(horario, id_usuario, id_barbeiro, id_preco) VALUES ('2026-05-10', 1, 1, 1);
INSERT INTO agendamentos(horario, id_usuario, id_barbeiro, id_preco) VALUES ('2026-05-12', 2, 2, 2);
INSERT INTO agendamentos(horario, id_usuario, id_barbeiro, id_preco) VALUES
('2026-05-14 09:00:00', 3, 1, 3),
('2026-05-15 10:30:00', 4, 3, 2),
('2026-05-16 14:00:00', 5, 2, 2),
('2026-05-17 11:00:00', 1, 4, 4),
('2026-05-18 15:30:00', 6, 5, 1),
('2026-05-19 08:00:00', 2, 1, 1),
('2026-05-20 13:00:00', 3, 3, 4);

INSERT INTO pagamentos(id_agendamento, valor_pago, metodo_pagamento, status_pagamento, data_pagamento) VALUES
(1, 35.00, 'PIX', 'Pago', '2026-05-10 10:05:00'),
(2, 55.00, 'Cartão de Crédito', 'Pago', '2026-05-12 11:20:00'),
(3, 40.00, 'Dinheiro', 'Pago', '2026-05-14 09:45:00'),
(4, 55.00, 'PIX', 'Pago', '2026-05-15 11:00:00'),
(5, 45.00, 'Cartão de Débito', 'Pendente', '2026-05-16 14:30:00'),
(6, 35.00, 'PIX', 'Pago', '2026-05-17 11:15:00'),
(7, 60.00, 'Dinheiro', 'Cancelado', '2026-05-18 16:00:00'),
(8, 35.00, 'Cartão de Crédito', 'Pago', '2026-05-19 08:10:00');

INSERT INTO logs_auditoria(data_hora, id_usuario, acao, descricao, status_agendamento) VALUES
(NOW(), 1, 'LOGIN', 'Usuário realizou login no sistema', 'OK');
INSERT INTO logs_auditoria(data_hora, id_usuario, acao, descricao, status_agendamento) VALUES
(NOW(), 2, 'AGENDAMENTO', 'Usuário criou um novo agendamento', 'OK');
INSERT INTO logs_auditoria(data_hora, id_usuario, acao, descricao, status_agendamento) VALUES
(NOW(), 3, 'CADASTRO', 'Novo usuário realizou cadastro no sistema', 'OK'),
(NOW(), 4, 'LOGIN', 'Usuário realizou login no sistema', 'OK'),
(NOW(), 5, 'AGENDAMENTO', 'Usuário criou um novo agendamento', 'OK'),
(NOW(), 1, 'CANCELAMENTO', 'Usuário cancelou agendamento existente', 'Erro'),
(NOW(), 6, 'PAGAMENTO', 'Pagamento registrado com sucesso', 'OK'),
(NOW(), 2, 'LOGOUT', 'Usuário encerrou sessão', 'OK'),
(NOW(), 3, 'AGENDAMENTO', 'Usuário remarcou horário', 'OK');

SELECT 
    SUM(valor_pago) AS 'Faturamento Total Acumulado (R$)',
    COUNT(id_pagamento) AS 'Total de Serviços Pagos'
FROM pagamentos
WHERE status_pagamento = 'Pago';

SELECT 
    DATE_FORMAT(a.horario, '%d/%m/%Y') AS 'Data do Agendamento',
    IF(u.nome_social != '', u.nome_social, u.nome) AS 'Cliente',
    u.numero_telefone AS 'Telefone Cliente',
    b.nome AS 'Barbeiro',
    p.tipo_corte AS 'Serviço Escolhido',
    p.preco AS 'Valor (R$)'
FROM agendamentos a
JOIN usuarios u ON a.id_usuario = u.id
JOIN barbeiros b ON a.id_barbeiro = b.id_barbeiro
JOIN precos p ON a.id_preco = p.id_preco
ORDER BY a.horario ASC;

SELECT 
    id AS 'ID',
    IF(nome_social != '', nome_social, nome) AS 'Nome/Nome Social',
    CONCAT(nome, ' ', sobrenome) AS 'Nome Completo',
    email AS 'E-mail',
    numero_telefone AS 'WhatsApp/Telefone',
    IF(novidades, 'Sim', 'Não') AS 'Recebe Marketing?',
    DATE_FORMAT(data_criacao, '%d/%m/%Y') AS 'Data de Cadastro'
FROM usuarios
ORDER BY nome ASC;

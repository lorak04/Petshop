-- Alterando a tabela Estoque para incluir um indice (index)
ALTER TABLE Estoque 
	ADD INDEX idx_nome_produto (nome_produto);
-- Alterando a tabela Clientes para incluir um indice 
ALTER TABLE Clientes
	ADD INDEX idx_nome_cliente (nome_cliente);
-- Alterando a tabele Funcionarios para incluir um indice
ALTER TABLE Funcionarios 
	ADD INDEX idx_nome_funcionario (nome_funcionario);
-- Alterando a tabela Serviços para incluir um indice 
ALTER TABLE Servicos
	ADD INDEX idx_nome_servico (nome_servico);
    
    
-- Alterando a tabela Vendas para adicionar as FKs
ALTER TABLE Vendas
	ADD INDEX idx_id_cliente (id_cliente), -- Indice para a FK
	ADD INDEX idx_id_funcionario (id_funcionario), -- Indice para a FK
	ADD CONSTRAINT fk_vendas_cliente FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
	ADD CONSTRAINT Fk_vendas_funcionario FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario);
    
    
-- Alterando a tabela Agendamentos para adicionar as FKs
ALTER TABLE Agendamento
	ADD COLUMN id_cliente INT, -- FK para a tabela Clientes
	ADD COLUMN id_servico INT, -- FK para a tabela Servicos
	ADD COLUMN id_funcionario INT, -- FK para a tabela Funcionarios
	ADD INDEX idx_id_cliente_agendamento (id_cliente), -- Indice para a FK
	ADD INDEX idx_id_servico (id_servico), -- Indice para a FK
	ADD INDEX idx_id_funcionario_agendamento (id_funcionario), -- Indice para a FK
	ADD CONSTRAINT fk_agendamento_cliente FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
	ADD CONSTRAINT fk_agendamento_servico FOREIGN KEY (id_servico) REFERENCES Servicos(id_servico),
	ADD CONSTRAINT fk_agendamento_funcionario FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario);
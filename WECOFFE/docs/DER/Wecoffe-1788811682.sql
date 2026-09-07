CREATE TABLE IF NOT EXISTS `Cliente` (
	`id_cliente` int NOT NULL,
	`nome` varchar(255) NOT NULL,
	`cpf_cnpj` varchar(255) NOT NULL,
	PRIMARY KEY (`id_cliente`)
);
CREATE TABLE IF NOT EXISTS `Funcionario` (
	`id_funcionario` int NOT NULL,
	`nome` varchar(255) NOT NULL,
	`cargo` varchar(255) NOT NULL,
	PRIMARY KEY (`id_funcionario`)
);
CREATE TABLE IF NOT EXISTS `Totem` (
	`id_totem` int NOT NULL,
	`identificador_tablet` varchar(255) NOT NULL,
	`localizacao_loja` varchar(255) NOT NULL,
	`status` varchar(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS `Pedido` (
	`id_pedido` int NOT NULL,
	`id_cliente` int NOT NULL,
	`id_funcionario` int NOT NULL,
	`id_totem` int NOT NULL,
	`data_hora` time NOT NULL,
	`status_preparo` varchar(255) NOT NULL,
	`valor_total` decimal(10,0) NOT NULL,
	`canal_pedido` varchar(255) NOT NULL,
	PRIMARY KEY (`id_pedido`)
);
CREATE TABLE IF NOT EXISTS `Item_pedido` (
	`id_item` int NOT NULL,
	`id_pedido` int NOT NULL,
	`id_produto` int NOT NULL,
	`preco_unitario` decimal(10,0) NOT NULL,
	PRIMARY KEY (`id_item`)
);
CREATE TABLE IF NOT EXISTS `Produto` (
	`id_produto` int NOT NULL,
	`nome` varchar(255) NOT NULL,
	`preco` decimal(10,0) NOT NULL,
	PRIMARY KEY (`id_produto`)
);
CREATE TABLE IF NOT EXISTS `Pagamamento` (
	`id_pagamento` int NOT NULL,
	`id_pedido` int NOT NULL,
	`forma_pagamento` varchar(255) NOT NULL,
	`valor_pagamento` decimal(10,0) NOT NULL,
	`status_pagamento` varchar(255) NOT NULL,
	`data_hora_pagamento` datetime NOT NULL,
	PRIMARY KEY (`id_pagamento`)
);
CREATE TABLE IF NOT EXISTS `Estoque` (
	`id_estoque` int NOT NULL,
	`id_produto` int NOT NULL,
	`quatidade` int NOT NULL,
	`data_atualizacao` datetime NOT NULL,
	PRIMARY KEY (`id_estoque`)
);
CREATE TABLE IF NOT EXISTS `Fornecedor` (
	`Id_Fornecedor` int NOT NULL,
	`nome` varchar(255) NOT NULL,
	PRIMARY KEY (`Id_Fornecedor`)
);
CREATE TABLE IF NOT EXISTS `Estrada_Estoque` (
	`id_entrada` int NOT NULL,
	`id_Fornecedor` int NOT NULL,
	`data_entrada` date NOT NULL,
	PRIMARY KEY (`id_entrada`)
);
CREATE TABLE IF NOT EXISTS `Item_Entrada` (
	`id_item_entrada` int NOT NULL,
	`id_entrada` int NOT NULL,
	`id_produto` int NOT NULL,
	`data_entrada` date NOT NULL,
	PRIMARY KEY (`id_item_entrada`)
);
ALTER TABLE `Pedido` ADD CONSTRAINT `Pedido_fk1` FOREIGN KEY (`id_cliente`) REFERENCES `Cliente`(`id_cliente`);
ALTER TABLE `Pedido` ADD CONSTRAINT `Pedido_fk3` FOREIGN KEY (`id_totem`) REFERENCES `Totem`(`id_totem`);
ALTER TABLE `Item_pedido` ADD CONSTRAINT `Item_pedido_fk1` FOREIGN KEY (`id_pedido`) REFERENCES `Pedido`(`id_pedido`);
ALTER TABLE `Item_pedido` ADD CONSTRAINT `Item_pedido_fk2` FOREIGN KEY (`id_produto`) REFERENCES `Produto`(`id_produto`);
ALTER TABLE `Pagamamento` ADD CONSTRAINT `Pagamamento_fk1` FOREIGN KEY (`id_pedido`) REFERENCES `Pedido`(`id_pedido`);
ALTER TABLE `Estoque` ADD CONSTRAINT `Estoque_fk1` FOREIGN KEY (`id_produto`) REFERENCES `Produto`(`id_produto`);
ALTER TABLE `Estrada_Estoque` ADD CONSTRAINT `Estrada_Estoque_fk1` FOREIGN KEY (`id_Fornecedor`) REFERENCES `Fornecedor`(`Id_Fornecedor`);
ALTER TABLE `Item_Entrada` ADD CONSTRAINT `Item_Entrada_fk1` FOREIGN KEY (`id_entrada`) REFERENCES `Produto`(`id_produto`);
ALTER TABLE `Item_Entrada` ADD CONSTRAINT `Item_Entrada_fk2` FOREIGN KEY (`id_produto`) REFERENCES `Produto`(`id_produto`);
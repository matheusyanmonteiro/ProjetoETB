-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Tempo de geração: 24/11/2016 às 08:27
-- Versão do servidor: 10.1.10-MariaDB
-- Versão do PHP: 5.5.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `tccsal`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `buffet`
--

CREATE TABLE `buffet` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `preco` double DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `quantidadeComida` int(11) DEFAULT NULL,
  `quantidadeBebida` int(11) DEFAULT NULL,
  `tamanhoBolo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `buffet`
--

INSERT INTO `buffet` (`id`, `nome`, `preco`, `tipo`, `quantidadeComida`, `quantidadeBebida`, `tamanhoBolo`) VALUES
(1, '123', 123, '123', 123, 123, 123);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `rg` varchar(15) DEFAULT NULL,
  `dataDeNascimento` varchar(15) DEFAULT NULL,
  `cpf` varchar(15) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `cep` varchar(15) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `telefoneEmergencial` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `rg`, `dataDeNascimento`, `cpf`, `endereco`, `cep`, `telefone`, `email`, `telefoneEmergencial`) VALUES
(2, 'marcos', '3367546', '2017-04-30', '043', 'QNE 21 CASA 26', '72125210', '6136352224', 'felipepampalona@gmail.com', '+556136352224');

-- --------------------------------------------------------

--
-- Estrutura para tabela `eventos`
--

CREATE TABLE `eventos` (
  `id` int(11) NOT NULL,
  `buffet_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `salao_id` int(11) NOT NULL,
  `tema` varchar(100) DEFAULT NULL,
  `quantidadeDeConvidados` int(11) DEFAULT NULL,
  `horario` varchar(45) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  `valor` double DEFAULT NULL,
  `situacao` varchar(100) DEFAULT NULL,
  `data` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `eventos`
--

INSERT INTO `eventos` (`id`, `buffet_id`, `cliente_id`, `salao_id`, `tema`, `quantidadeDeConvidados`, `horario`, `usuario_id`, `valor`, `situacao`, `data`) VALUES
(1, 1, 2, 1, '1211111', 50, '123', 1, 13, 'agendado', '132'),
(2, 1, 2, 1, '21', 12, '12', 1, 21, 'cancelado', '12'),
(6, 1, 2, 1, '12', 50, '12:00', 1, 12, 'agendado', '2018-10-30');

-- --------------------------------------------------------

--
-- Estrutura para tabela `evento_item`
--

CREATE TABLE `evento_item` (
  `eventos_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `gastos`
--

CREATE TABLE `gastos` (
  `id` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  `valor` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `gastos`
--

INSERT INTO `gastos` (`id`, `descricao`, `usuario_id`, `valor`) VALUES
(1, '1010', 1, 12),
(3, '1010', 1, 12);

-- --------------------------------------------------------

--
-- Estrutura para tabela `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `valorAluguel` double DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `item`
--

INSERT INTO `item` (`id`, `valorAluguel`, `nome`) VALUES
(1, 12, 'cok');

-- --------------------------------------------------------

--
-- Estrutura para tabela `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  `icone` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `menu`
--

INSERT INTO `menu` (`id`, `titulo`, `link`, `icone`) VALUES
(1, 'USUARIOS', 'listar_usuario.jsp', 'imagens/usuario.png'),
(2, 'MENUS', 'listar_menu.jsp', 'imagens/menu.png'),
(5, 'CLIENTES', 'listar_cliente.jsp', 'imagens/cliente.png'),
(6, 'EVENTOS', 'listar_eventos.jsp', 'imagens/evento.png'),
(7, 'GASTOS', 'listar_gastos.jsp', 'imagens/gastos.png'),
(8, 'ITENS', 'listar_itens.jsp', 'imagens/item.png'),
(9, 'LOCAIS', 'listar_salao.jsp', 'imagens/local.png'),
(10, 'PAGAMENTOS', 'listar_pagamento.jsp', 'imagens/pagamento.png'),
(11, 'PERFIS', 'listar_perfil.jsp', 'imagens/perfil.png'),
(13, 'RELATORIOS', 'listar_relatorio.jsp', 'imagens/relatorio.png'),
(14, 'BUFFET', 'listar_buffet.jsp', 'imagens/buffet.png');

-- --------------------------------------------------------

--
-- Estrutura para tabela `menu_perfil`
--

CREATE TABLE `menu_perfil` (
  `perfil_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `menu_perfil`
--

INSERT INTO `menu_perfil` (`perfil_id`, `menu_id`) VALUES
(1, 1),
(1, 2),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 13),
(1, 14);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `id` int(11) NOT NULL,
  `desconto` double DEFAULT NULL,
  `quantidadeParcela` int(11) DEFAULT NULL,
  `divisao` int(11) DEFAULT NULL,
  `eventos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `pagamento`
--

INSERT INTO `pagamento` (`id`, `desconto`, `quantidadeParcela`, `divisao`, `eventos_id`) VALUES
(7, 4, 10, 10, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `perfil`
--

CREATE TABLE `perfil` (
  `id` int(11) NOT NULL,
  `perfil` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `perfil`
--

INSERT INTO `perfil` (`id`, `perfil`) VALUES
(1, 'adm'),
(2, 'atendente');

-- --------------------------------------------------------

--
-- Estrutura para tabela `salao`
--

CREATE TABLE `salao` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `valorAluguel` double DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `salao`
--

INSERT INTO `salao` (`id`, `nome`, `valorAluguel`, `endereco`) VALUES
(1, '121', 121, '121');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  `telefone` varchar(12) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `cpf` varchar(15) DEFAULT NULL,
  `salario` double DEFAULT NULL,
  `rg` varchar(15) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `cep` varchar(15) DEFAULT NULL,
  `dataDeNascimento` varchar(15) DEFAULT NULL,
  `carteiraDeTrabalho` int(11) DEFAULT NULL,
  `perfil_id` int(11) NOT NULL,
  `login` varchar(45) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `idade`, `telefone`, `email`, `cpf`, `salario`, `rg`, `endereco`, `cep`, `dataDeNascimento`, `carteiraDeTrabalho`, `perfil_id`, `login`, `senha`) VALUES
(1, '123', 123, '123', '123', '123', 123, '123', '123', '123', '123', 123, 1, '123', '123'),
(3, 'Admin', 18, '6136352224', 'felipepampalona@gmail.com', '043.886.521-99', 1500, '3367546', 'QNE 21 CASA 26', '72125210', '2014-10-30', 4444444, 1, 'marco1', '123');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `buffet`
--
ALTER TABLE `buffet`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_eventos_buffet1_idx` (`buffet_id`),
  ADD KEY `fk_eventos_cliente1_idx` (`cliente_id`),
  ADD KEY `fk_eventos_salao1_idx` (`salao_id`),
  ADD KEY `fk_eventos_usuario1_idx` (`usuario_id`);

--
-- Índices de tabela `evento_item`
--
ALTER TABLE `evento_item`
  ADD PRIMARY KEY (`eventos_id`,`item_id`),
  ADD KEY `fk_eventos_has_item_item1_idx` (`item_id`),
  ADD KEY `fk_eventos_has_item_eventos1_idx` (`eventos_id`);

--
-- Índices de tabela `gastos`
--
ALTER TABLE `gastos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_gastos_usuario1_idx` (`usuario_id`);

--
-- Índices de tabela `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `menu_perfil`
--
ALTER TABLE `menu_perfil`
  ADD PRIMARY KEY (`perfil_id`,`menu_id`),
  ADD KEY `fk_perfil_has_menu_menu1_idx` (`menu_id`),
  ADD KEY `fk_perfil_has_menu_perfil_idx` (`perfil_id`);

--
-- Índices de tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pagamento_eventos1_idx` (`eventos_id`);

--
-- Índices de tabela `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `salao`
--
ALTER TABLE `salao`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuario_perfil1_idx` (`perfil_id`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `buffet`
--
ALTER TABLE `buffet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de tabela `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de tabela `gastos`
--
ALTER TABLE `gastos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de tabela `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de tabela `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de tabela `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de tabela `salao`
--
ALTER TABLE `salao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `fk_eventos_buffet1` FOREIGN KEY (`buffet_id`) REFERENCES `buffet` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_eventos_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_eventos_salao1` FOREIGN KEY (`salao_id`) REFERENCES `salao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_eventos_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `evento_item`
--
ALTER TABLE `evento_item`
  ADD CONSTRAINT `fk_eventos_has_item_eventos1` FOREIGN KEY (`eventos_id`) REFERENCES `eventos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_eventos_has_item_item1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `gastos`
--
ALTER TABLE `gastos`
  ADD CONSTRAINT `fk_gastos_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `menu_perfil`
--
ALTER TABLE `menu_perfil`
  ADD CONSTRAINT `fk_perfil_has_menu_menu1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_perfil_has_menu_perfil` FOREIGN KEY (`perfil_id`) REFERENCES `perfil` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `fk_pagamento_eventos1` FOREIGN KEY (`eventos_id`) REFERENCES `eventos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_perfil1` FOREIGN KEY (`perfil_id`) REFERENCES `perfil` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

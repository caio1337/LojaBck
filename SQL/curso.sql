-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18-Mar-2021 às 22:54
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `curso`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `categoria_id` int(11) NOT NULL,
  `categoria_pai_id` int(11) DEFAULT NULL,
  `categoria_nome` varchar(45) NOT NULL,
  `categoria_ativa` tinyint(1) DEFAULT NULL,
  `categoria_meta_link` varchar(100) DEFAULT NULL,
  `categoria_data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `categoria_data_alteracao` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`categoria_id`, `categoria_pai_id`, `categoria_nome`, `categoria_ativa`, `categoria_meta_link`, `categoria_data_criacao`, `categoria_data_alteracao`) VALUES
(7, 5, 'teste', 1, 'teste', '2021-02-06 14:38:17', '2021-02-16 17:47:01');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias_pai`
--

CREATE TABLE `categorias_pai` (
  `categoria_pai_id` int(11) NOT NULL,
  `categoria_pai_nome` varchar(45) NOT NULL,
  `categoria_pai_ativa` tinyint(1) DEFAULT NULL,
  `categoria_pai_meta_link` varchar(100) DEFAULT NULL,
  `categoria_pai_data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `categoria_pai_data_alteracao` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categorias_pai`
--

INSERT INTO `categorias_pai` (`categoria_pai_id`, `categoria_pai_nome`, `categoria_pai_ativa`, `categoria_pai_meta_link`, `categoria_pai_data_criacao`, `categoria_pai_data_alteracao`) VALUES
(5, 'genericos', 1, 'genericos', '2021-02-06 13:54:06', '2021-02-06 13:54:06'),
(6, 'teste2', 1, 'teste2', '2021-02-08 20:12:21', '2021-02-08 20:12:21');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `cliente_id` int(11) NOT NULL,
  `cliente_data_cadastro` timestamp NULL DEFAULT current_timestamp(),
  `cliente_nome` varchar(45) NOT NULL,
  `cliente_sobrenome` varchar(150) NOT NULL,
  `cliente_data_nascimento` date DEFAULT NULL,
  `cliente_cpf` varchar(20) NOT NULL,
  `cliente_email` varchar(150) NOT NULL,
  `cliente_telefone_fixo` varchar(20) DEFAULT NULL,
  `cliente_telefone_movel` varchar(20) NOT NULL,
  `cliente_cep` varchar(10) NOT NULL,
  `cliente_endereco` varchar(155) NOT NULL,
  `cliente_numero_endereco` varchar(20) DEFAULT NULL,
  `cliente_bairro` varchar(45) NOT NULL,
  `cliente_cidade` varchar(105) NOT NULL,
  `cliente_estado` varchar(2) NOT NULL,
  `cliente_complemento` varchar(145) DEFAULT NULL,
  `cliente_data_alteracao` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`cliente_id`, `cliente_data_cadastro`, `cliente_nome`, `cliente_sobrenome`, `cliente_data_nascimento`, `cliente_cpf`, `cliente_email`, `cliente_telefone_fixo`, `cliente_telefone_movel`, `cliente_cep`, `cliente_endereco`, `cliente_numero_endereco`, `cliente_bairro`, `cliente_cidade`, `cliente_estado`, `cliente_complemento`, `cliente_data_alteracao`) VALUES
(1, '2021-03-02 19:49:46', 'Caio', 'Alves', '2021-03-17', '553.130.830-23', 'caioalves201717@gmail.com', '(11) 1111-1111', '(31) 99134-2504', '31515-040', 'Rua Emanuel Marzano Matias', '178', 'São João Batista', 'Belo Horizonte', 'MG', 'BL 12 AP 402', '2021-03-02 19:49:46'),
(3, '2021-03-07 19:39:07', 'Teste', 'compra', '2021-03-31', '459.755.220-05', 'email12345567@gmail.com', NULL, '(31) 99111-1111', '80540-000', 'Rua Alberto Folloni', '12', 'Ahú', 'Curitiba', 'PR', NULL, '2021-03-07 19:39:07'),
(5, '2021-03-07 19:49:54', 'Cliente', 'Teste', '2021-03-09', '466.200.590-66', 'email@gmail.com', NULL, '(31) 97314-7539', '31515-040', 'Rua Emanuel Marzano Matias', '178', 'Venda Nova', 'Belo Horizonte', 'MG', NULL, '2021-03-07 19:49:54'),
(6, '2021-03-11 02:28:43', 'Pedro', 'Silva', '2015-05-20', '483.073.120-60', 'pedro@gmail.com', NULL, '(31) 92222-2222', '80540-000', 'Rua Alberto Folloni', '12', 'Ahú', 'Curitiba', 'PR', NULL, '2021-03-11 02:28:43'),
(7, '2021-03-11 02:31:53', 'Pedro', 'Silva', '2014-05-23', '987.155.080-48', 'pedro1@gmail.com', NULL, '(31) 93333-3333', '80540-000', 'Rua Alberto Folloni', '12', 'Ahú', 'Curitiba', 'PR', NULL, '2021-03-11 02:31:53'),
(8, '2021-03-11 02:34:52', 'Lucas', 'Silva', '2016-05-10', '650.126.490-10', 'lucas@gmail.com', NULL, '(31) 94444-4444', '31515-040', 'Rua Emanuel Marzano Matias', '12', 'Venda Nova', 'Belo Horizonte', 'MG', NULL, '2021-03-11 02:34:52'),
(9, '2021-03-11 02:40:07', 'teste', 'fdsfds', '2021-03-19', '741.797.840-17', 'teste21@gmail.com', NULL, '(11) 11111-1111', '31515-040', 'Rua Emanuel Marzano Matias', '123', 'Venda Nova', 'Belo Horizonte', 'MG', NULL, '2021-03-11 02:40:07'),
(10, '2021-03-13 16:28:12', 'Maria', 'Souza', '2021-04-01', '908.349.470-56', 'maria@gmail.com', NULL, '(31) 66666-6666', '80540-000', 'Rua Alberto Folloni', '1234', 'Ahú', 'Curitiba', 'PR', NULL, '2021-03-13 16:28:12'),
(11, '2021-03-13 16:31:58', 'Cliente', 'Souza', '2016-05-08', '455.851.130-20', 'souza@gmail.com', NULL, '(31) 99999-9999', '31515-040', 'Rua Emanuel Marzano Matias', '123', 'Venda Nova', 'Belo Horizonte', 'MG', NULL, '2021-03-13 16:31:58'),
(15, '2021-03-13 22:29:24', 'Fabio', 'Lucas', '2016-10-11', '362.475.620-63', 'fabio@gmail.com', NULL, '(31) 14444-4444', '31515-040', 'Rua Emanuel Marzano Matias', '15', 'Venda Nova', 'Belo Horizonte', 'MG', NULL, '2021-03-13 22:29:24'),
(16, '2021-03-16 17:37:40', 'Maria', 'Souza', '2016-05-16', '862.274.080-34', 'mariasouza@gmail.com', NULL, '(12) 11111-1111', '31515-040', 'Rua Emanuel Marzano Matias', '12', 'Venda Nova', 'Belo Horizonte', 'MG', NULL, '2021-03-16 17:37:40'),
(17, '2021-03-16 18:11:53', 'Ana', 'Maria', '2016-05-18', '023.651.340-09', 'anamaria@gmail.com', NULL, '(31) 11111-1154', '31515-040', 'Rua Emanuel Marzano Matias', '78', 'Venda Nova', 'Belo Horizonte', 'MG', NULL, '2021-03-16 18:11:53'),
(18, '2021-03-16 18:16:39', 'Lucas', 'Sil', '2019-01-07', '667.312.540-37', 'lucassil@gmail.com', NULL, '(32) 21111-1111', '31515-040', 'Rua Emanuel Marzano Matias', '89', 'Venda Nova', 'Belo Horizonte', 'MG', NULL, '2021-03-16 18:16:39'),
(19, '2021-03-16 19:01:19', 'Raniel', 'Elmo', '2018-10-16', '854.730.890-38', 'raniel@gmail.com', NULL, '(24) 11111-1111', '31515-040', 'Rua Emanuel Marzano Matias', '99', 'Venda Nova', 'Belo Horizonte', 'MG', NULL, '2021-03-16 19:01:19'),
(23, '2021-03-16 19:37:21', 'Debito', 'Conta', '2021-03-19', '510.802.660-97', 'debito@gmail.com', NULL, '(33) 11111-1111', '31515-040', 'Rua Emanuel Marzano Matias', '11', 'Venda Nova', 'Belo Horizonte', 'MG', NULL, '2021-03-16 19:37:21');

-- --------------------------------------------------------

--
-- Estrutura da tabela `config_correios`
--

CREATE TABLE `config_correios` (
  `config_id` int(11) NOT NULL,
  `config_cep_origem` varchar(20) NOT NULL,
  `config_codigo_pac` varchar(10) NOT NULL,
  `config_codigo_sedex` varchar(10) NOT NULL,
  `config_somar_frete` decimal(10,2) NOT NULL,
  `config_valor_declarado` decimal(5,2) NOT NULL,
  `config_data_alteracao` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `config_correios`
--

INSERT INTO `config_correios` (`config_id`, `config_cep_origem`, `config_codigo_pac`, `config_codigo_sedex`, `config_somar_frete`, `config_valor_declarado`, `config_data_alteracao`) VALUES
(1, '80530-000', '04510', '04014', '3.50', '21.00', '2021-02-17 04:10:14');

-- --------------------------------------------------------

--
-- Estrutura da tabela `config_pagseguro`
--

CREATE TABLE `config_pagseguro` (
  `config_id` int(11) NOT NULL,
  `config_email` varchar(255) NOT NULL,
  `config_token` varchar(100) NOT NULL,
  `config_ambiente` tinyint(1) NOT NULL COMMENT '0 -> Ambiente real / 1 -> Ambiente sandbox',
  `config_data_alteracao` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `config_pagseguro`
--

INSERT INTO `config_pagseguro` (`config_id`, `config_email`, `config_token`, `config_ambiente`, `config_data_alteracao`) VALUES
(1, 'caiool202020@gmail.com', 'BB162B3FD7324E59A5AE8B3C203B5515', 1, '2021-02-26 00:49:35');

-- --------------------------------------------------------

--
-- Estrutura da tabela `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'clientes', 'clientes');

-- --------------------------------------------------------

--
-- Estrutura da tabela `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `marcas`
--

CREATE TABLE `marcas` (
  `marca_id` int(11) NOT NULL,
  `marca_nome` varchar(45) NOT NULL,
  `marca_meta_link` varchar(255) NOT NULL,
  `marca_ativa` tinyint(1) DEFAULT NULL,
  `marca_data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `marca_data_alteracao` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `marcas`
--

INSERT INTO `marcas` (`marca_id`, `marca_nome`, `marca_meta_link`, `marca_ativa`, `marca_data_criacao`, `marca_data_alteracao`) VALUES
(2, 'EMS', 'ems', 1, '2021-02-05 15:42:20', '2021-02-11 14:35:03'),
(3, 'Aché', 'ache', 1, '2021-02-05 15:42:43', '2021-02-11 14:35:36'),
(4, 'Bayer', 'bayer', 1, '2021-02-11 14:36:04', NULL),
(5, 'Belfar', 'belfar', 1, '2021-02-11 14:36:34', NULL),
(6, 'Biolab', 'biolab', 1, '2021-02-11 14:36:53', NULL),
(7, 'Biosintética', 'biosintetica', 1, '2021-02-11 14:37:02', '2021-02-11 14:37:15'),
(8, 'Farmax', 'farmax', 1, '2021-02-11 14:38:27', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `pedido_id` int(11) NOT NULL,
  `pedido_codigo` varchar(8) DEFAULT NULL,
  `pedido_cliente_id` int(11) DEFAULT NULL,
  `pedido_valor_produtos` decimal(15,2) DEFAULT NULL,
  `pedido_valor_frete` decimal(15,2) DEFAULT NULL,
  `pedido_valor_final` decimal(15,2) DEFAULT NULL,
  `pedido_forma_envio` tinyint(1) DEFAULT NULL COMMENT '1 = Correios Sedex---------------------2 - Correios PAC',
  `pedido_data_cadastro` timestamp NOT NULL DEFAULT current_timestamp(),
  `pedido_data_alteracao` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pedidos`
--

INSERT INTO `pedidos` (`pedido_id`, `pedido_codigo`, `pedido_cliente_id`, `pedido_valor_produtos`, `pedido_valor_frete`, `pedido_valor_final`, `pedido_forma_envio`, `pedido_data_cadastro`, `pedido_data_alteracao`) VALUES
(1, '50168943', 10, '20.00', '24.51', '44.51', 1, '2021-03-13 16:28:17', NULL),
(2, '96731458', 11, '70.00', '31.31', '101.31', 1, '2021-03-13 16:32:04', NULL),
(3, '65910287', 15, '1.00', '31.31', '32.31', 1, '2021-03-13 22:29:27', NULL),
(4, '27659140', 16, '1.00', '31.31', '32.31', 1, '2021-03-16 17:37:43', NULL),
(5, '23087491', 17, '6.00', '31.31', '37.31', 1, '2021-03-16 18:11:57', NULL),
(6, '64012593', 18, '70.00', '31.31', '101.31', 1, '2021-03-16 18:16:42', NULL),
(7, '97485103', 10, '70.00', '31.31', '101.31', 1, '2021-03-16 18:58:33', NULL),
(8, '60814395', 19, '20.00', '31.31', '51.31', 1, '2021-03-16 19:01:22', NULL),
(9, '17043596', 23, '6.00', '56.61', '62.61', 2, '2021-03-16 19:37:23', NULL),
(10, '97065284', 10, '1.00', '31.31', '32.31', 1, '2021-03-16 19:46:25', NULL),
(11, '68492170', 10, '70.00', '31.31', '101.31', 1, '2021-03-18 18:05:49', NULL),
(12, '89130276', 10, '70.00', '31.31', '101.31', 1, '2021-03-18 18:07:13', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos_produtos`
--

CREATE TABLE `pedidos_produtos` (
  `pedido_id` int(11) DEFAULT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `produto_nome` varchar(200) NOT NULL,
  `produto_quantidade` int(11) NOT NULL,
  `produto_valor_unitario` decimal(15,2) NOT NULL,
  `produto_valor_total` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pedidos_produtos`
--

INSERT INTO `pedidos_produtos` (`pedido_id`, `produto_id`, `produto_nome`, `produto_quantidade`, `produto_valor_unitario`, `produto_valor_total`) VALUES
(1, 7, 'Nivea Milk 400ml', 1, '20.00', '20.00'),
(2, 11, 'Protetor La roche', 1, '70.00', '70.00'),
(3, 10, 'Dipirona com 10cps', 1, '1.00', '1.00'),
(4, 10, 'Dipirona com 10cps', 1, '1.00', '1.00'),
(5, 12, 'Bepantriz pomada', 1, '6.00', '6.00'),
(6, 11, 'Protetor La roche', 1, '70.00', '70.00'),
(7, 11, 'Protetor La roche', 1, '70.00', '70.00'),
(8, 7, 'Nivea Milk 400ml', 1, '20.00', '20.00'),
(9, 12, 'Bepantriz pomada', 1, '6.00', '6.00'),
(10, 9, 'Dorflex com 10cps', 1, '1.00', '1.00'),
(11, 11, 'Protetor La roche', 1, '70.00', '70.00'),
(12, 11, 'Protetor La roche', 1, '70.00', '70.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `produto_id` int(11) NOT NULL,
  `produto_codigo` varchar(45) DEFAULT NULL,
  `produto_data_cadastro` timestamp NULL DEFAULT current_timestamp(),
  `produto_categoria_id` int(11) DEFAULT NULL,
  `produto_marca_id` int(11) DEFAULT NULL,
  `produto_nome` varchar(255) DEFAULT NULL,
  `produto_meta_link` varchar(255) DEFAULT NULL,
  `produto_peso` int(11) DEFAULT 0,
  `produto_altura` int(11) DEFAULT 0,
  `produto_largura` int(11) DEFAULT 0,
  `produto_comprimento` int(11) DEFAULT 0,
  `produto_valor` varchar(45) DEFAULT NULL,
  `produto_destaque` tinyint(1) DEFAULT NULL,
  `produto_controlar_estoque` tinyint(1) DEFAULT NULL,
  `produto_quantidade_estoque` int(11) DEFAULT 0,
  `produto_ativo` tinyint(1) DEFAULT NULL,
  `produto_descricao` longtext DEFAULT NULL,
  `produto_data_alteracao` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`produto_id`, `produto_codigo`, `produto_data_cadastro`, `produto_categoria_id`, `produto_marca_id`, `produto_nome`, `produto_meta_link`, `produto_peso`, `produto_altura`, `produto_largura`, `produto_comprimento`, `produto_valor`, `produto_destaque`, `produto_controlar_estoque`, `produto_quantidade_estoque`, `produto_ativo`, `produto_descricao`, `produto_data_alteracao`) VALUES
(7, '43910568', '2021-02-15 16:00:00', 7, 8, 'Nivea Milk 400ml', 'nivea-milk-400ml', 1, 15, 15, 15, '20.00', 1, 1, 4, 1, 'creme nivea para o corpo', NULL),
(8, '82436091', '2021-02-15 16:00:49', 7, 8, 'Alcool em gel', 'alcool-em-gel', 1, 15, 15, 15, '10.00', 1, 1, 0, 1, 'alcool em gel', NULL),
(9, '25831940', '2021-02-15 16:01:22', 7, 2, 'Dorflex com 10cps', 'dorflex-com-10cps', 1, 15, 15, 15, '1.00', 1, 1, 1, 1, 'dorflex com 10 cps', NULL),
(10, '37514260', '2021-02-15 16:33:15', 7, 2, 'Dipirona com 10cps', 'dipirona-com-10cps', 1, 15, 15, 15, '1.00', 1, 1, 5, 1, 'dipirona com 10cps', NULL),
(11, '76538429', '2021-02-15 16:33:52', 7, 8, 'Protetor La roche', 'protetor-la-roche', 1, 15, 15, 15, '70.00', 1, 1, 2, 1, 'protetor solar 70fps', NULL),
(12, '96325014', '2021-02-15 16:35:43', 7, 6, 'Bepantriz pomada', 'bepantriz-pomada', 1, 15, 15, 15, '6.00', 1, 1, 1, 1, 'bepantriz pomada cicatrizante', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos_fotos`
--

CREATE TABLE `produtos_fotos` (
  `foto_id` int(11) NOT NULL,
  `foto_produto_id` int(11) DEFAULT NULL,
  `foto_caminho` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos_fotos`
--

INSERT INTO `produtos_fotos` (`foto_id`, `foto_produto_id`, `foto_caminho`) VALUES
(90, 8, '589225a4db9a5de668c97476026138e9.jpg'),
(94, 7, 'f535c4f59627fae454957efc1d98abd7.jpg'),
(95, 7, '77b9bd872f5fe766b8bf733edf3d48f7.jpg'),
(96, 11, 'd1c08fb80defa9e292c3ba6ea878d341.jpg'),
(97, 12, '170404348e5fb3a285061cc3b862197a.jpg'),
(109, 10, '7ffac8c605c02125891ec44c9b71120f.jpg'),
(110, 9, '0c0dc0a28b2eb400ac56c73606c6694a.jpg'),
(111, 9, 'ad407d4788f86080c9c126e5f9297ed9.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sistema`
--

CREATE TABLE `sistema` (
  `sistema_id` int(11) NOT NULL,
  `sistema_razao_social` varchar(145) DEFAULT NULL,
  `sistema_nome_fantasia` varchar(145) DEFAULT NULL,
  `sistema_cnpj` varchar(25) DEFAULT NULL,
  `sistema_ie` varchar(25) DEFAULT NULL,
  `sistema_telefone_fixo` varchar(25) DEFAULT NULL,
  `sistema_telefone_movel` varchar(25) NOT NULL,
  `sistema_email` varchar(100) DEFAULT NULL,
  `sistema_site_url` varchar(100) DEFAULT NULL,
  `sistema_cep` varchar(25) DEFAULT NULL,
  `sistema_endereco` varchar(145) DEFAULT NULL,
  `sistema_numero` varchar(25) DEFAULT NULL,
  `sistema_cidade` varchar(45) DEFAULT NULL,
  `sistema_estado` varchar(2) DEFAULT NULL,
  `sistema_produtos_destaques` int(11) NOT NULL,
  `sistema_texto` tinytext DEFAULT NULL,
  `sistema_data_alteracao` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `sistema`
--

INSERT INTO `sistema` (`sistema_id`, `sistema_razao_social`, `sistema_nome_fantasia`, `sistema_cnpj`, `sistema_ie`, `sistema_telefone_fixo`, `sistema_telefone_movel`, `sistema_email`, `sistema_site_url`, `sistema_cep`, `sistema_endereco`, `sistema_numero`, `sistema_cidade`, `sistema_estado`, `sistema_produtos_destaques`, `sistema_texto`, `sistema_data_alteracao`) VALUES
(1, 'Loja virtual teste', 'Vende Tudo!', '80.838.809/0001-26', '683.90228-49', '(41) 3232-3030', '(41) 9999-9999', 'vendetudo@contato.com.br', 'http://vendetudo.com.br', '32180-580', 'Rua Búzios', '450', 'Contagem', 'MG', 6, 'Preço e qualidade!', '2021-02-22 14:19:33');

-- --------------------------------------------------------

--
-- Estrutura da tabela `transacoes`
--

CREATE TABLE `transacoes` (
  `transacao_id` int(11) NOT NULL,
  `transacao_pedido_id` int(11) DEFAULT NULL,
  `transacao_cliente_id` int(11) DEFAULT NULL,
  `transacao_data` timestamp NULL DEFAULT current_timestamp(),
  `transacao_codigo_hash` varchar(255) DEFAULT NULL,
  `transacao_tipo_metodo_pagamento` tinyint(1) DEFAULT NULL COMMENT '1 = Cartão | 2 = Boleto | 3 = Transferência',
  `transacao_codigo_metodo_pagamento` varchar(10) DEFAULT NULL,
  `transacao_link_pagamento` varchar(255) DEFAULT NULL,
  `transacao_banco_escolhido` varchar(20) DEFAULT NULL,
  `transacao_valor_bruto` decimal(15,2) DEFAULT NULL,
  `transacao_valor_taxa_pagseguro` decimal(15,2) DEFAULT NULL,
  `transacao_valor_liquido` decimal(15,2) DEFAULT NULL,
  `transacao_numero_parcelas` int(11) DEFAULT NULL,
  `transacao_valor_parcela` decimal(15,2) DEFAULT NULL,
  `transacao_status` tinyint(1) DEFAULT NULL COMMENT 'Verificar documentação',
  `transacao_data_alteracao` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `transacoes`
--

INSERT INTO `transacoes` (`transacao_id`, `transacao_pedido_id`, `transacao_cliente_id`, `transacao_data`, `transacao_codigo_hash`, `transacao_tipo_metodo_pagamento`, `transacao_codigo_metodo_pagamento`, `transacao_link_pagamento`, `transacao_banco_escolhido`, `transacao_valor_bruto`, `transacao_valor_taxa_pagseguro`, `transacao_valor_liquido`, `transacao_numero_parcelas`, `transacao_valor_parcela`, `transacao_status`, `transacao_data_alteracao`) VALUES
(1, 1, 10, '2021-03-13 16:28:17', '9E5F30E6-10FA-4710-8EF7-B4CFE9CE4BB5', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=1fbd9de01d4584436933377749cad7cfc99ac193e555c9137b8ff6251b90eac5e4749a2747249cc2', NULL, '44.51', '2.62', '41.89', 1, '44.51', 1, NULL),
(2, 2, 11, '2021-03-13 16:32:04', 'DDB360CA-7A12-4CE8-B9B3-2D12F8B42071', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=41406d0050ead8a98aa88f9aaa2c4a087d1248e643510ff56ced096772099c881970558229040f81', NULL, '101.31', '5.46', '95.85', 1, '101.31', 1, NULL),
(3, 3, 15, '2021-03-13 22:29:27', '636EA034-61B8-44EF-A3AD-ABFEFBB845B3', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=a6228d3f2be58f2dd79849e2096a940156cb92ef04bf384abf7fd28b892c66822ae986c8b8d93ce4', NULL, '32.31', '2.01', '30.30', 1, '32.31', 1, NULL),
(4, 4, 16, '2021-03-16 17:37:43', 'C1420492-94EB-42E0-9198-21CD00937B88', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=a5f5ed1a739590b66a2f110b450c149fcd25ffca7094c9efb5317925b59d8da0e15294472ba55b22', NULL, '32.31', '2.01', '30.30', 1, '32.31', 1, NULL),
(5, 5, 17, '2021-03-16 18:11:57', 'AB9F9302-D4F5-4B6B-8142-34086BEF857C', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=f54f72cdc9c884af060291ac1308e9dba2227498f6e18fd2ba0e5533af4d05934ffb5e7be9990d13', NULL, '37.31', '2.26', '35.05', 1, '37.31', 1, NULL),
(6, 6, 18, '2021-03-16 18:16:42', 'BB190B92-566C-4120-8472-8CBB412E508D', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=b1de780a1788ecfa508b7329e9f4aa925383d2180d7031cde02459900f1de040ce7b8d3747773a02', NULL, '101.31', '5.46', '95.85', 1, '101.31', 1, NULL),
(7, 7, 10, '2021-03-16 18:58:33', 'E95BD166-C0BE-4E48-9BF3-E239570EFAAE', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=89155880c31eb580b87e774d1aab6fa53a20e86065802e194a6da43700d7463ee5d5b197184e0caa', NULL, '101.31', '5.46', '95.85', 1, '101.31', 1, NULL),
(8, 8, 19, '2021-03-16 19:01:22', '66274141-0ACA-4879-9E04-69EA233C365B', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=d459a11c1d5951f4c8c54d49c088ad8d09c865886f2045cba236b725b66934bbabc4e5fadeabdbb1', NULL, '51.31', '2.96', '48.35', 1, '51.31', 1, NULL),
(9, 9, 23, '2021-03-16 19:37:23', '73FAAC8D-D070-45EC-90F5-68D09231BEA0', 3, '302', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/eft/print.jhtml?c=8babd47da97c0af676c3593ffdced4a99708acf9b2cc40469cc17972f2d2a6ad9afaf2ecb94718b8', NULL, '62.61', '3.52', '59.09', 1, '62.61', 1, NULL),
(10, 10, 10, '2021-03-16 19:46:25', '1428BF59-A951-4D3F-86C2-24CB1B67F260', 3, '301', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/eft/print.jhtml?c=504040dc7e44e62ea2e0822f5fffe03eb23def66d08b81215bb27855f1d03b710db85655a52b4744', NULL, '32.31', '2.01', '30.30', 1, '32.31', 1, NULL),
(11, 11, 10, '2021-03-18 18:05:49', '56DB5511-7254-45EC-B1F5-E469AE1EC197', 1, '101', NULL, NULL, '101.31', '5.46', '95.85', 1, '101.31', 1, NULL),
(12, 12, 10, '2021-03-18 18:07:13', 'F9D2EF3B-3F4B-4E01-91C3-7621E9AF730A', 1, '101', NULL, NULL, '101.31', '5.46', '95.85', 1, '101.31', 1, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `cliente_user_id` int(11) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `ip_address`, `cliente_user_id`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', NULL, 'administrator', '$2y$12$V98BouUeYfKY7s8iIVFF9eGR1qvVnr76V.3aA8wCnBjRnSOZO2qce', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1615919336, 1, 'Admin', 'istrator', 'ADMIN', '0'),
(4, '::1', NULL, 'caioteste', '$2y$10$P24AGHMWynyFf6p4u.4P7esWEJWCYqAl0dVUIN2M9XSzRXAex2hfm', 'caio@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1612534050, 1615919430, 1, 'Caio', 'Alves', NULL, NULL),
(6, '', 1, NULL, '$2y$10$aqEa8M.hqMaGcrvosN4eEOGfc.CI70OjXMRz/sfPwidykfeUjYa62', 'caioalves201717@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1612534050, 1614788729, 1, 'Caio', 'Alves', NULL, NULL),
(8, '::1', 3, 'Teste', '$2y$10$FR1UGHehPgMoPWzi.s3lg.xm4Pl8GawBjQNVK3UsWBlxNlgOf9WmS', 'email12345567@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1615145947, NULL, 1, 'Teste', 'compra', NULL, '(31) 99111-1111'),
(10, '::1', 5, 'Cliente', '$2y$10$kUeE9lo4C6j/E1U0t.qy.uQM9dfzOUPyL0bxKaWuxW/ui.xL.vNKK', 'email@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1615146594, NULL, 1, 'Cliente', 'Teste', NULL, '(31) 97314-7539'),
(12, '::1', 7, 'Pedro', '$2y$10$NuWyFwF7xPf8clJlAA/Yrul/PMfOjposvXN/FEuSlVXZczehW8fCu', 'pedro1@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1615429913, NULL, 1, 'Pedro', 'Silva', NULL, '(31) 93333-3333'),
(13, '::1', 8, 'Lucas', '$2y$10$hE2fOdhqWApM66hocYCQNevlgyl7Iqwab4AGTGKrQ4phgDt65F0Su', 'lucas@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1615430092, NULL, 1, 'Lucas', 'Silva', NULL, '(31) 94444-4444'),
(14, '::1', 9, 'teste', '$2y$10$G20e3d.rCdmTE6d7qz3Ir.xqP7keFY8sZ.UxYobOWgvtmn4svgSVm', 'teste21@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1615430407, NULL, 1, 'teste', 'fdsfds', NULL, '(11) 11111-1111'),
(15, '::1', 10, 'Maria', '$2y$10$tpTr7x/yOtXF10t/Aw15rO5oc1JX7ISe1vtTmEI5JYVJ0azmbnOry', 'maria@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1615652892, 1616090648, 1, 'Maria', 'Souza', NULL, '(31) 66666-6666'),
(16, '::1', 11, 'Cliente', '$2y$10$eJ/1ShAqA00zmi1bhtDxbu7hSQlCLr2lmDPAZezVYNecj..w45RmW', 'souza@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1615653118, NULL, 1, 'Cliente', 'Souza', NULL, '(31) 99999-9999'),
(20, '::1', 15, 'Fabio', '$2y$10$eemM60AehDyXw3N3mBRTY.E.965EWI0VIciN8xUJy73HkwwcE28Me', 'fabio@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1615674564, NULL, 1, 'Fabio', 'Lucas', NULL, '(31) 14444-4444'),
(21, '::1', 16, 'Maria', '$2y$10$Res48l2SOXbs0anXaT9xjOMfSoxJ/.3aP2QWe9x8MtRg2cmWbF0ta', 'mariasouza@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1615916260, NULL, 1, 'Maria', 'Souza', NULL, '(12) 11111-1111'),
(22, '::1', 17, 'Ana', '$2y$10$3TJcAvATd2pX7NwUzb5PIuwbeymuy1LlzDuQYIVFqe2FvbV4pVkQq', 'anamaria@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1615918313, NULL, 1, 'Ana', 'Maria', NULL, '(31) 11111-1154'),
(23, '::1', 18, 'Lucas', '$2y$10$sg5vHlEvP7l8DnrQE.biEe6UDTGDqDhaWeZRYI7FVru.ugZPfGqfa', 'lucassil@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1615918599, NULL, 1, 'Lucas', 'Sil', NULL, '(32) 21111-1111'),
(24, '::1', 19, 'Raniel', '$2y$10$i4Qi/95Vn.1vM30djsPFduvCdugX8Y515eCN4bbDEhASwB9G541Pa', 'raniel@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1615921279, NULL, 1, 'Raniel', 'Elmo', NULL, '(24) 11111-1111'),
(28, '::1', 23, 'Debito', '$2y$10$DkYJ.71WTo2eZ75/GJANOu5Hr6Ejf8w6V.PdHMM/3.xJ/MXxCi71i', 'debito@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1615923441, NULL, 1, 'Debito', 'Conta', NULL, '(33) 11111-1111');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(41, 1, 1),
(61, 4, 2),
(38, 6, 2),
(44, 8, 2),
(46, 10, 2),
(48, 12, 2),
(49, 13, 2),
(50, 14, 2),
(51, 15, 2),
(52, 16, 2),
(56, 20, 2),
(57, 21, 2),
(58, 22, 2),
(59, 23, 2),
(62, 24, 2),
(66, 28, 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`categoria_id`),
  ADD KEY `categoria_pai_id` (`categoria_pai_id`);

--
-- Índices para tabela `categorias_pai`
--
ALTER TABLE `categorias_pai`
  ADD PRIMARY KEY (`categoria_pai_id`);

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cliente_id`);

--
-- Índices para tabela `config_correios`
--
ALTER TABLE `config_correios`
  ADD PRIMARY KEY (`config_id`);

--
-- Índices para tabela `config_pagseguro`
--
ALTER TABLE `config_pagseguro`
  ADD PRIMARY KEY (`config_id`);

--
-- Índices para tabela `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`marca_id`);

--
-- Índices para tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`pedido_id`),
  ADD KEY `pedido_cliente_id` (`pedido_cliente_id`);

--
-- Índices para tabela `pedidos_produtos`
--
ALTER TABLE `pedidos_produtos`
  ADD KEY `pedido_id` (`pedido_id`,`produto_id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`produto_id`),
  ADD KEY `produto_categoria_id` (`produto_categoria_id`),
  ADD KEY `produto_marca_id` (`produto_marca_id`);

--
-- Índices para tabela `produtos_fotos`
--
ALTER TABLE `produtos_fotos`
  ADD PRIMARY KEY (`foto_id`),
  ADD KEY `fk_foto_produto_id` (`foto_produto_id`);

--
-- Índices para tabela `transacoes`
--
ALTER TABLE `transacoes`
  ADD PRIMARY KEY (`transacao_id`),
  ADD KEY `transacao_pedido_id` (`transacao_pedido_id`,`transacao_cliente_id`),
  ADD KEY `fk_transacao_cliente_id` (`transacao_cliente_id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_email` (`email`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`),
  ADD KEY `cliente_user_id` (`cliente_user_id`);

--
-- Índices para tabela `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `categoria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `categorias_pai`
--
ALTER TABLE `categorias_pai`
  MODIFY `categoria_pai_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `config_pagseguro`
--
ALTER TABLE `config_pagseguro`
  MODIFY `config_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `marcas`
--
ALTER TABLE `marcas`
  MODIFY `marca_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `pedido_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `produto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `produtos_fotos`
--
ALTER TABLE `produtos_fotos`
  MODIFY `foto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT de tabela `transacoes`
--
ALTER TABLE `transacoes`
  MODIFY `transacao_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de tabela `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `fk_categoria_pai_id` FOREIGN KEY (`categoria_pai_id`) REFERENCES `categorias_pai` (`categoria_pai_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedido_cliente_id` FOREIGN KEY (`pedido_cliente_id`) REFERENCES `clientes` (`cliente_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `pedidos_produtos`
--
ALTER TABLE `pedidos_produtos`
  ADD CONSTRAINT `fk_pedido_id` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`pedido_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_produto_id` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`produto_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `produtos_fotos`
--
ALTER TABLE `produtos_fotos`
  ADD CONSTRAINT `fk_foto_produto_id` FOREIGN KEY (`foto_produto_id`) REFERENCES `produtos` (`produto_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `transacoes`
--
ALTER TABLE `transacoes`
  ADD CONSTRAINT `fk_transacao_cliente_id` FOREIGN KEY (`transacao_cliente_id`) REFERENCES `clientes` (`cliente_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_transacao_pedido_id` FOREIGN KEY (`transacao_pedido_id`) REFERENCES `pedidos` (`pedido_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_cliente_user_id` FOREIGN KEY (`cliente_user_id`) REFERENCES `clientes` (`cliente_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

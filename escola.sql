-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15-Dez-2020 às 23:40
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `escola`
--
CREATE DATABASE IF NOT EXISTS `escola` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `escola`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargo`
--

CREATE TABLE `cargo` (
  `idcargo` int(11) NOT NULL,
  `cargo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cargo`
--

INSERT INTO `cargo` (`idcargo`, `cargo`) VALUES
(1, 'professor'),
(2, 'coordInfo'),
(3, 'coordPedag'),
(4, 'coordEM');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargofunc`
--

CREATE TABLE `cargofunc` (
  `codfuncionario` int(11) NOT NULL,
  `codCargo` int(11) NOT NULL,
  `dataEntrada` date NOT NULL,
  `dataSaida` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cargofunc`
--

INSERT INTO `cargofunc` (`codfuncionario`, `codCargo`, `dataEntrada`, `dataSaida`) VALUES
(1, 1, '2010-12-02', '0000-00-00'),
(1, 4, '2012-09-12', '2015-07-14'),
(1, 3, '2016-10-11', '0000-00-00'),
(2, 1, '2006-09-30', '0000-00-00'),
(2, 2, '2010-05-15', '2012-03-12'),
(2, 2, '2014-10-19', '2016-12-30'),
(5, 1, '2007-10-29', '0000-00-00'),
(5, 3, '2010-05-07', '2015-03-11'),
(3, 1, '2011-10-20', '0000-00-00'),
(3, 2, '2016-07-07', '2019-04-19'),
(3, 4, '2017-10-01', '2018-10-30'),
(4, 4, '2000-12-02', '2007-10-07'),
(4, 1, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `codfuncionario` int(11) NOT NULL,
  `nomefuncionario` varchar(255) NOT NULL,
  `dataEntrada` date NOT NULL,
  `dataSaida` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`codfuncionario`, `nomefuncionario`, `dataEntrada`, `dataSaida`) VALUES
(1, 'Amanda', '2011-12-02', '0000-00-00'),
(2, 'Anderson', '2009-12-07', '0000-00-00'),
(3, 'Cintia', '2011-10-20', '0000-00-00'),
(4, 'Jose', '0000-00-00', '0000-00-00'),
(5, 'Carlos', '2007-07-22', '0000-00-00');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`idcargo`);

--
-- Índices para tabela `cargofunc`
--
ALTER TABLE `cargofunc`
  ADD KEY `codfuncionario` (`codfuncionario`),
  ADD KEY `codCargo` (`codCargo`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`codfuncionario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cargo`
--
ALTER TABLE `cargo`
  MODIFY `idcargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `codfuncionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cargofunc`
--
ALTER TABLE `cargofunc`
  ADD CONSTRAINT `cargofunc_ibfk_1` FOREIGN KEY (`codfuncionario`) REFERENCES `funcionario` (`codfuncionario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cargofunc_ibfk_2` FOREIGN KEY (`codCargo`) REFERENCES `cargo` (`idcargo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

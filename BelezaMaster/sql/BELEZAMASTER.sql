-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: 26/07/2016 às 16:46
-- Versão do servidor: 5.5.50-0ubuntu0.14.04.1
-- Versão do PHP: 5.5.9-1ubuntu4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de dados: `BELEZAMASTER`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `ATENDIMENTO`
--

CREATE TABLE IF NOT EXISTS `ATENDIMENTO` (
  `Horario` datetime NOT NULL,
  `Codigo` int(11) NOT NULL,
  `ID_Profissional` int(11) DEFAULT NULL,
  `Codigo_Servico` int(11) NOT NULL,
  `CPF_Usuario` varchar(14) NOT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `ID_Profissional` (`ID_Profissional`),
  KEY `Codigo_Servico` (`Codigo_Servico`),
  KEY `CPF_Usuario` (`CPF_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `PRODUTO`
--

CREATE TABLE IF NOT EXISTS `PRODUTO` (
  `Nome_produto` varchar(30) NOT NULL,
  `Descricao` varchar(50) NOT NULL,
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Quantidade` int(11) DEFAULT NULL,
  `Valor` double DEFAULT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `PROFISSIONAL`
--

CREATE TABLE IF NOT EXISTS `PROFISSIONAL` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Profissao` varchar(30) NOT NULL,
  `Cpf` varchar(14) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Endereco` varchar(100) NOT NULL,
  `Telefone` varchar(13) DEFAULT NULL,
  `Celular` varchar(14) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `SERVICO`
--

CREATE TABLE IF NOT EXISTS `SERVICO` (
  `Nome` varchar(30) NOT NULL,
  `Descricao` varchar(50) NOT NULL,
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Valor` double DEFAULT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `USUARIO`
--

CREATE TABLE IF NOT EXISTS `USUARIO` (
  `Nome` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Login` varchar(20) NOT NULL,
  `Senha` varchar(20) NOT NULL,
  `Cpf` varchar(14) NOT NULL,
  `Telefone` varchar(13) DEFAULT NULL,
  `Celular` varchar(14) NOT NULL,
  PRIMARY KEY (`Cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `ATENDIMENTO`
--
ALTER TABLE `ATENDIMENTO`
  ADD CONSTRAINT `ATENDIMENTO_ibfk_3` FOREIGN KEY (`CPF_Usuario`) REFERENCES `USUARIO` (`Cpf`),
  ADD CONSTRAINT `ATENDIMENTO_ibfk_1` FOREIGN KEY (`ID_Profissional`) REFERENCES `PROFISSIONAL` (`ID`),
  ADD CONSTRAINT `ATENDIMENTO_ibfk_2` FOREIGN KEY (`Codigo_Servico`) REFERENCES `SERVICO` (`Codigo`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

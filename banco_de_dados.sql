# ************************************************************
# Sequel Pro SQL dump
# Versão 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.5.42)
# Base de Dados: classificados
# Tempo de Geração: 2017-01-16 16:54:07 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump da tabela anuncios
# ------------------------------------------------------------

DROP TABLE IF EXISTS `anuncios`;

CREATE TABLE `anuncios` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `descricao` text,
  `valor` float DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `anuncios` WRITE;
/*!40000 ALTER TABLE `anuncios` DISABLE KEYS */;

INSERT INTO `anuncios` (`id`, `id_usuario`, `id_categoria`, `titulo`, `descricao`, `valor`, `estado`)
VALUES
	(3,1,1,'Hublot Editado','Algum produto de anÃºncio legal',300,1),
	(4,1,2,'Casaco de Fulano','DescriÃ§Ã£o luxuosa do casaco',100,0),
	(5,1,4,'Ferrari','Carro esportivo muito barato',50,1);

/*!40000 ALTER TABLE `anuncios` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela anuncios_imagens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `anuncios_imagens`;

CREATE TABLE `anuncios_imagens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_anuncio` int(11) NOT NULL,
  `url` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `anuncios_imagens` WRITE;
/*!40000 ALTER TABLE `anuncios_imagens` DISABLE KEYS */;

INSERT INTO `anuncios_imagens` (`id`, `id_anuncio`, `url`)
VALUES
	(5,3,'ce22b99a632571fc5ff345eafa252a67.jpg'),
	(6,3,'c38581766dff46f000ae243330ead1a8.jpg'),
	(7,3,'fe31ef89de0c785c24e2007719241763.jpg'),
	(8,4,'ef9b88ad9e74cd9b4f1510653da291a2.jpg'),
	(9,5,'04bd9d8ac92c267405cfa7682d59049b.jpg'),
	(10,5,'fb3019cbc47211aed1cb32b76d660c13.jpg'),
	(11,5,'c10d16f9aa0353d868bef93ff7e036c8.jpg');

/*!40000 ALTER TABLE `anuncios_imagens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela categorias
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;

INSERT INTO `categorias` (`id`, `nome`)
VALUES
	(1,'Relógios'),
	(2,'Roupas'),
	(3,'Eletrônicos'),
	(4,'Carros');

/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela usuarios
# ------------------------------------------------------------

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `senha` varchar(32) NOT NULL DEFAULT '',
  `telefone` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `telefone`)
VALUES
	(1,'Bonieky','suporte@b7web.com.br','202cb962ac59075b964b07152d234b70','99999999');

/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

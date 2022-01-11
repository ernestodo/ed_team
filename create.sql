CREATE DATABASE IF NOT EXISTS `ed_team`;
USE `ed_team`;

CREATE TABLE IF NOT EXISTS `clientes` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(150) NOT NULL DEFAULT '',
  `nombre` varchar(200) NOT NULL DEFAULT '',
  `apat` varchar(200) DEFAULT '',
  `amat` varchar(200) NOT NULL DEFAULT '',
  `dirCalle` varchar(250) NOT NULL DEFAULT '',
  `dirNum` varchar(100) NOT NULL DEFAULT '',
  `dirCiudad` varchar(200) NOT NULL DEFAULT '',
  `dirEstado` varchar(200) NOT NULL DEFAULT '',
  `dirPais` varchar(200) NOT NULL DEFAULT '',
  `dirCP` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `email` (`email`),
  KEY `idCliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `facturas` (
  `idFactura` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `piezas` int(11) NOT NULL DEFAULT '0',
  `fechaVenta` datetime NOT NULL,
  PRIMARY KEY (`idFactura`),
  KEY `idProducto` (`idProducto`),
  KEY `idCliente` (`idCliente`),
  KEY `idFactura` (`idFactura`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `productos` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) NOT NULL DEFAULT '0',
  `nombre` varchar(250) NOT NULL DEFAULT '0',
  `descripcion` varchar(250) NOT NULL DEFAULT '0',
  `precio` double NOT NULL DEFAULT '0',
  `impuesto` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`idProducto`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `idProducto` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table categoria_prestacion
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categoria_prestacion`;

CREATE TABLE `categoria_prestacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL COMMENT 'Nombre categoria prestación',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `categoria_prestacion` WRITE;
/*!40000 ALTER TABLE `categoria_prestacion` DISABLE KEYS */;

INSERT INTO `categoria_prestacion` (`id`, `nombre`)
VALUES
	(1,'General'),
	(2,'Ortodoncia'),
	(3,'Maxilofacial'),
	(4,'Periodoncia');

/*!40000 ALTER TABLE `categoria_prestacion` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table detalle_presupuesto
# ------------------------------------------------------------

DROP TABLE IF EXISTS `detalle_presupuesto`;

CREATE TABLE `detalle_presupuesto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_presupuesto` int(11) DEFAULT NULL COMMENT 'ID presupuesto al que corresponde el detalle',
  `id_prestacion` int(11) DEFAULT NULL COMMENT 'ID prestación cargada en el detalle',
  `id_profesional_creador` int(11) DEFAULT NULL COMMENT 'ID profesional que genero el detalle',
  `id_profesional_realizador` int(11) DEFAULT NULL COMMENT 'ID profesional que realiza el detalle',
  `fecha_creacion` date DEFAULT NULL COMMENT 'Fecha de creación del detalle (puede diferir de la creación del presupuesto)',
  `fecha_realizacion` date DEFAULT NULL COMMENT 'Fecha en que profesional realiza el detalle (Igual o mayor que la fecha de creación)',
  `realizado` tinyint(11) DEFAULT NULL COMMENT 'Estado de realización del detalle',
  `precio` int(11) DEFAULT NULL COMMENT 'Precio de la prestación asociada al detalle (al cargar un detalle se puede modificar el precio referencial de la prestación)',
  PRIMARY KEY (`id`),
  KEY `id_presupuesto` (`id_presupuesto`),
  KEY `id_prestacion` (`id_prestacion`),
  KEY `id_profesional_creador` (`id_profesional_creador`),
  KEY `id_profesional_realizador` (`id_profesional_realizador`),
  CONSTRAINT `detalle_presupuesto_ibfk_1` FOREIGN KEY (`id_presupuesto`) REFERENCES `presupuesto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detalle_presupuesto_ibfk_2` FOREIGN KEY (`id_prestacion`) REFERENCES `prestacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detalle_presupuesto_ibfk_3` FOREIGN KEY (`id_profesional_creador`) REFERENCES `profesional` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detalle_presupuesto_ibfk_4` FOREIGN KEY (`id_profesional_realizador`) REFERENCES `profesional` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `detalle_presupuesto` WRITE;
/*!40000 ALTER TABLE `detalle_presupuesto` DISABLE KEYS */;

INSERT INTO `detalle_presupuesto` (`id`, `id_presupuesto`, `id_prestacion`, `id_profesional_creador`, `id_profesional_realizador`, `fecha_creacion`, `fecha_realizacion`, `realizado`, `precio`)
VALUES
	(1,1,5,2,2,'2018-01-01','2018-01-02',1,4000),
	(2,1,4,2,1,'2018-01-01','2018-01-05',1,5000),
	(3,2,5,1,NULL,'2018-06-03',NULL,0,4000),
	(4,2,1,1,1,'2018-06-03','2018-06-03',1,1000),
	(5,3,8,6,6,'2018-02-03','2018-02-04',1,3000),
	(6,5,7,3,NULL,'2018-04-15',NULL,0,2500),
	(7,5,7,3,3,'2018-04-15','2018-04-18',1,2500),
	(8,5,7,3,NULL,'2018-04-15',NULL,0,2500);

/*!40000 ALTER TABLE `detalle_presupuesto` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table especialidad
# ------------------------------------------------------------

DROP TABLE IF EXISTS `especialidad`;

CREATE TABLE `especialidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL COMMENT 'Nombre especialidad',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `especialidad` WRITE;
/*!40000 ALTER TABLE `especialidad` DISABLE KEYS */;

INSERT INTO `especialidad` (`id`, `nombre`)
VALUES
	(1,'General'),
	(2,'Ortodoncia'),
	(3,'Maxilofacial');

/*!40000 ALTER TABLE `especialidad` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table paciente
# ------------------------------------------------------------

DROP TABLE IF EXISTS `paciente`;

CREATE TABLE `paciente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(255) DEFAULT NULL,
  `apellido_paterno` varchar(255) DEFAULT NULL,
  `apellido_materno` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL COMMENT 'H hombre, M mujer',
  `habilitado` tinyint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;

INSERT INTO `paciente` (`id`, `nombres`, `apellido_paterno`, `apellido_materno`, `fecha_nacimiento`, `sexo`, `habilitado`)
VALUES
	(1,'Juan','Perez','Lopez','2013-04-01','M',1),
	(2,'Alvaro','Ramirez','Soto','2001-02-12','M',1),
	(3,'Matias','Sandoval','Aguila','1982-09-23','M',1),
	(4,'Laura','Larrain','Vergara','1989-05-22','F',1),
	(5,'Raul','Santa Maria','Medel','1994-05-13','M',1),
	(6,'Carla','Morales','Gomez','2007-01-04','F',1),
	(7,'Maria','Santana','Herrera','1995-11-13','F',1),
	(8,'Ana','Saez','Guajardo','2011-01-06','F',1),
	(9,'Daniela','Lopez','Vega','1975-03-08','F',1),
	(10,'Jaime','Antunez','Lota','1999-12-03','M',1);

/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table prestacion
# ------------------------------------------------------------

DROP TABLE IF EXISTS `prestacion`;

CREATE TABLE `prestacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL COMMENT 'Nombre prestación',
  `precio` int(11) DEFAULT NULL COMMENT 'Precio referencial prestación',
  PRIMARY KEY (`id`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `prestacion_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria_prestacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `prestacion` WRITE;
/*!40000 ALTER TABLE `prestacion` DISABLE KEYS */;

INSERT INTO `prestacion` (`id`, `id_categoria`, `nombre`, `precio`)
VALUES
	(1,1,'Diagnostico',1000),
	(2,1,'Control general',2000),
	(3,1,'Limpieza',3000),
	(4,2,'Aparatos Fijos',10000),
	(5,2,'Reparación brackets',8000),
	(6,2,'Estudio cefalométrico',15000),
	(7,2,'Arco facial',4000),
	(8,3,'Control maxilo',3000),
	(9,3,'Estudio histo',7500),
	(10,4,'Desgaste selectivo',6000),
	(11,4,'Destartraje',3500),
	(12,4,'Gingivectomía',9000);

/*!40000 ALTER TABLE `prestacion` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table presupuesto
# ------------------------------------------------------------

DROP TABLE IF EXISTS `presupuesto`;

CREATE TABLE `presupuesto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_paciente` int(11) DEFAULT NULL COMMENT 'ID paciente atendido',
  `id_sucursal` int(11) DEFAULT NULL COMMENT 'ID sucursal de atención',
  `id_profesional` int(11) DEFAULT NULL COMMENT 'ID profesional creador presupuesto',
  `nombre` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_paciente` (`id_paciente`),
  KEY `id_sucursal` (`id_sucursal`),
  KEY `id_profesional` (`id_profesional`),
  CONSTRAINT `presupuesto_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `presupuesto_ibfk_2` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `presupuesto_ibfk_3` FOREIGN KEY (`id_profesional`) REFERENCES `profesional` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `presupuesto` WRITE;
/*!40000 ALTER TABLE `presupuesto` DISABLE KEYS */;

INSERT INTO `presupuesto` (`id`, `id_paciente`, `id_sucursal`, `id_profesional`, `nombre`, `fecha`)
VALUES
	(1,1,1,2,'Instalación brackets','2018-01-01'),
	(2,1,2,1,'Seguimiento brackets','2018-06-03'),
	(3,4,2,6,'Control maxilo','2018-02-03'),
	(4,4,2,4,'Presupuesto en blanco','2018-03-07'),
	(5,10,1,3,'Arcos','2018-04-15');

/*!40000 ALTER TABLE `presupuesto` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table profesional
# ------------------------------------------------------------

DROP TABLE IF EXISTS `profesional`;

CREATE TABLE `profesional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_especialidad` int(11) DEFAULT NULL COMMENT 'ID especialidad del profesional',
  `nombres` varchar(255) DEFAULT NULL,
  `apellido_paterno` varchar(255) DEFAULT NULL,
  `apellido_materno` varchar(255) DEFAULT NULL,
  `habilitado` tinyint(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_especialidad` (`id_especialidad`),
  CONSTRAINT `profesional_ibfk_1` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidad` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `profesional` WRITE;
/*!40000 ALTER TABLE `profesional` DISABLE KEYS */;

INSERT INTO `profesional` (`id`, `id_especialidad`, `nombres`, `apellido_paterno`, `apellido_materno`, `habilitado`)
VALUES
	(1,1,'Eduardo','Velasco','Perez',1),
	(2,1,'Rosa','Tellez','Arce',1),
	(3,2,'Javiera','Bozzo','Papic',1),
	(4,2,'Laura','Rakitic','Peric',1),
	(5,2,'Mario','Alderete','Alvarez',1),
	(6,3,'Estaban','Soto','Kross',1);

/*!40000 ALTER TABLE `profesional` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sucursal
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sucursal`;

CREATE TABLE `sucursal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `habilitado` tinyint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;

INSERT INTO `sucursal` (`id`, `nombre`, `direccion`, `habilitado`)
VALUES
	(1,'Los Militares','Los Militares 4777',1),
	(2,'Badajoz','Badajoz 45',1);

/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

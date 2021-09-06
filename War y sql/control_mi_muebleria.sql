-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: control_mi_muebleria
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `Nit` varchar(10) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Municipio` varchar(45) DEFAULT NULL,
  `Departamento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Nit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES ('12345-6','Oscar Flores',NULL,NULL,NULL),('324777-7','Brandon JosuÃ© Pinto MÃ©ndez',NULL,NULL,'Huehuetenango'),('333333','David',NULL,NULL,NULL),('33333xd','Pancho Villa',NULL,'Jacaltenango',NULL);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ensamble_muebles`
--

DROP TABLE IF EXISTS `ensamble_muebles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ensamble_muebles` (
  `IdEnsamble` int NOT NULL AUTO_INCREMENT,
  `NombreDeMueble` varchar(100) NOT NULL,
  `NombreDePieza` varchar(100) NOT NULL,
  `CantidadPieza` int NOT NULL,
  `IdPieza` int NOT NULL,
  `CostoPieza` decimal(10,2) NOT NULL,
  PRIMARY KEY (`IdEnsamble`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ensamble_muebles`
--

LOCK TABLES `ensamble_muebles` WRITE;
/*!40000 ALTER TABLE `ensamble_muebles` DISABLE KEYS */;
INSERT INTO `ensamble_muebles` VALUES (1,'Mesa de Roble','Plancha',1,9,12.00),(2,'Mesa de Roble','Pata de Roble',2,18,20.21),(3,'Mesa de Roble','Pata de roble',2,17,32.00);
/*!40000 ALTER TABLE `ensamble_muebles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas` (
  `IdFactura` int NOT NULL AUTO_INCREMENT,
  `CodigoFactura` varchar(5) NOT NULL,
  `NombreMueble` varchar(100) NOT NULL,
  `PrecioProducto` decimal(10,2) NOT NULL,
  `Fecha` date NOT NULL,
  `NitComprador` varchar(10) NOT NULL,
  `Autor` varchar(100) NOT NULL,
  PRIMARY KEY (`IdFactura`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (1,'F0000','Seleccione una opcion',-1.00,'2021-09-06','12345-6','Ventas'),(2,'F0001','Messi Pecho Frio',1000.50,'2021-09-06','12345-6','Ventas'),(3,'F0001','Mesa de Roble',1000.25,'2021-09-06','12345-6','Ventas'),(4,'F0000','Marco de roble',150.00,'2021-09-06','12345-6','Ventas'),(5,'F0002','Messi Pecho Frio',1000.50,'2021-09-06','324777-7','Ventas'),(6,'F0003','Messi Pecho Frio',1000.50,'2021-09-06','333333','Ventas'),(7,'F0003','Messi Pecho Frio',1000.50,'2021-09-06','333333','Ventas'),(8,'F0003','Mesa de Roble',1000.25,'2021-09-06','333333','Ventas'),(9,'F0003','Mesa de Roble',1000.25,'2021-09-06','333333','Ventas'),(10,'F0003','Mesa de Roble',1000.25,'2021-09-06','333333','Ventas'),(11,'F0004','Mesa de Roble',1000.25,'2021-09-06','324777-7','Ventas'),(12,'F0004','Mesa de Roble',1000.25,'2021-09-06','324777-7','Ventas'),(13,'F0004','Mesa de Roble',1000.25,'2021-09-06','324777-7','Ventas'),(14,'F0004','Mesa de Roble',1000.25,'2021-09-06','324777-7','Ventas'),(15,'F0005','Mesa de Roble',1000.25,'2021-09-06','324777-7','Coca'),(16,'F0005','Pato de madera',200.00,'2021-09-06','324777-7','Coca'),(17,'F0005','Pato de madera',200.00,'2021-09-06','324777-7','Coca');
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muebles`
--

DROP TABLE IF EXISTS `muebles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `muebles` (
  `Nombre` varchar(45) NOT NULL,
  `Creador` varchar(45) NOT NULL,
  `FechaEnsamble` date NOT NULL,
  `Precio` decimal(20,2) DEFAULT NULL,
  `VecesVendido` int NOT NULL,
  `Existencias` int NOT NULL,
  PRIMARY KEY (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muebles`
--

LOCK TABLES `muebles` WRITE;
/*!40000 ALTER TABLE `muebles` DISABLE KEYS */;
INSERT INTO `muebles` VALUES ('Marco de roble','Admin','2021-09-05',150.00,0,0),('Mesa de Roble','Admin','2021-09-05',1000.25,2,991),('Messi Pecho Frio','Admin','2020-03-12',1000.50,2,996),('Pato de madera','Admin','2021-10-11',200.00,2,0);
/*!40000 ALTER TABLE `muebles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piezas`
--

DROP TABLE IF EXISTS `piezas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `piezas` (
  `Id_Pieza` int NOT NULL AUTO_INCREMENT,
  `Nombre_Pieza` varchar(100) NOT NULL,
  `Costo` decimal(15,2) unsigned NOT NULL,
  `existencias` int NOT NULL,
  PRIMARY KEY (`Id_Pieza`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piezas`
--

LOCK TABLES `piezas` WRITE;
/*!40000 ALTER TABLE `piezas` DISABLE KEYS */;
INSERT INTO `piezas` VALUES (9,'Plancha',12.00,7),(13,'13xd',24.05,10),(15,'Plancha de abeto',100.00,10),(16,'Plancha de abedul',233.00,10),(17,'Pata de roble',32.00,4),(18,'Pata de Roble ',20.21,4);
/*!40000 ALTER TABLE `piezas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `Nick` varchar(45) NOT NULL,
  `Contraseña` varchar(20) NOT NULL,
  `Activo` tinyint(1) NOT NULL,
  `Area` int NOT NULL,
  PRIMARY KEY (`Nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('Admin','1111',1,3),('Coca','1',1,2),('Fabrica','1111',1,1),('Muerto','1111',0,1),('Ventas','1111',1,2),('xdxd','XDXD',1,0);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-06 15:51:41

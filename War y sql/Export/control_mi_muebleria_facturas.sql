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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-06 13:58:32

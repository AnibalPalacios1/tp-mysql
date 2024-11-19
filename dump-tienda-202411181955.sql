-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: tienda
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE `tienda` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
--
-- Table structure for table `categoriasproductos`
--

DROP TABLE IF EXISTS `categoriasproductos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoriasproductos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` tinytext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoriasproductos`
--

LOCK TABLES `categoriasproductos` WRITE;
/*!40000 ALTER TABLE `categoriasproductos` DISABLE KEYS */;
INSERT INTO `categoriasproductos` VALUES (1,'Tortas','Tortas y postres','2024-11-09 13:27:02'),(2,'Facturas','Medialunas y Jesuitas','2024-11-09 13:27:02'),(3,'Lingotes','Postres en forma de lingotes','2024-11-09 13:27:02'),(4,'Cookies','Galletitas especiales, Red Velvet, MyM, chocolate','2024-11-09 13:27:02'),(5,'Panificacion','Panes de todo tipo, cremonas, bizcochitos','2024-11-09 13:27:02');
/*!40000 ALTER TABLE `categoriasproductos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `correo_electronico` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Palacios, Anibal','Francia 2530','anibalmpalacios@gmail.com','2024-11-09 13:00:22'),(2,'Polvaran Nadia','Francia 2530','nadia@gmail.com','2024-11-09 13:00:22'),(3,'Perez, Juan','Italia 150','juanperez@gmail.com','2024-11-09 13:00:22'),(4,'Gomez, Carlos','Moreno 2890','carlosg100@gmail.com','2024-11-09 13:00:22'),(5,'Frutos, Daniel','Jujuy 4550','frutasdaniel@hotmail.com','2024-11-09 13:00:22');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleordenes`
--

DROP TABLE IF EXISTS `detalleordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalleordenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orden_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_orden` (`orden_id`),
  KEY `fk_producto` (`producto_id`),
  CONSTRAINT `fk_orden` FOREIGN KEY (`orden_id`) REFERENCES `ordenes` (`ID`),
  CONSTRAINT `fk_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleordenes`
--

LOCK TABLES `detalleordenes` WRITE;
/*!40000 ALTER TABLE `detalleordenes` DISABLE KEYS */;
INSERT INTO `detalleordenes` VALUES (1,1,1,1,18000.00,18000.00,'2024-11-18 21:56:23'),(2,1,4,8,1980.00,15840.00,'2024-11-18 21:57:19'),(3,2,5,3,2500.00,7500.00,'2024-11-18 22:09:18'),(4,2,2,12,600.00,7200.00,'2024-11-18 22:10:48'),(5,2,3,12,600.00,7200.00,'2024-11-18 22:12:22'),(6,3,2,24,600.00,14400.00,'2024-11-18 22:16:33'),(7,4,4,6,1980.00,11880.00,'2024-11-18 22:19:44'),(8,4,1,1,18000.00,18000.00,'2024-11-18 22:20:24'),(9,4,3,12,600.00,7200.00,'2024-11-18 22:21:30'),(10,5,1,1,18000.00,18000.00,'2024-11-18 22:22:26'),(11,5,4,3,1980.00,5940.00,'2024-11-18 22:23:19'),(12,5,2,12,600.00,7200.00,'2024-11-18 22:23:49'),(13,5,5,2,2500.00,5000.00,'2024-11-18 22:24:33');
/*!40000 ALTER TABLE `detalleordenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `puesto` varchar(50) DEFAULT NULL,
  `fecha_contratacion` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Josue','vendedor','2022-01-01','2024-11-09 13:13:35'),(2,'Paula','vendedor','2020-10-01','2024-11-09 13:13:35'),(3,'Marcos','repositor','2023-12-01','2024-11-09 13:13:35'),(4,'Mariela','administrativa','2010-03-01','2024-11-09 13:13:35'),(5,'Denis','vendedor','2018-05-01','2024-11-09 13:13:35');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenes`
--

DROP TABLE IF EXISTS `ordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) DEFAULT NULL,
  `fecha_orden` date DEFAULT NULL,
  `estado` varchar(15) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `fk_cliente` (`cliente_id`),
  CONSTRAINT `fk_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes`
--

LOCK TABLES `ordenes` WRITE;
/*!40000 ALTER TABLE `ordenes` DISABLE KEYS */;
INSERT INTO `ordenes` VALUES (1,1,'2024-11-10','FACTURADO',33840.00,'2024-11-18 21:55:18'),(2,2,'2024-11-12','FACTURADO',21900.00,'2024-11-18 21:58:12'),(3,3,'2024-11-12','FACTURADO',14400.00,'2024-11-18 21:58:37'),(4,5,'2024-11-18','ENVIADO',37080.00,'2024-11-18 21:59:34'),(5,4,'2024-11-18','EN PREPARACION',36140.00,'2024-11-18 22:00:36');
/*!40000 ALTER TABLE `ordenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` tinytext DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `cantidad_stock` int(11) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_categorias_productos` (`categoria_id`),
  CONSTRAINT `fk_categorias_productos` FOREIGN KEY (`categoria_id`) REFERENCES `categoriasproductos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Brownie','Brownie con dulce de leche y nueces',18000.00,5,1,'2024-11-09 13:37:19'),(2,'Medialunas','Medialunas dulces x unidad',600.00,36,2,'2024-11-09 13:37:19'),(3,'Jesuitas','Jesuitas x unidad',600.00,48,2,'2024-11-09 13:37:19'),(4,'Cookies Red Velvet','Cookies grandes x unidad',1980.00,12,4,'2024-11-09 13:37:19'),(5,'Pan Casero','Pan casero grande',2500.00,8,5,'2024-11-09 13:37:19');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) DEFAULT NULL,
  `empleado_id` int(11) DEFAULT NULL,
  `fecha_venta` date DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `empleado_id` (`empleado_id`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,2,'2024-11-10',33840.00,'2024-11-18 22:49:10'),(2,2,4,'2024-11-12',21900.00,'2024-11-18 22:49:10'),(3,3,2,'2024-11-12',14400.00,'2024-11-18 22:49:10'),(4,5,5,'2024-11-18',37080.00,'2024-11-18 22:49:10'),(5,4,1,'2024-11-18',36140.00,'2024-11-18 22:49:10');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'tienda'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-18 19:55:03

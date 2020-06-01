CREATE DATABASE  IF NOT EXISTS `proyecto_final_tienda` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `proyecto_final_tienda`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: proyecto_final_tienda
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `carro_compra`
--

DROP TABLE IF EXISTS `carro_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carro_compra` (
  `correo_electronico` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Clave_Producto` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Cantidad` int(11) NOT NULL,
  PRIMARY KEY (`correo_electronico`,`Clave_Producto`),
  KEY `fk_CARRO_COMPRA_INVENTARIO1_idx` (`Clave_Producto`),
  CONSTRAINT `fk_CARRO_COMPRA_INVENTARIO1` FOREIGN KEY (`Clave_Producto`) REFERENCES `inventario` (`Clave_Producto`),
  CONSTRAINT `fk_CARRO_COMPRA_USUARIO1` FOREIGN KEY (`correo_electronico`) REFERENCES `usuario` (`correo_electronico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carro_compra`
--

LOCK TABLES `carro_compra` WRITE;
/*!40000 ALTER TABLE `carro_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `carro_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `Nombre_Cat` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Descripcion` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Nombre_Cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES ('Children','Clothes to be used and enjoyed by your baby.'),('Men','Men clothes ideal for different situations.'),('Women','Women clothes ideal for diverse scenarios.');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `Clave_Producto` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nombre_Producto` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Categoria_Producto` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Descripcion` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Talla` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Precio` decimal(6,2) NOT NULL,
  `Fotografia` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Piezas_Disponibles` int(11) NOT NULL,
  PRIMARY KEY (`Clave_Producto`),
  KEY `fk_INVENTARIO_CATEGORIA1_idx` (`Categoria_Producto`),
  CONSTRAINT `fk_INVENTARIO_CATEGORIA1` FOREIGN KEY (`Categoria_Producto`) REFERENCES `categoria` (`Nombre_Cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES ('6455621520','Green Rose SweatShirt','Women','Green Sweatshirt with rose','Green','S',385.00,'SudaderaVerdeMujer.png',24),('6455621521','Green Rose SweatShirt','Women','Green Sweatshirt with rose','Green','M',385.00,'SudaderaVerdeMujer.png',31),('6455621522','Green Rose SweatShirt','Women','Green Sweatshirt with rose','Green','L',385.00,'SudaderaVerdeMujer.png',27),('6512023950','Blue Request SweatShirt','Men','Blue Sweatshirt with request icon','Blue','S',395.00,'SudaderaAzulHombre.png',20),('6512023951','Blue Request SweatShirt','Men','Blue Sweatshirt with request icon','Blue','M',395.00,'SudaderaAzulHombre.png',21),('6512023952','Blue Request SweatShirt','Men','Blue Sweatshirt with request icon','Blue','L',395.00,'SudaderaAzulHombre.png',29),('6547888100','Blue Cat and Coffee SweatShirt','Women','Blue Sweatshirt with black street graffiti','Blue','S',400.00,'SudaderaAzulMujer.png',30),('6547888101','Blue Cat and Coffee SweatShirt','Women','Blue Sweatshirt with black street graffiti','Blue','M',400.00,'SudaderaAzulMujer.png',26),('6547888102','Blue Cat and Coffee SweatShirt','Women','Blue Sweatshirt with black street graffiti','Blue','L',400.00,'SudaderaAzulMujer.png',22),('6897456210','Red Street Graffiti SweatShirt','Men','Red Sweatshirt with black street graffiti','Red','S',355.00,'SudaderaRojaHombre.png',27),('6897456211','Red Street Graffiti SweatShirt','Men','Red Sweatshirt with black street graffiti','Red','M',355.00,'SudaderaRojaHombre.png',32),('6897456212','Red Street Graffiti SweatShirt','Men','Red Sweatshirt with black street graffiti','Red','L',355.00,'SudaderaRojaHombre.png',23),('7123569840','Blue Parrot T-Shirt','Men','Blue T-shirt with multicolor parrot','Blue','S',205.00,'PlayeraAzulHombre.png',20),('7123569841','Blue Parrot T-Shirt','Men','Blue T-shirt with multicolor parrot','Blue','M',205.00,'PlayeraAzulHombre.png',25),('7123569842','Blue Parrot T-Shirt','Men','Blue T-shirt with multicolor parrot','Blue','L',205.00,'PlayeraAzulHombre.png',28),('7201236570','Green My First Hero T-shirt','Children','Green T-shirt with My First Hero legend','Green','S',200.00,'PlayeraVerdeChild2.png',24),('7201236571','Green My First Hero T-shirt','Children','Green T-shirt with My First Hero legend','Green','M',200.00,'PlayeraVerdeChild2.png',26),('7201236572','Green My First Hero T-shirt','Children','Green T-shirt with My First Hero legend','Green','L',200.00,'PlayeraVerdeChild2.png',35),('7202356410','Red Paper plane T-shirt','Women','Red T-shirt with white paper plane','Red','S',202.00,'PlayeraMujerRoja.png',27),('7202356411','Red Paper plane T-shirt','Women','Red T-shirt with white paper plane','Red','M',202.00,'PlayeraMujerRoja.png',21),('7202356412','Red Paper plane T-shirt','Women','Red T-shirt with white paper plane','Red','L',202.00,'PlayeraMujerRoja.png',16),('7203698410','Red Delorean T-shirt','Men','Red T-shirt with Delorean car','Red','S',195.00,'PlayeraRojaMen2.png',22),('7203698411','Red Delorean T-shirt','Men','Red T-shirt with Delorean car','Red','M',195.00,'PlayeraRojaMen2.png',22),('7203698412','Red Delorean T-shirt','Men','Red T-shirt with Delorean car','Red','L',195.00,'PlayeraRojaMen2.png',31),('7411125230','Green Dinosaur T-shirt','Children','Green T-shirt with blue Dinosaur','Green','S',196.00,'PlayeraVerdeChild.png',22),('7411125231','Green Dinosaur T-shirt','Children','Green T-shirt with blue Dinosaur','Green','M',196.00,'PlayeraVerdeChild.png',28),('7411125232','Green Dinosaur T-shirt','Children','Green T-shirt with blue Dinosaur','Green','L',196.00,'PlayeraVerdeChild.png',27),('7412639850','Red Arrow T-shirt','Men','Red T-shirt with multicolor arrow','Red','S',200.00,'PlayeraRojaMen.png',23),('7412639851','Red Arrow T-shirt','Men','Red T-shirt with multicolor arrow','Red','M',200.00,'PlayeraRojaMen.png',26),('7412639852','Red Arrow T-shirt','Men','Red T-shirt with multicolor arrow','Red','L',200.00,'PlayeraRojaMen.png',32),('7452842560','Green Surf Shop T-shirt','Men','Green T-shirt with Surf Shop icon','Green','S',260.00,'PlayeraVerdeMen.png',30),('7452842561','Green Surf Shop T-shirt','Men','Green T-shirt with Surf Shop icon','Green','M',260.00,'PlayeraVerdeMen.png',26),('7452842562','Green Surf Shop T-shirt','Men','Green T-shirt with Surf Shop icon','Green','L',260.00,'PlayeraVerdeMen.png',27),('7455621500','Red Monster T-shirt','Children','Purple T-shirt funny friendly monster','Red','S',205.00,'PlayeraChildRoja.png',28),('7455621501','Red Monster T-shirt','Children','Purple T-shirt funny friendly monster','Red','M',205.00,'PlayeraChildRoja.png',34),('7455621502','Red Monster T-shirt','Children','Purple T-shirt funny friendly monster','Red','L',205.00,'PlayeraChildRoja.png',21),('7485962100','Purple Yoda T-shirt','Women','Purple T-shirt with adorable baby Yoda ','Purple','S',215.00,'PlayeraMujerMorada.png',33),('7485962101','Purple Yoda T-shirt','Women','Purple T-shirt with adorable baby Yoda ','Purple','M',215.00,'PlayeraMujerMorada.png',21),('7485962102','Purple Yoda T-shirt','Women','Purple T-shirt with adorable baby Yoda ','Purple','L',215.00,'PlayeraMujerMorada.png',23),('7486974200','Purple Sun T-shirt','Men','Purple T-shirt with sun between clouds','Purple','S',175.00,'PlayeraMoradaMen.png',30),('7486974201','Purple Sun T-shirt','Men','Purple T-shirt with sun between clouds','Purple','M',175.00,'PlayeraMoradaMen.png',24),('7486974202','Purple Sun T-shirt','Men','Purple T-shirt with sun between clouds','Purple','L',175.00,'PlayeraMoradaMen.png',22),('7552320150','Blue Nasa T-shirt','Women','Blue T-shirt with Nada logo','Blue','S',220.00,'PlayeraAzulMujer.png',25),('7552320151','Blue Nasa T-shirt','Women','Blue T-shirt with Nada logo','Blue','M',220.00,'PlayeraAzulMujer.png',31),('7552320152','Blue Nasa T-shirt','Women','Blue T-shirt with Nada logo','Blue','L',220.00,'PlayeraAzulMujer.png',20),('7632159850','Blue Arrow T-Shirt','Men','Blue T-shirt with multicolor arrow','Blue','S',190.00,'PlayeraAzulHombre2.png',26),('7632159851','Blue Arrow T-Shirt','Men','Blue T-shirt with multicolor arrow','Blue','M',190.00,'PlayeraAzulHombre2.png',31),('7632159852','Blue Arrow T-Shirt','Men','Blue T-shirt with multicolor arrow','Blue','L',190.00,'PlayeraAzulHombre2.png',21),('7860222010','Blue Apollo T-Shirt','Children','Blue T-shirt with Apollo logo','Blue','S',200.00,'PlayeraAzulChild.png',27),('7860222011','Blue Apollo T-Shirt','Children','Blue T-shirt with Apollo logo','Blue','M',200.00,'PlayeraAzulChild.png',23),('7860222012','Blue Apollo T-Shirt','Children','Blue T-shirt with Apollo logo','Blue','L',200.00,'PlayeraAzulChild.png',31),('7895541680','Purple Worm T-shirt','Children','Purple T-shrrt with colorful worm','Purple','S',210.00,'PlayeraMoradaChild.png',33),('7895541681','Purple Worm T-shirt','Children','Purple T-shrrt with colorful worm','Purple','M',210.00,'PlayeraMoradaChild.png',25),('7895541682','Purple Worm T-shirt','Children','Purple T-shrrt with colorful worm','Purple','L',210.00,'PlayeraMoradaChild.png',20),('7896522410','Purple Phantom T-shirt','Children','Purple T-shirt with phantom and ice cream','Purple','S',200.00,'PlayeraMoradaChild2.png',14),('7896522411','Purple Phantom T-shirt','Children','Purple T-shirt with phantom and ice cream','Purple','M',200.00,'PlayeraMoradaChild2.png',21),('7896522412','Purple Phantom T-shirt','Children','Purple T-shirt with phantom and ice cream','Purple','L',200.00,'PlayeraMoradaChild2.png',24),('7899666510','Red Cat and Coffee T-shirt','Women','Red T-shirt with kitten inside a cup','Red','S',185.00,'PlayeraMujerRoja2.png',32),('7899666511','Red Cat and Coffee T-shirt','Women','Red T-shirt with kitten inside a cup','Red','M',185.00,'PlayeraMujerRoja2.png',23),('7899666512','Red Cat and Coffee T-shirt','Women','Red T-shirt with kitten inside a cup','Red','L',185.00,'PlayeraMujerRoja2.png',37);
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `Clave_Producto` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `No_Transaccion` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  PRIMARY KEY (`Clave_Producto`,`No_Transaccion`),
  KEY `fk_PRODUCTOS_TRANSACCION1_idx` (`No_Transaccion`),
  CONSTRAINT `fk_PRODUCTOS_INVENTARIO1` FOREIGN KEY (`Clave_Producto`) REFERENCES `inventario` (`Clave_Producto`),
  CONSTRAINT `fk_PRODUCTOS_TRANSACCION1` FOREIGN KEY (`No_Transaccion`) REFERENCES `transaccion` (`No_Transaccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaccion`
--

DROP TABLE IF EXISTS `transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaccion` (
  `No_Transaccion` int(11) NOT NULL AUTO_INCREMENT,
  `Correo_Cliente` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nombre_cliente` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Fecha-Hora` datetime NOT NULL,
  `Forma_Pago` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Monto_total` decimal(9,2) NOT NULL,
  PRIMARY KEY (`No_Transaccion`),
  KEY `fk_TRANSACCION_USUARIO1_idx` (`Correo_Cliente`,`Nombre_cliente`),
  CONSTRAINT `fk_TRANSACCION_USUARIO1` FOREIGN KEY (`Correo_Cliente`, `Nombre_cliente`) REFERENCES `usuario` (`correo_electronico`, `Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion`
--

LOCK TABLES `transaccion` WRITE;
/*!40000 ALTER TABLE `transaccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `correo_electronico` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Apellidos` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Contra` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Direccion` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Codigo_postal` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Telefono` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`correo_electronico`,`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('andres@gmail.com','Andres','Barragan','123456','a1','01869','5562518495','N');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-01 14:00:56

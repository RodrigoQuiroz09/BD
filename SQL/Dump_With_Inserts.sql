CREATE DATABASE  IF NOT EXISTS `proyecto_final_tienda` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `proyecto_final_tienda`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: proyecto_final_tienda
-- ------------------------------------------------------
-- Server version	5.7.28

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
  CONSTRAINT `fk_CARRO_COMPRA_INVENTARIO1` FOREIGN KEY (`Clave_Producto`) REFERENCES `inventario` (`Clave_Producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CARRO_COMPRA_USUARIO1` FOREIGN KEY (`correo_electronico`) REFERENCES `usuario` (`correo_electronico`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  CONSTRAINT `fk_INVENTARIO_CATEGORIA1` FOREIGN KEY (`Categoria_Producto`) REFERENCES `categoria` (`Nombre_Cat`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES ('645562152L','Green Rose SweatShirt','Women','Green Sweatshirt with rose','Green','L',385.00,'SudaderaVerdeMujer.png',27),('645562152M','Green Rose SweatShirt','Women','Green Sweatshirt with rose','Green','M',385.00,'SudaderaVerdeMujer.png',31),('645562152S','Green Rose SweatShirt','Women','Green Sweatshirt with rose','Green','S',385.00,'SudaderaVerdeMujer.png',24),('651202395L','Blue Request SweatShirt','Men','Blue Sweatshirt with request icon','Blue','L',395.00,'SudaderaAzulHombre.png',29),('651202395M','Blue Request SweatShirt','Men','Blue Sweatshirt with request icon','Blue','M',395.00,'SudaderaAzulHombre.png',24),('651202395S','Blue Request SweatShirt','Men','Blue Sweatshirt with request icon','Blue','S',395.00,'SudaderaAzulHombre.png',20),('654788810L','Blue Cat and Coffee SweatShirt','Women','Blue Sweatshirt with black street graffiti','Blue','L',400.00,'SudaderaAzulMujer.png',22),('654788810M','Blue Cat and Coffee SweatShirt','Women','Blue Sweatshirt with black street graffiti','Blue','M',400.00,'SudaderaAzulMujer.png',26),('654788810S','Blue Cat and Coffee SweatShirt','Women','Blue Sweatshirt with black street graffiti','Blue','S',400.00,'SudaderaAzulMujer.png',30),('689745621L','Red Street Graffiti SweatShirt','Men','Red Sweatshirt with black street graffiti','Red','L',355.00,'SudaderaRojaHombre.png',23),('689745621M','Red Street Graffiti SweatShirt','Men','Red Sweatshirt with black street graffiti','Red','M',355.00,'SudaderaRojaHombre.png',32),('689745621S','Red Street Graffiti SweatShirt','Men','Red Sweatshirt with black street graffiti','Red','S',355.00,'SudaderaRojaHombre.png',27),('712356984L','Blue Parrot T-Shirt','Men','Blue T-shirt with multicolor parrot','Blue','L',205.00,'PlayeraAzulHombre.png',31),('712356984M','Blue Parrot T-Shirt','Men','Blue T-shirt with multicolor parrot','Blue','M',205.00,'PlayeraAzulHombre.png',30),('712356984S','Blue Parrot T-Shirt','Men','Blue T-shirt with multicolor parrot','Blue','S',205.00,'PlayeraAzulHombre.png',27),('720123657L','Green My First Hero T-shirt','Children','Green T-shirt with My First Hero legend','Green','L',200.00,'PlayeraVerdeChild2.png',35),('720123657M','Green My First Hero T-shirt','Children','Green T-shirt with My First Hero legend','Green','M',200.00,'PlayeraVerdeChild2.png',31),('720123657S','Green My First Hero T-shirt','Children','Green T-shirt with My First Hero legend','Green','S',200.00,'PlayeraVerdeChild2.png',24),('720235641L','Red Paper plane T-shirt','Women','Red T-shirt with white paper plane','Red','L',202.00,'PlayeraMujerRoja.png',18),('720235641M','Red Paper plane T-shirt','Women','Red T-shirt with white paper plane','Red','M',202.00,'PlayeraMujerRoja.png',21),('720235641S','Red Paper plane T-shirt','Women','Red T-shirt with white paper plane','Red','S',202.00,'PlayeraMujerRoja.png',27),('720369841L','Red Delorean T-shirt','Men','Red T-shirt with Delorean car','Red','L',195.00,'PlayeraRojaMen2.png',31),('720369841M','Red Delorean T-shirt','Men','Red T-shirt with Delorean car','Red','M',195.00,'PlayeraRojaMen2.png',22),('720369841S','Red Delorean T-shirt','Men','Red T-shirt with Delorean car','Red','S',195.00,'PlayeraRojaMen2.png',25),('741112523L','Green Dinosaur T-shirt','Children','Green T-shirt with blue Dinosaur','Green','L',196.00,'PlayeraVerdeChild.png',27),('741112523M','Green Dinosaur T-shirt','Children','Green T-shirt with blue Dinosaur','Green','M',196.00,'PlayeraVerdeChild.png',28),('741112523S','Green Dinosaur T-shirt','Children','Green T-shirt with blue Dinosaur','Green','S',196.00,'PlayeraVerdeChild.png',22),('741263985L','Red Arrow T-shirt','Men','Red T-shirt with multicolor arrow','Red','L',200.00,'PlayeraRojaMen.png',32),('741263985M','Red Arrow T-shirt','Men','Red T-shirt with multicolor arrow','Red','M',200.00,'PlayeraRojaMen.png',26),('741263985S','Red Arrow T-shirt','Men','Red T-shirt with multicolor arrow','Red','S',200.00,'PlayeraRojaMen.png',23),('745284256L','Green Surf Shop T-shirt','Men','Green T-shirt with Surf Shop icon','Green','L',260.00,'PlayeraVerdeMen.png',27),('745284256M','Green Surf Shop T-shirt','Men','Green T-shirt with Surf Shop icon','Green','M',260.00,'PlayeraVerdeMen.png',26),('745284256S','Green Surf Shop T-shirt','Men','Green T-shirt with Surf Shop icon','Green','S',260.00,'PlayeraVerdeMen.png',30),('745562150L','Red Monster T-shirt','Children','Purple T-shirt funny friendly monster','Red','L',205.00,'PlayeraChildRoja.png',21),('745562150M','Red Monster T-shirt','Children','Purple T-shirt funny friendly monster','Red','M',205.00,'PlayeraChildRoja.png',34),('745562150S','Red Monster T-shirt','Children','Purple T-shirt funny friendly monster','Red','S',205.00,'PlayeraChildRoja.png',28),('748596210L','Purple Yoda T-shirt','Women','Purple T-shirt with adorable baby Yoda ','Purple','L',215.00,'PlayeraMujerMorada.png',23),('748596210M','Purple Yoda T-shirt','Women','Purple T-shirt with adorable baby Yoda ','Purple','M',215.00,'PlayeraMujerMorada.png',21),('748596210S','Purple Yoda T-shirt','Women','Purple T-shirt with adorable baby Yoda ','Purple','S',215.00,'PlayeraMujerMorada.png',33),('748697420L','Purple Sun T-shirt','Men','Purple T-shirt with sun between clouds','Purple','L',175.00,'PlayeraMoradaMen.png',22),('748697420M','Purple Sun T-shirt','Men','Purple T-shirt with sun between clouds','Purple','M',175.00,'PlayeraMoradaMen.png',24),('748697420S','Purple Sun T-shirt','Men','Purple T-shirt with sun between clouds','Purple','S',175.00,'PlayeraMoradaMen.png',30),('755232015L','Blue Nasa T-shirt','Women','Blue T-shirt with Nada logo','Blue','L',220.00,'PlayeraAzulMujer.png',20),('755232015M','Blue Nasa T-shirt','Women','Blue T-shirt with Nada logo','Blue','M',220.00,'PlayeraAzulMujer.png',31),('755232015S','Blue Nasa T-shirt','Women','Blue T-shirt with Nada logo','Blue','S',220.00,'PlayeraAzulMujer.png',25),('763215985L','Blue Arrow T-Shirt','Men','Blue T-shirt with multicolor arrow','Blue','L',190.00,'PlayeraAzulHombre2.png',21),('763215985M','Blue Arrow T-Shirt','Men','Blue T-shirt with multicolor arrow','Blue','M',190.00,'PlayeraAzulHombre2.png',31),('763215985S','Blue Arrow T-Shirt','Men','Blue T-shirt with multicolor arrow','Blue','S',190.00,'PlayeraAzulHombre2.png',26),('786022201L','Blue Apollo T-Shirt','Children','Blue T-shirt with Apollo logo','Blue','L',200.00,'PlayeraAzulChild.png',31),('786022201M','Blue Apollo T-Shirt','Children','Blue T-shirt with Apollo logo','Blue','M',200.00,'PlayeraAzulChild.png',23),('786022201S','Blue Apollo T-Shirt','Children','Blue T-shirt with Apollo logo','Blue','S',200.00,'PlayeraAzulChild.png',27),('789554168L','Purple Worm T-shirt','Children','Purple T-shrrt with colorful worm','Purple','L',210.00,'PlayeraMoradaChild.png',20),('789554168M','Purple Worm T-shirt','Children','Purple T-shrrt with colorful worm','Purple','M',210.00,'PlayeraMoradaChild.png',25),('789554168S','Purple Worm T-shirt','Children','Purple T-shrrt with colorful worm','Purple','S',210.00,'PlayeraMoradaChild.png',33),('789652241L','Purple Phantom T-shirt','Children','Purple T-shirt with phantom and ice cream','Purple','L',200.00,'PlayeraMoradaChild2.png',24),('789652241M','Purple Phantom T-shirt','Children','Purple T-shirt with phantom and ice cream','Purple','M',200.00,'PlayeraMoradaChild2.png',21),('789652241S','Purple Phantom T-shirt','Children','Purple T-shirt with phantom and ice cream','Purple','S',200.00,'PlayeraMoradaChild2.png',14),('789966651L','Red Cat and Coffee T-shirt','Women','Red T-shirt with kitten inside a cup','Red','L',185.00,'PlayeraMujerRoja2.png',37),('789966651M','Red Cat and Coffee T-shirt','Women','Red T-shirt with kitten inside a cup','Red','M',185.00,'PlayeraMujerRoja2.png',23),('789966651S','Red Cat and Coffee T-shirt','Women','Red T-shirt with kitten inside a cup','Red','S',185.00,'PlayeraMujerRoja2.png',32);
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
  CONSTRAINT `fk_PRODUCTOS_INVENTARIO1` FOREIGN KEY (`Clave_Producto`) REFERENCES `inventario` (`Clave_Producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRODUCTOS_TRANSACCION1` FOREIGN KEY (`No_Transaccion`) REFERENCES `transaccion` (`No_Transaccion`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  CONSTRAINT `fk_TRANSACCION_USUARIO1` FOREIGN KEY (`Correo_Cliente`, `Nombre_cliente`) REFERENCES `usuario` (`correo_electronico`, `Nombre`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'proyecto_final_tienda'
--

--
-- Dumping routines for database 'proyecto_final_tienda'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-31 18:04:24

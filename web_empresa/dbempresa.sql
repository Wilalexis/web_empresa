-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: dbempresa
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `carrito_compras`
--

DROP TABLE IF EXISTS `carrito_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito_compras` (
  `id_carrito_compras` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `id_pago` int DEFAULT NULL,
  `fecha_compras` varchar(45) DEFAULT NULL,
  `monto` double DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_carrito_compras`),
  KEY `id_cliente_carrito_compras_clientes_idx` (`id_cliente`),
  KEY `id_pago_carrito_compras_pago_idx` (`id_pago`),
  CONSTRAINT `id_cliente_carrito_compras_clientes` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `id_pago_carrito_compras_pago` FOREIGN KEY (`id_pago`) REFERENCES `pago` (`id_pago`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito_compras`
--

LOCK TABLES `carrito_compras` WRITE;
/*!40000 ALTER TABLE `carrito_compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrito_compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(60) DEFAULT NULL,
  `apellidos` varchar(60) DEFAULT NULL,
  `nit` varchar(12) DEFAULT NULL,
  `genero` varchar(30) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `correo_electronico` varchar(45) DEFAULT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Juan','Pedro','3343342-9','Masculino','32123343','holi1@gmail.com','2020-01-01 09:23:12'),(3,'Camilo','Garcia','1235612-1','Masculino','12311123','cam1@hotmail.com','2020-10-14 01:09:22'),(4,'Lisa','Simpson','12343889-0','Femenino','33443216','lisas@hotmail.com','2020-11-04 01:00:27'),(5,'Guillermo','Ruiz','12332188-3','Masculino','23234412','gruiz@outlook.com','2020-11-08 02:11:08'),(6,'Ary','Marroquin','12212345-1','Femenino','12113452','jyary7@gmail.com','2020-11-08 14:55:35'),(7,'Jimena','Gonzales','31122341-1','Femenino','11134432','jgomz5@hotmail.com','2020-11-08 15:11:29'),(8,'Alberto','Hernandez','87364516-9','Masculino','12312213','alberto9@gmail.com','2020-11-08 15:16:44'),(10,'Alessa','Juarez','31234556-7','Femenino','13334432','ajuss1@gmail.com','2020-11-08 15:35:12'),(11,'Sandra Fernanda','Choc Morales','2134469-1','Femenino','12333210','sfer12@yahoo.es','2020-11-10 21:03:16'),(12,'Pedro','Ramirez','13445699-1','Masculino','23188978','pramirez12@hotmail.com','2020-11-10 21:12:41');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `no_orden_compra` int NOT NULL,
  `id_proveedor` int NOT NULL,
  `fecha_orden` date DEFAULT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `id_proveedor_compras_proveedores_idx` (`id_proveedor`),
  CONSTRAINT `id_proveedor_compras_proveedores` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,1,2,'2020-09-08','2020-09-08 15:00:00'),(2,23,4,'2020-11-08','2022-09-08 21:00:00'),(4,2,3,'2020-11-08','2020-11-08 19:14:37'),(5,3,2,'2020-11-10','2020-11-10 21:27:52');
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras_detalle`
--

DROP TABLE IF EXISTS `compras_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras_detalle` (
  `id_compras_detalle` bigint NOT NULL AUTO_INCREMENT,
  `id_compra` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int DEFAULT NULL,
  `costo_precio_unitario` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id_compras_detalle`),
  KEY `id_producto_compras_detalle_productos_idx` (`id_producto`),
  KEY `id_compra_compras_detalle_compras_idx` (`id_compra`),
  CONSTRAINT `id_compra_compras_detalle_compras` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`id_compra`) ON UPDATE CASCADE,
  CONSTRAINT `id_producto_compras_detalle_productos` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras_detalle`
--

LOCK TABLES `compras_detalle` WRITE;
/*!40000 ALTER TABLE `compras_detalle` DISABLE KEYS */;
INSERT INTO `compras_detalle` VALUES (1,2,1,7,500.00),(2,2,2,3,200.00),(3,1,9,55,2.00),(4,1,4,600,500.00),(5,2,10,1000,50.40),(6,2,3,5600,200.00),(7,2,2,3000,1000.00),(9,4,14,800,1.10),(10,4,6,45,340.30),(11,4,10,899,50.40),(12,5,13,500,4.50),(13,5,12,300,1.30);
/*!40000 ALTER TABLE `compras_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(60) DEFAULT NULL,
  `apellidos` varchar(60) DEFAULT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `DPI` varchar(15) DEFAULT NULL,
  `genero` varchar(30) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `id_puesto` smallint DEFAULT NULL,
  `fecha_inicio_labores` date DEFAULT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `id_puesto_empleados_puestos_idx` (`id_puesto`),
  CONSTRAINT `id_puesto_empleados_puestos` FOREIGN KEY (`id_puesto`) REFERENCES `puestos` (`id_puesto`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Juan','Alvarez','Guatemala','34345434','3329001321987','Masculino','1990-12-12',1,'2020-02-12','2020-02-12 00:00:00'),(2,'Bryan','jimenez','San lucas Sacatepequez','34345434','3443334576675','Masculino','1980-11-30',2,'2020-06-14','2020-06-14 15:00:45'),(3,'Lilian','Alburez','Chimaltenango','39393043','3929393234858','Femenino','1998-02-12',2,'2020-07-11','2020-07-11 17:00:45'),(4,'Sol','Rodriguez','Quiche','21123322','2121212110909','Femenino','2020-08-04',4,'2020-10-06','2020-10-07 00:25:00'),(5,'Marta','Elis','Chiquimula','21347856','1224895763009','Femenino','2020-09-28',1,'2020-09-29','2020-09-29 00:00:00'),(8,'Pedro','Picapiedra','Izabal','33213211','1232134230090','Masculino','2020-09-28',1,'2020-10-06','2020-10-06 10:11:00'),(10,'Matin','Lutero','Colombia','32132311','2123897659009','Masculino','2020-09-27',2,'2020-10-06','2020-10-15 01:03:48'),(12,'Rosa','Jimenez','Zacapa','32239903','1224523451109','Femenino','1990-10-09',8,'2020-11-04','2020-11-04 01:07:54'),(13,'Jennie','Blanco','Alta verpaz','31234890','1231231230908','Femenino','1998-02-10',8,'2020-11-10','2020-11-10 18:31:02'),(14,'Julia','Ramos','Santa Rosa','12889900','1119433564090','Femenino','1992-03-10',8,'2020-11-10','2020-11-10 21:01:36');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `login` varchar(40) NOT NULL,
  `contraseña` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `id_marca` smallint NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'Sony'),(2,'Huawei'),(3,'RCA'),(4,'Samsung'),(5,'Adidas'),(7,'Tocho'),(8,'Bic'),(9,'Tucan'),(11,'Asus');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `monto` double DEFAULT NULL,
  PRIMARY KEY (`id_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,5000);
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `producto` varchar(50) DEFAULT NULL,
  `id_marca` smallint NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `imagen` varchar(30) DEFAULT NULL,
  `precio_costo` decimal(8,2) DEFAULT NULL,
  `precio_venta` decimal(8,2) DEFAULT NULL,
  `existencia` int NOT NULL,
  `fecha_ingreso` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_marca_productos_marcas_idx` (`id_marca`),
  CONSTRAINT `id_marca_productos_marcas` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Televisor',1,'Tecnologia','tv.jpg',500.00,2000.00,122,'2020-09-11'),(2,'Telefono',1,'Tecnologia','telefono.jpg',1000.00,5000.00,4500,'2020-05-2'),(3,'Camisa ',5,'Deporte','camisa.jpg',200.00,450.00,45,'2020-12-12'),(4,'Radio',3,'Tecnologia','radio.jpg',500.00,2000.00,26,'2020-12-12'),(6,'Jordan',4,'Moda','4.jpg',340.30,500.00,140,'2020-10-17'),(7,'Play Station 5',1,'Es para jugar','playstation.jpg',3500.00,4000.00,1000,'2020-10-31 00:18:38'),(8,'Cereal',5,'Es para comer','cereal.jpg',33.00,45.00,34,'2020-10-31 00:38:47'),(9,'Vaso',2,'Es para tomar agua','vaso.jpg',2.00,5.00,45,'2020-11-01 20:53:12'),(10,'Jarron',7,'Es un adorno','jarron.jpg',50.40,150.60,5005,'2020-11-04 01:12:00'),(12,'Lapicero',9,'Es para escribir','lapicero.jpg',1.30,4.50,1000,'2020-11-10 01:56:35'),(13,'Marcador',8,'Es para decorar','marcador.jpg',4.50,5.70,34000,'2020-11-10 01:59:05'),(14,'Sacapuntas',8,'Es para sacar punta','sacapuntas.jpg',1.10,2.10,500,'2020-11-10 01:59:55'),(16,'Laptop asus',11,'Tecnologia','asus.jpg',6500.00,7000.00,200,'2020-11-10 21:10:49');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `proveedor` varchar(60) DEFAULT NULL,
  `nit` varchar(12) DEFAULT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Los confiables','2233222-k','Guatemala','12231164'),(2,'Mayoreo','4455667-k','EE.UU','22223333'),(3,'Bendicion','3333221.5','Guatemala','34342321'),(4,'Los lideres','2233223-2','China','33443343'),(8,'La grande','7674893-J','Costa Rica','73829812'),(9,'La preferida','1231244-L','El Salvador','21234412'),(10,'El Naranjo','19998577-L','Izabal','22331199'),(11,'Los grandes','3290100-k','Alta Verapaz','33461010');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puestos`
--

DROP TABLE IF EXISTS `puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puestos` (
  `id_puesto` smallint NOT NULL AUTO_INCREMENT,
  `puesto` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_puesto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puestos`
--

LOCK TABLES `puestos` WRITE;
/*!40000 ALTER TABLE `puestos` DISABLE KEYS */;
INSERT INTO `puestos` VALUES (1,'Programador'),(2,'Vendedor'),(3,'Supervisor/a'),(4,'Auditor'),(5,'Contador'),(8,'Cajero'),(10,'Gerente');
/*!40000 ALTER TABLE `puestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `no_factura` int NOT NULL,
  `serie` char(1) DEFAULT NULL,
  `fecha_factura` date NOT NULL,
  `id_cliente` int NOT NULL,
  `id_empleado` int NOT NULL,
  `fecha_ingreso` datetime NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `id_empleado_ventas_empleados_idx` (`id_empleado`),
  KEY `id_cliente_ventas_clientes_idx` (`id_cliente`),
  CONSTRAINT `id_empleado_ventas_empleados` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (4,1,'A','2020-11-06',1,1,'2020-11-06 00:25:37'),(5,2,'B','2020-11-06',3,3,'2020-11-06 00:25:46'),(6,3,'A','2020-11-06',4,4,'2020-11-06 00:29:25'),(7,4,'A','2020-11-06',3,8,'2020-11-06 00:31:09'),(8,5,'A','2020-11-06',1,4,'2020-11-06 00:36:55'),(9,6,'A','2020-11-08',3,5,'2020-11-08 01:57:07'),(10,7,'A','2020-11-08',5,3,'2020-11-08 02:12:20'),(11,8,'A','2020-11-08',9,2,'2020-11-08 15:19:28'),(12,9,'A','2020-11-08',10,8,'2020-11-08 15:36:06'),(14,10,'A','2020-11-10',12,4,'2020-11-10 21:13:34');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_detalle`
--

DROP TABLE IF EXISTS `ventas_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_detalle` (
  `id_venta_detalle` bigint NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `precio_unitario` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id_venta_detalle`),
  KEY `id_venta_ventas_detalle_ventas_idx` (`id_venta`),
  KEY `id_producto_ventas_detalle_productos_idx` (`id_producto`),
  CONSTRAINT `id_producto_ventas_detalle_productos` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON UPDATE CASCADE,
  CONSTRAINT `id_venta_ventas_detalle_ventas` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_detalle`
--

LOCK TABLES `ventas_detalle` WRITE;
/*!40000 ALTER TABLE `ventas_detalle` DISABLE KEYS */;
INSERT INTO `ventas_detalle` VALUES (1,4,1,'2',2000.00),(2,4,8,'1',45.00),(3,4,9,'5',5.00),(4,5,7,'3',4000.00),(5,5,4,'2',2000.00),(6,5,6,'1',500.00),(7,6,10,'1',150.60),(8,6,8,'1',45.00),(9,7,1,'1',2000.00),(10,7,7,'1',4000.00),(11,7,9,'2',5.00),(12,8,8,'5',45.00),(13,8,3,'1',450.00),(23,9,1,'1',2000.00),(24,9,7,'3',4000.00),(25,9,6,'5',500.00),(29,10,9,'2',5.00),(30,10,4,'3',2000.00),(31,11,1,'1',2000.00),(32,11,2,'1',5000.00),(33,11,7,'2',4000.00),(34,12,8,'5',45.00),(35,12,9,'2',5.00),(36,12,3,'3',5000.00),(37,12,1,'1',2000.00),(40,14,3,'7',450.00),(41,14,9,'3',5.00);
/*!40000 ALTER TABLE `ventas_detalle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-11  0:43:12

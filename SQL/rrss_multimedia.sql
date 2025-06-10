CREATE DATABASE  IF NOT EXISTS `jsp_rrss_multimedia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `jsp_rrss_multimedia`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: jsp_rrss_multimedia
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `canciones`
--

DROP TABLE IF EXISTS `canciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canciones` (
  `idCancion` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `enlace` varchar(255) NOT NULL,
  `estilo_cancion` varchar(45) NOT NULL,
  `descripcion_cancion` varchar(255) NOT NULL,
  `FK_usuario` int NOT NULL,
  PRIMARY KEY (`idCancion`),
  KEY `constr_canciones_FK_usuario_idx` (`FK_usuario`),
  CONSTRAINT `constr_canciones_FK_usuario` FOREIGN KEY (`FK_usuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canciones`
--

LOCK TABLES `canciones` WRITE;
/*!40000 ALTER TABLE `canciones` DISABLE KEYS */;
INSERT INTO `canciones` VALUES (1,'Espresso','https://open.spotify.com/track/1EspressoID','Pop','Canción más escuchada de 2024, con ritmos vibrantes y sofisticados.',1),(2,'Beautiful Things','https://open.spotify.com/track/2BeautifulThingsID','Pop','Balada emotiva que combina una poderosa voz con una melodía delicada.',2),(3,'BIRDS OF A FEATHER','https://open.spotify.com/track/3BirdsOfAFeatherID','Pop Alternativo','Composición melancólica y etérea que explora temas de conexión y destino.',2),(4,'Wherever You Will Go','https://open.spotify.com/track/5QpaGzWp0hwB5faV8dkbAz','Post-grunge','Emotiva balada sobre el amor incondicional y la promesa de estar siempre presente, incluso en la ausencia.',2),(5,'Lose Control','https://open.spotify.com/track/5LoseControlID','Soul','Balada apasionada que explora la vulnerabilidad y el anhelo de amor.',1),(6,'End of Beginning','https://open.spotify.com/track/6EndOfBeginningID','Indie Rock','Obra introspectiva y experimental con sonidos retro y electrónicos.',1),(7,'Too Sweet','https://open.spotify.com/track/7TooSweetID','Folk Rock','Canción que combina poesía lírica e instrumentación rica, creando una atmósfera cálida.',2),(8,'One Of The Girls','https://open.spotify.com/track/8OneOfTheGirlsID','R&B','Fusión sensual de R&B y pop con colaboraciones destacadas.',2),(9,'Cruel Summer','https://open.spotify.com/track/9CruelSummerID','Pop','Éxito de Taylor Swift que destaca por su energía y letras pegadizas.',2),(10,'Die With A Smile','https://open.spotify.com/track/10DieWithASmileID','Pop','Colaboración entre Lady Gaga y Bruno Mars que ofrece una mezcla única de estilos.',1),(15,'Haizea ','https://open.spotify.com/intl-es/track/177GUmP5iIVU1E34EsBCKs','pop','expresión lírica sobre la naturaleza fugaz y difícil de capturar del amo',1),(16,'Gure Izarrak','https://open.spotify.com/intl-es/track/2QhrzkdSNKIZ7V3UEqfLEZ','pop','dedicada a las personas mayores, especialmente a los que viven en residencias y a aquellos que los cuidan',2),(18,'Always','https://open.spotify.com/intl-es/track/2RChe0r2cMoyOvuKobZy44','rock','balada poderosa que explora el arrepentimiento, el amor perdido y el deseo de redención',1),(19,'La soledad','https://open.spotify.com/intl-es/track/2JTwPGmzMRW0gO4CBCzsyS','pop','narra el dolor y la tristeza por la separación de una relación, especialmente la de un amor que se ha ido para no volver',1),(21,'Boca en la tierra','https://open.spotify.com/intl-es/track/6Da8w1k1IRMSYiGJsug70i','alternativo','aborda la sensación de desorientación y la dificultad de encontrar un rumbo en la vida',1),(24,'Allí donde solíamos gritar','https://open.spotify.com/intl-es/track/29tVNOmg85qDLh2wVnJxpv','alternativo','La canción explora la nostalgia, la introspección, y la transición del tiempo, donde el pasado se vuelve un santuario de memoria. ',1);
/*!40000 ALTER TABLE `canciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peliculas`
--

DROP TABLE IF EXISTS `peliculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peliculas` (
  `idPelicula` int NOT NULL AUTO_INCREMENT,
  `pelicula` varchar(45) NOT NULL,
  `duracion` varchar(45) NOT NULL,
  `estilo_peli` varchar(255) NOT NULL,
  `descripcion_peli` varchar(255) NOT NULL,
  `FK_usuario` int NOT NULL,
  PRIMARY KEY (`idPelicula`),
  KEY `constr_peliculas_FK_usuario_idx` (`FK_usuario`),
  CONSTRAINT `constr_peliculas_FK_usuario` FOREIGN KEY (`FK_usuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peliculas`
--

LOCK TABLES `peliculas` WRITE;
/*!40000 ALTER TABLE `peliculas` DISABLE KEYS */;
INSERT INTO `peliculas` VALUES (1,'Dune: Parte Dos','166','ciencia ficcion','Continuación épica de la saga de ciencia ficción, dirigida por Denis Villeneuve, que explora la lucha por el control del planeta Arrakis.',2),(2,'Oppenheimer','180','Drama historico','Biografía del físico J. Robert Oppenheimer y su papel en el desarrollo de la bomba atómica durante la Segunda Guerra Mundial',1),(13,'titulo','123','estilo','descr',2),(16,'la milla verde','212','Ciencia ficcion','una obra maestra',1),(17,'El lado bueno de las cosas','122','drama','Relata la historia de un hombre con trastorno bipolar que, tras pasar ocho meses en un centro psiquiátrico, intenta reconstruir su vida y recuperar a su esposa.',1);
/*!40000 ALTER TABLE `peliculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `idRol` int NOT NULL AUTO_INCREMENT,
  `rol` varchar(45) NOT NULL,
  PRIMARY KEY (`idRol`),
  UNIQUE KEY `rol_UNIQUE` (`rol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin'),(3,'baneado'),(4,'bloqueado'),(2,'usuario');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `series` (
  `idSerie` int NOT NULL AUTO_INCREMENT,
  `serie` varchar(45) NOT NULL,
  `num_temporadas` int unsigned NOT NULL,
  `descripcion_serie` varchar(255) NOT NULL,
  `FK_usuario` int NOT NULL,
  PRIMARY KEY (`idSerie`),
  KEY `constr_series_FK_usuario_idx` (`FK_usuario`),
  CONSTRAINT `constr_series_FK_usuario` FOREIGN KEY (`FK_usuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
INSERT INTO `series` VALUES (1,'Stranger Things',5,'Temporada final que concluye la saga de Hawkins enfrentando a Vecna y el caos del Upside Down.',1),(2,'Solo Leveling',2,'Adaptación del manga surcoreano que sigue a un cazador débil que se convierte en el más poderoso.',2),(3,'Miércoles',2,'La hija de la familia Addams regresa con nuevas aventuras en la Academia Nevermore.',2),(4,'Sirens',1,'Reimaginación moderna del mito de las sirenas, explorando temas de dolor y agencia femenina.',2),(5,'Phineas y Ferb',5,'Revival de la serie animada con nuevas aventuras veraniegas de los hermanos inventores.',1),(7,'Alien: Planeta Tierra',1,'Precuela de la saga Alien ambientada tres décadas antes del primer contacto.',1),(8,'The Last of Us',2,'Continuación de la adaptación del videojuego, explorando nuevas amenazas en un mundo postapocalíptico.',2),(9,'La vida breve',1,'Comedia de época sobre el breve reinado de Luis I de España.',2),(13,'Friends',10,'mejor serie del mundo',1);
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) NOT NULL,
  `pass` varchar(45) NOT NULL,
  `FK_rol` int NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `constr_usuarios_FK_rol_idx` (`FK_rol`),
  CONSTRAINT `constr_usuarios_FK_rol` FOREIGN KEY (`FK_rol`) REFERENCES `roles` (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','1234',1),(2,'galea','qwer',2),(3,'troll','booh',3),(4,'alain','5678',2),(5,'ana','tyui',2),(6,'letisia','4321',4);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_canciones`
--

DROP TABLE IF EXISTS `v_canciones`;
/*!50001 DROP VIEW IF EXISTS `v_canciones`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_canciones` AS SELECT 
 1 AS `idCancion`,
 1 AS `titulo`,
 1 AS `enlace`,
 1 AS `estilo_cancion`,
 1 AS `descripcion_cancion`,
 1 AS `FK_usuario`,
 1 AS `usuario`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_peliculas`
--

DROP TABLE IF EXISTS `v_peliculas`;
/*!50001 DROP VIEW IF EXISTS `v_peliculas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_peliculas` AS SELECT 
 1 AS `idPelicula`,
 1 AS `pelicula`,
 1 AS `duracion`,
 1 AS `descripcion_peli`,
 1 AS `estilo_peli`,
 1 AS `FK_usuario`,
 1 AS `usuario`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_series`
--

DROP TABLE IF EXISTS `v_series`;
/*!50001 DROP VIEW IF EXISTS `v_series`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_series` AS SELECT 
 1 AS `idSerie`,
 1 AS `serie`,
 1 AS `num_temporadas`,
 1 AS `descripcion_serie`,
 1 AS `FK_usuario`,
 1 AS `usuario`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'jsp_rrss_multimedia'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_bloquear_usuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_bloquear_usuarios`(

IN p_id INT

)
BEGIN

UPDATE usuarios
SET FK_rol = 4
WHERE idUsuario = p_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_borrar_cancion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_borrar_cancion`(

IN p_idCancion INT

)
BEGIN

DELETE FROM canciones
WHERE idCancion = p_idCancion;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_borrar_pelicula` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_borrar_pelicula`(

IN p_idPelicula INT

)
BEGIN

DELETE FROM peliculas
WHERE idPelicula = p_idPelicula;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_borrar_serie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_borrar_serie`(

IN p_idSerie INT

)
BEGIN

DELETE FROM series
WHERE idSerie = p_idSerie;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertar_cancion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_cancion`(

IN p_titulo VARCHAR(45),
IN p_enlace VARCHAR(255),
IN p_estilo_cancion VARCHAR(45),
IN p_descripcion_cancion VARCHAR(255),
IN p_FK_usuario INT
)
BEGIN

INSERT INTO jsp_rrss_multimedia.canciones
(
titulo,
enlace,
estilo_cancion,
descripcion_cancion, 
FK_usuario
)
VALUES
(
p_titulo,
p_enlace,
p_estilo_cancion,
p_descripcion_cancion, 
p_FK_usuario
);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertar_pelicula` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_pelicula`(

IN p_pelicula VARCHAR(45),
IN p_duracion VARCHAR(45),
IN p_estilo_peli VARCHAR(255),
IN p_descripcion_peli VARCHAR(255),
IN p_FK_usuario INT

)
BEGIN

INSERT INTO jsp_rrss_multimedia.peliculas
(
pelicula,
duracion,
estilo_peli,
descripcion_peli,
FK_usuario
)
VALUES
(
p_pelicula,
p_duracion,
p_estilo_peli,
p_descripcion_peli,
p_FK_usuario
);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertar_serie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_serie`(

IN p_serie VARCHAR(45),
IN p_num_temporadas INT,
IN p_descripcion_serie VARCHAR(255),
IN p_FK_usuario INT

)
BEGIN

INSERT INTO jsp_rrss_multimedia.series
(
serie,
num_temporadas,
descripcion_serie,
FK_usuario
)
VALUES

(
p_serie,
p_num_temporadas,
p_descripcion_serie,
p_FK_usuario
);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtener_canciones_por_id_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtener_canciones_por_id_usuario`(

IN p_idUsuario INT

)
BEGIN

SELECT *
FROM v_canciones
WHERE FK_usuario =  p_idUsuario;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtener_cancion_por_idCancion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtener_cancion_por_idCancion`(

IN p_idCancion INT

)
BEGIN

SELECT *
FROM v_canciones
WHERE idCancion = p_idCancion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtener_peliculas_por_id_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtener_peliculas_por_id_usuario`(

IN p_idUsuario INT

)
BEGIN

SELECT *
FROM v_peliculas
WHERE FK_usuario =  p_idUsuario;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtener_series_por_id_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtener_series_por_id_usuario`(

IN p_idUsuario INT

)
BEGIN

SELECT *
FROM v_series
WHERE FK_usuario =  p_idUsuario;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtener_todas_canciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtener_todas_canciones`()
BEGIN

SELECT *
FROM v_canciones;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtener_todas_peliculas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtener_todas_peliculas`()
BEGIN

SELECT *
FROM v_peliculas;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtener_todas_series` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtener_todas_series`()
BEGIN

SELECT * 
FROM v_series;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtener_usuario_id_por_nombre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtener_usuario_id_por_nombre`(
IN p_usuario VARCHAR(45)

)
BEGIN

SELECT idUsuario, FK_rol
FROM usuarios
WHERE usuario LIKE p_usuario;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_verificar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_verificar_usuario`(

IN p_usuario VARCHAR(45),
IN p_pass VARCHAR(45)

)
BEGIN

SELECT idUsuario, usuario, "" AS pass, FK_rol 
FROM usuarios
WHERE usuario = p_usuario AND pass = p_pass AND FK_rol<3;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_canciones`
--

/*!50001 DROP VIEW IF EXISTS `v_canciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_canciones` AS select `c`.`idCancion` AS `idCancion`,`c`.`titulo` AS `titulo`,`c`.`enlace` AS `enlace`,`c`.`estilo_cancion` AS `estilo_cancion`,`c`.`descripcion_cancion` AS `descripcion_cancion`,`c`.`FK_usuario` AS `FK_usuario`,`u`.`usuario` AS `usuario` from (`canciones` `c` join `usuarios` `u` on(((`c`.`FK_usuario` = `u`.`idUsuario`) and (`u`.`FK_rol` <> 3)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_peliculas`
--

/*!50001 DROP VIEW IF EXISTS `v_peliculas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_peliculas` AS select `p`.`idPelicula` AS `idPelicula`,`p`.`pelicula` AS `pelicula`,`p`.`duracion` AS `duracion`,`p`.`descripcion_peli` AS `descripcion_peli`,`p`.`estilo_peli` AS `estilo_peli`,`p`.`FK_usuario` AS `FK_usuario`,`u`.`usuario` AS `usuario` from (`peliculas` `p` join `usuarios` `u` on(((`p`.`FK_usuario` = `u`.`idUsuario`) and (`u`.`FK_rol` <> 3)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_series`
--

/*!50001 DROP VIEW IF EXISTS `v_series`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_series` AS select `s`.`idSerie` AS `idSerie`,`s`.`serie` AS `serie`,`s`.`num_temporadas` AS `num_temporadas`,`s`.`descripcion_serie` AS `descripcion_serie`,`s`.`FK_usuario` AS `FK_usuario`,`u`.`usuario` AS `usuario` from (`series` `s` join `usuarios` `u` on(((`s`.`FK_usuario` = `u`.`idUsuario`) and (`u`.`FK_rol` <> 3)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-09 14:08:57

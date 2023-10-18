-- MySQL dump 10.13  Distrib 8.1.0, for macos11.7 (x86_64)
--
-- Host: localhost    Database: basketballstats
-- ------------------------------------------------------
-- Server version	8.1.0

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

--
-- Table structure for table `Game`
--

DROP TABLE IF EXISTS `Game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Game` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `league_id` int unsigned NOT NULL,
  `season_id` int unsigned NOT NULL,
  `home_team_id` int unsigned NOT NULL,
  `away_team_id` int unsigned NOT NULL,
  `game_type` enum('UNKNOWN','PRESEASON','REGULAR_SEASON','POSTSEASON_RND_8','POSTSEASON_RND_4','POSTSEASON_RND_2') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `game_start_timestamp_secs` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Game`
--

LOCK TABLES `Game` WRITE;
/*!40000 ALTER TABLE `Game` DISABLE KEYS */;
INSERT INTO `Game` VALUES (1,1,1,28,25,'REGULAR_SEASON',1695249000);
/*!40000 ALTER TABLE `Game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Gamelog`
--

DROP TABLE IF EXISTS `Gamelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Gamelog` (
  `player_id` int unsigned NOT NULL,
  `game_id` int unsigned NOT NULL,
  `game_started` tinyint unsigned DEFAULT NULL,
  `field_goals` int unsigned NOT NULL,
  `field_goals_attempted` int unsigned NOT NULL,
  `field_goal_percentage` float unsigned NOT NULL,
  `two_pointers` int unsigned NOT NULL,
  `two_pointers_attempted` int unsigned NOT NULL,
  `two_pointer_percentage` float unsigned NOT NULL,
  `three_pointers` int unsigned NOT NULL,
  `three_pointers_attempted` int unsigned NOT NULL,
  `three_pointer_percentage` float unsigned NOT NULL,
  `free_throws` int unsigned NOT NULL,
  `free_throws_attempted` int unsigned NOT NULL,
  `free_throw_percentage` float unsigned NOT NULL,
  `points` int unsigned NOT NULL,
  `rebounds` int unsigned NOT NULL,
  `offensive_rebounds` int unsigned NOT NULL,
  `defensive_rebounds` int unsigned NOT NULL,
  `assists` int unsigned NOT NULL,
  `steals` int unsigned NOT NULL,
  `blocks` int unsigned NOT NULL,
  `turnovers` int unsigned NOT NULL,
  `personal_fouls` int unsigned NOT NULL,
  `possessions` float unsigned NOT NULL,
  `points_per_possession` float unsigned NOT NULL,
  `effective_field_goal_percentage` float unsigned NOT NULL,
  `true_shooting_percentage` float unsigned NOT NULL,
  `three_point_attempt_rate` float unsigned NOT NULL,
  `free_throw_rate` float unsigned NOT NULL,
  `rebound_percentage` float unsigned NOT NULL,
  `offensive_rebound_percentage` float unsigned NOT NULL,
  `defensive_rebound_percentage` float unsigned NOT NULL,
  `assist_turnover_ratio` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `turnover_percentage` float unsigned NOT NULL,
  `game_score` float NOT NULL,
  `efficiency` int NOT NULL,
  PRIMARY KEY (`player_id`,`game_id`),
  KEY `Gamelog-Game` (`game_id`),
  CONSTRAINT `Gamelog-Game` FOREIGN KEY (`game_id`) REFERENCES `Game` (`id`),
  CONSTRAINT `Gamelog-Player` FOREIGN KEY (`player_id`) REFERENCES `Player` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gamelog`
--

LOCK TABLES `Gamelog` WRITE;
/*!40000 ALTER TABLE `Gamelog` DISABLE KEYS */;
INSERT INTO `Gamelog` VALUES (9,1,1,4,6,0.667,1,1,1,3,5,0.6,0,0,0,11,2,1,1,2,1,0,1,1,6,1.833,0.917,0.917,0.833,0,0.029,0.037,0.024,'2.0',0.143,10.4,13),(10,1,1,5,16,0.313,5,10,0.5,0,6,0,6,6,1,16,3,0,3,1,0,0,2,1,21,0.767,0.313,0.429,0.375,0.375,0.044,0,0.111,'0.5',0.096,6,7),(11,1,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,1,0,0.015,0.024,0,'0.0',0,-0.4,0),(12,1,0,1,3,0.333,1,2,0.5,0,1,0,0,0,0,2,8,3,5,0,2,0,0,2,0,0,0.333,0.333,0.333,0,0.118,0.073,0.185,'0.0',0,5.1,10),(13,1,1,5,10,0.5,3,7,0.429,2,3,0.667,2,2,1,14,5,1,4,3,2,0,3,1,13,1.081,0.6,0.643,0.3,0.2,0.074,0.037,0.098,'1.0',0.215,11.6,16),(17,1,1,3,9,0.333,3,7,0.429,0,2,0,0,2,0,6,6,3,3,1,3,0,4,3,11,0.548,0.333,0.304,0.222,0.222,0.088,0.073,0.111,'0.25',0.287,1.6,4),(20,1,0,4,5,0.8,4,5,0.8,0,0,0,0,2,0,8,4,0,4,1,0,0,4,3,10,0.804,0.8,0.68,0,0.4,0,0,0,'0.25',0.402,2,6),(21,1,1,4,12,0.333,3,9,0.333,1,3,0.333,6,8,0.75,15,11,7,4,1,1,2,2,1,11,1.389,0.375,0.483,0.25,0.667,0.162,0.171,0.148,'0.5',0.112,14.2,18),(22,1,1,7,11,0.636,4,5,0.8,3,6,0.5,0,0,0,17,5,0,5,5,0,2,0,1,11,1.545,0.773,0.773,0.545,0,0.074,0,0.122,'0.0',0,18.1,25),(25,1,1,1,2,0.5,1,2,0.5,0,0,0,0,0,0,2,3,1,2,2,0,1,1,2,2,1,0.5,0.5,0,0,0.044,0.037,0.049,'2.0',0.333,2.6,6),(29,1,1,3,11,0.273,1,2,0.5,2,9,0.222,0,0,0,8,3,1,2,3,0,1,3,3,13,0.615,0.364,0.364,0.818,0,0.044,0.024,0.074,'1.0',0.214,1.4,4),(30,1,1,6,15,0.4,6,15,0.4,0,0,0,4,9,0.444,16,10,1,9,2,1,0,3,1,21,0.752,0.4,0.422,0,0.6,0.147,0.037,0.22,'0.667',0.135,8.3,12),(39,1,0,1,4,0.25,0,1,0,1,3,0.333,0,1,0,3,2,1,1,0,0,0,1,3,4,0.67,0.375,0.338,0.75,0.25,0.029,0.037,0.024,'0.0',0.183,-1,0),(49,1,1,3,9,0.333,2,3,0.667,1,6,0.167,0,0,0,7,3,0,3,0,1,0,2,3,11,0.636,0.389,0.389,0.667,0,0.044,0,0.111,'0.0',0.182,0.6,3);
/*!40000 ALTER TABLE `Gamelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `League`
--

DROP TABLE IF EXISTS `League`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `League` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `league-team` FOREIGN KEY (`id`) REFERENCES `Team` (`league_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `League`
--

LOCK TABLES `League` WRITE;
/*!40000 ALTER TABLE `League` DISABLE KEYS */;
INSERT INTO `League` VALUES (1,'JP League');
/*!40000 ALTER TABLE `League` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Player`
--

DROP TABLE IF EXISTS `Player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Player` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `height_inches` int unsigned DEFAULT NULL,
  `weight_pounds` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Player`
--

LOCK TABLES `Player` WRITE;
/*!40000 ALTER TABLE `Player` DISABLE KEYS */;
INSERT INTO `Player` VALUES (1,'John','Behri',72,205),(2,'Joseph','Bieselin',72,210),(3,'Sean','Bonnani',76,200),(4,'Sen','Cai',72,170),(5,'Stephen','Deng',69,160),(6,'Kevin','Diaz',69,200),(7,'Geordan','France',70,180),(8,'Jack','Guo',73,176),(9,'Xavier','Hu',73,190),(10,'Dada','Huang',71,165),(11,'Stan','Huang',69,195),(12,'Andy','Kapolnek',73,210),(13,'Moe','Khair',72,185),(14,'John','Lee',71,195),(15,'Dennis','Lee',69,180),(16,'Kagerou','Liao',72,225),(17,'Josh','Liu',71,185),(18,'Alex','Liu',73,175),(19,'Louis','Luo',68,174),(20,'Gary','Luo',68,170),(21,'Brandon','Mackie',72,202),(22,'James','Meng',72,150),(23,'Tyler','Morris',73,220),(24,'Brian','Mulvihill',76,220),(25,'Min','Naing',74,190),(26,'Ethan','Nam',74,185),(27,'Derby','Ng',70,210),(28,'Harshil','Patel',72,190),(29,'JC','Pozo-Olano',71,210),(30,'Andrew','Rivera',75,215),(31,'Jacob','Rusoff',75,210),(32,'Sunny','Sang',69,170),(33,'Josh','Schwartz',69,155),(34,'Chenhao','Shen',74,165),(35,'Stone','Shi',74,210),(36,'Cindy','Si',69,165),(37,'Steve','Song',73,215),(38,'Emmett','Sun',71,185),(39,'Toby','Tan',75,180),(40,'Gio','Valdes',76,240),(41,'Tushar','Verma',70,160),(42,'Max','Wang',73,200),(43,'Francis','Wang',71,185),(44,'Kennie','Wang',72,155),(45,'Shouran','Wang',74,180),(46,'Jone','Wong',68,170),(47,'John','Xu',71,200),(48,'Kenny','Yu',73,180),(49,'Jeff','Zhang',75,220),(50,'Zach','Zhang',73,190);
/*!40000 ALTER TABLE `Player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PlayerTeamSeason`
--

DROP TABLE IF EXISTS `PlayerTeamSeason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PlayerTeamSeason` (
  `player_id` int unsigned NOT NULL,
  `season_id` int unsigned NOT NULL,
  `team_id` int unsigned NOT NULL,
  PRIMARY KEY (`team_id`,`player_id`,`season_id`),
  KEY `TeamPlayerSeason-Player` (`player_id`),
  KEY `TeamPlayerSeason-Season` (`season_id`),
  CONSTRAINT `TeamPlayerSeason-Player` FOREIGN KEY (`player_id`) REFERENCES `Player` (`id`),
  CONSTRAINT `TeamPlayerSeason-Season` FOREIGN KEY (`season_id`) REFERENCES `Season` (`id`),
  CONSTRAINT `TeamPlayerSeason-Team` FOREIGN KEY (`team_id`) REFERENCES `Team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlayerTeamSeason`
--

LOCK TABLES `PlayerTeamSeason` WRITE;
/*!40000 ALTER TABLE `PlayerTeamSeason` DISABLE KEYS */;
INSERT INTO `PlayerTeamSeason` VALUES (1,4,24),(2,4,27),(4,4,23),(5,4,27),(6,4,24),(7,4,24),(8,4,23),(9,4,25),(10,4,28),(11,4,28),(12,4,28),(13,4,25),(14,4,26),(15,4,23),(16,4,27),(17,4,28),(18,4,27),(19,4,26),(20,4,25),(21,4,28),(22,4,25),(23,4,24),(24,4,27),(25,4,25),(26,4,27),(27,4,25),(28,4,26),(29,4,28),(30,4,25),(31,4,24),(32,4,27),(33,4,26),(34,4,23),(35,4,23),(36,4,23),(37,4,26),(38,4,24),(39,4,25),(40,4,23),(41,4,28),(42,4,27),(43,4,26),(44,4,26),(46,4,26),(47,4,23),(48,4,24),(49,4,28),(50,4,24);
/*!40000 ALTER TABLE `PlayerTeamSeason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Season`
--

DROP TABLE IF EXISTS `Season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Season` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `league_id` int unsigned NOT NULL,
  `display_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `start_date_timestamp_secs` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Season`
--

LOCK TABLES `Season` WRITE;
/*!40000 ALTER TABLE `Season` DISABLE KEYS */;
INSERT INTO `Season` VALUES (1,1,'Summer 2022',1656541800),(2,1,'Fall 2022',1664404200),(3,1,'Spring 2023',1681338600),(4,1,'Fall 2023',1694644200);
/*!40000 ALTER TABLE `Season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Team`
--

DROP TABLE IF EXISTS `Team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Team` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `abbreviation` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `league_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK` (`league_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Team`
--

LOCK TABLES `Team` WRITE;
/*!40000 ALTER TABLE `Team` DISABLE KEYS */;
INSERT INTO `Team` VALUES (1,'404 Error Page Not Found','404',1),(2,'JP Mambas','JPMB',1),(3,'Big Wongs','BGW',1),(4,'Me O\'Clock','MEO',1),(5,'JP Animals','JPA',1),(6,'Gordon Ramsay\'s Disciples','GRD',1),(7,'LIC School of Dentistry','LSD',1),(8,'Ball Handlers','BLH',1),(9,'JP Lockdown','JPL',1),(10,'Xie\'s Famous Foods','XFF',1),(11,'Double Z','DBZ',1),(12,'JP Showstoppers','JPS',1),(13,'LIC School 4 Kids Who Can\'t Read Good','LS4',1),(14,'Draco','DCO',1),(15,'808s & Fastbreaks','808',1),(16,'Murray\'s Cheesers','MRC',1),(17,'Sticky Fingaz','STF',1),(18,'Ball-Stars','BLS',1),(19,'Oyster Gang','OYG',1),(20,'Hot Boys','HTB',1),(21,'Ho You Fat','HYF',1),(22,'Dem Boyz','DMB',1),(23,'Cindy\'s Angels','CDA',1),(24,'JP Munchables','JPMN',1),(25,'LIC Knickerbockers','LICK',1),(26,'Grandes Bolas','GDB',1),(27,'Don\'t Hate the Playa, Hate the Deng','HTD',1),(28,'Jackson 8','JS8',1);
/*!40000 ALTER TABLE `Team` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-18  0:35:22

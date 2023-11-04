-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Wersja serwera:               11.1.2-MariaDB-1:11.1.2+maria~ubu2204 - mariadb.org binary distribution
-- Serwer OS:                    debian-linux-gnu
-- HeidiSQL Wersja:              12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Zrzut struktury bazy danych db_shopping-list
CREATE DATABASE IF NOT EXISTS `db_shopping-list` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `db_shopping-list`;

-- Zrzut struktury tabela db_shopping-list.basket
CREATE TABLE IF NOT EXISTS `basket` (
  `id` varchar(36) NOT NULL,
  `listId` varchar(36) DEFAULT NULL,
  `itemId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_afc4d466868eef539f9c678cb6d` (`listId`),
  KEY `FK_837454751b67b33f976b8d30566` (`itemId`),
  CONSTRAINT `FK_837454751b67b33f976b8d30566` FOREIGN KEY (`itemId`) REFERENCES `item_in_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_afc4d466868eef539f9c678cb6d` FOREIGN KEY (`listId`) REFERENCES `list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Zrzucanie danych dla tabeli db_shopping-list.basket: ~1 rows (około)
INSERT INTO `basket` (`id`, `listId`, `itemId`) VALUES
	('dc1aab81-acc8-4402-a4a2-9196049817af', '1e78a706-95f0-4366-acf0-1bf92cbcc83d', '2e97b5ab-0e94-47a2-9fb2-8734ed96aec8');

-- Zrzut struktury tabela db_shopping-list.item_in_list
CREATE TABLE IF NOT EXISTS `item_in_list` (
  `id` varchar(36) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `weight` int(11) NOT NULL DEFAULT 0,
  `itemInBasket` tinyint(4) NOT NULL DEFAULT 0,
  `productId` varchar(36) DEFAULT NULL,
  `listId` varchar(36) DEFAULT NULL,
  `recipeId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_0f0fcdebe059aa8ae3ed0fed503` (`productId`),
  KEY `FK_7f6cca577485a5fb130e09c2a22` (`listId`),
  KEY `FK_d636b087c9976dbea910f182464` (`recipeId`),
  CONSTRAINT `FK_0f0fcdebe059aa8ae3ed0fed503` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_7f6cca577485a5fb130e09c2a22` FOREIGN KEY (`listId`) REFERENCES `list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_d636b087c9976dbea910f182464` FOREIGN KEY (`recipeId`) REFERENCES `recipe` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Zrzucanie danych dla tabeli db_shopping-list.item_in_list: ~3 rows (około)
INSERT INTO `item_in_list` (`id`, `count`, `weight`, `itemInBasket`, `productId`, `listId`, `recipeId`) VALUES
	('2e97b5ab-0e94-47a2-9fb2-8734ed96aec8', 0, 200, 0, '02bbe9c9-0d65-4aa8-a0c1-ce13c9f37b7b', '1e78a706-95f0-4366-acf0-1bf92cbcc83d', NULL),
	('49c7fcd6-75cc-4db5-9c16-bbd3f6a8eef4', 0, 1000, 0, 'fdb6e10b-10f3-4160-813a-cda07231709c', '1e78a706-95f0-4366-acf0-1bf92cbcc83d', NULL),
	('dca5c948-419a-4467-a3f1-c15d2494bdb4', 4, 0, 0, 'c768350a-9cb6-4677-b114-b334067e73b9', NULL, '83a8932a-91ff-4920-9e6d-41b2df86d3a9');

-- Zrzut struktury tabela db_shopping-list.list
CREATE TABLE IF NOT EXISTS `list` (
  `id` varchar(36) NOT NULL,
  `listName` varchar(100) NOT NULL,
  `userId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_46ded14b26382088c9f032f8953` (`userId`),
  CONSTRAINT `FK_46ded14b26382088c9f032f8953` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Zrzucanie danych dla tabeli db_shopping-list.list: ~1 rows (około)
INSERT INTO `list` (`id`, `listName`, `userId`) VALUES
	('1e78a706-95f0-4366-acf0-1bf92cbcc83d', 'Wtorek', 'b0a53514-d0e7-426f-a3bf-7531751e21c0');

-- Zrzut struktury tabela db_shopping-list.list_recipes_recipe
CREATE TABLE IF NOT EXISTS `list_recipes_recipe` (
  `listId` varchar(36) NOT NULL,
  `recipeId` varchar(36) NOT NULL,
  PRIMARY KEY (`listId`,`recipeId`),
  KEY `IDX_e98ccd1f40b328f9a3d8e71479` (`listId`),
  KEY `IDX_524ed0ede6e8c1bb90203becef` (`recipeId`),
  CONSTRAINT `FK_524ed0ede6e8c1bb90203becef9` FOREIGN KEY (`recipeId`) REFERENCES `recipe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_e98ccd1f40b328f9a3d8e714792` FOREIGN KEY (`listId`) REFERENCES `list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Zrzucanie danych dla tabeli db_shopping-list.list_recipes_recipe: ~0 rows (około)
INSERT INTO `list_recipes_recipe` (`listId`, `recipeId`) VALUES
	('1e78a706-95f0-4366-acf0-1bf92cbcc83d', '83a8932a-91ff-4920-9e6d-41b2df86d3a9');

-- Zrzut struktury tabela db_shopping-list.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` varchar(36) NOT NULL,
  `category` int(11) NOT NULL DEFAULT 0,
  `userId` varchar(36) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_329b8ae12068b23da547d3b4798` (`userId`),
  CONSTRAINT `FK_329b8ae12068b23da547d3b4798` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Zrzucanie danych dla tabeli db_shopping-list.product: ~3 rows (około)
INSERT INTO `product` (`id`, `category`, `userId`, `name`) VALUES
	('02bbe9c9-0d65-4aa8-a0c1-ce13c9f37b7b', 2, 'b0a53514-d0e7-426f-a3bf-7531751e21c0', 'Szynka'),
	('c768350a-9cb6-4677-b114-b334067e73b9', 0, 'b0a53514-d0e7-426f-a3bf-7531751e21c0', 'Jajka'),
	('fdb6e10b-10f3-4160-813a-cda07231709c', 4, 'b0a53514-d0e7-426f-a3bf-7531751e21c0', 'Mleko');

-- Zrzut struktury tabela db_shopping-list.recipe
CREATE TABLE IF NOT EXISTS `recipe` (
  `id` varchar(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `userId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fe30fdc515f6c94d39cd4bbfa76` (`userId`),
  CONSTRAINT `FK_fe30fdc515f6c94d39cd4bbfa76` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Zrzucanie danych dla tabeli db_shopping-list.recipe: ~1 rows (około)
INSERT INTO `recipe` (`id`, `name`, `description`, `userId`) VALUES
	('83a8932a-91ff-4920-9e6d-41b2df86d3a9', 'Jajecznica', 'Przepis...', 'b0a53514-d0e7-426f-a3bf-7531751e21c0');

-- Zrzut struktury tabela db_shopping-list.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` varchar(36) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pwdHash` varchar(255) NOT NULL,
  `currentTokenId` varchar(255) DEFAULT NULL,
  `photoFn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Zrzucanie danych dla tabeli db_shopping-list.user: ~2 rows (około)
INSERT INTO `user` (`id`, `email`, `pwdHash`, `currentTokenId`, `photoFn`) VALUES
	('b0a53514-d0e7-426f-a3bf-7531751e21c0', 'test@example.com', '4346eed79e5e6e9ac2f3566aab0d31d6d198daa98d060dbabd587d1d0801e270ab7e2cdc4db6ad90ee0c6b274a6b6ce284b0cc013d32bf14dae125ee95b140d8', '1f2bd098-9055-4966-8972-1ec428910df4', '2c59b48d-c42e-42bc-badf-2e2fcef9d63f.jpeg'),
	('f23c220d-dfba-4183-a3d9-10745a2557dd', 'test123@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$+7a6FoaF1k9iywfMd6KjqQ$MXH0V+uBeQ4JVNjZrJy68y+Y5cFxNpVvpnUXbf9uFx8', '94a2d006-8172-4016-8eba-0c19f7c61ece', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

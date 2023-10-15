-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 15, 2023 at 10:14 AM
-- Server version: 10.4.30-MariaDB-cll-lve
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `megaprom_shopping-list`
--

-- --------------------------------------------------------

--
-- Table structure for table `basket`
--

CREATE TABLE `basket` (
  `id` varchar(36) NOT NULL,
  `listId` varchar(36) DEFAULT NULL,
  `itemId` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `basket`
--

INSERT INTO `basket` (`id`, `listId`, `itemId`) VALUES
('c692a057-cf86-461b-a6b8-4b360612f4cd', 'be1e862e-ea75-44ff-a778-ec6ef85b1da5', 'e4f8cbcc-b815-489b-9da1-bac9e959ea4b');

-- --------------------------------------------------------

--
-- Table structure for table `item_in_list`
--

CREATE TABLE `item_in_list` (
  `id` varchar(36) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `weight` int(11) NOT NULL DEFAULT 0,
  `itemInBasket` tinyint(4) NOT NULL DEFAULT 0,
  `productId` varchar(36) DEFAULT NULL,
  `listId` varchar(36) DEFAULT NULL,
  `recipeId` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `item_in_list`
--

INSERT INTO `item_in_list` (`id`, `count`, `weight`, `itemInBasket`, `productId`, `listId`, `recipeId`) VALUES
('36842a30-6875-40d5-927a-72fadaf3f4ca', 0, 0, 0, 'fc4a407d-b274-40fa-b219-35ca089e35cf', 'be1e862e-ea75-44ff-a778-ec6ef85b1da5', NULL),
('e4f8cbcc-b815-489b-9da1-bac9e959ea4b', 0, 0, 0, '75723c6c-eb3b-4855-bce2-af709d05b536', 'be1e862e-ea75-44ff-a778-ec6ef85b1da5', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `list`
--

CREATE TABLE `list` (
  `id` varchar(36) NOT NULL,
  `listName` varchar(100) NOT NULL,
  `userId` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `list`
--

INSERT INTO `list` (`id`, `listName`, `userId`) VALUES
('be1e862e-ea75-44ff-a778-ec6ef85b1da5', 'Monday', 'b0a53514-d0e7-426f-a3bf-7531751e21c0');

-- --------------------------------------------------------

--
-- Table structure for table `list_recipes_recipe`
--

CREATE TABLE `list_recipes_recipe` (
  `listId` varchar(36) NOT NULL,
  `recipeId` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` varchar(36) NOT NULL,
  `name` varchar(50) NOT NULL,
  `category` int(11) NOT NULL DEFAULT 0,
  `userId` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `category`, `userId`) VALUES
('1dd0fc45-4f99-42a8-94a9-edb2606f7b98', 'Tomato', 1, 'b0a53514-d0e7-426f-a3bf-7531751e21c0'),
('75723c6c-eb3b-4855-bce2-af709d05b536', 'Milk', 4, 'b0a53514-d0e7-426f-a3bf-7531751e21c0'),
('fc4a407d-b274-40fa-b219-35ca089e35cf', 'Mleko', 0, 'b0a53514-d0e7-426f-a3bf-7531751e21c0');

-- --------------------------------------------------------

--
-- Table structure for table `recipe`
--

CREATE TABLE `recipe` (
  `id` varchar(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `userId` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(36) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pwdHash` varchar(255) NOT NULL,
  `currentTokenId` varchar(255) DEFAULT NULL,
  `photoFn` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `pwdHash`, `currentTokenId`, `photoFn`) VALUES
('b0a53514-d0e7-426f-a3bf-7531751e21c0', 'test@example.com', '4346eed79e5e6e9ac2f3566aab0d31d6d198daa98d060dbabd587d1d0801e270ab7e2cdc4db6ad90ee0c6b274a6b6ce284b0cc013d32bf14dae125ee95b140d8', 'f4c84786-c4ef-4e74-9295-047ff2a3b154', '2c59b48d-c42e-42bc-badf-2e2fcef9d63f.jpeg'),
('f23c220d-dfba-4183-a3d9-10745a2557dd', 'test123@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$+7a6FoaF1k9iywfMd6KjqQ$MXH0V+uBeQ4JVNjZrJy68y+Y5cFxNpVvpnUXbf9uFx8', '94a2d006-8172-4016-8eba-0c19f7c61ece', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `basket`
--
ALTER TABLE `basket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_afc4d466868eef539f9c678cb6d` (`listId`),
  ADD KEY `FK_837454751b67b33f976b8d30566` (`itemId`);

--
-- Indexes for table `item_in_list`
--
ALTER TABLE `item_in_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_0f0fcdebe059aa8ae3ed0fed503` (`productId`),
  ADD KEY `FK_7f6cca577485a5fb130e09c2a22` (`listId`),
  ADD KEY `FK_d636b087c9976dbea910f182464` (`recipeId`);

--
-- Indexes for table `list`
--
ALTER TABLE `list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_46ded14b26382088c9f032f8953` (`userId`);

--
-- Indexes for table `list_recipes_recipe`
--
ALTER TABLE `list_recipes_recipe`
  ADD PRIMARY KEY (`listId`,`recipeId`),
  ADD KEY `IDX_e98ccd1f40b328f9a3d8e71479` (`listId`),
  ADD KEY `IDX_524ed0ede6e8c1bb90203becef` (`recipeId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_329b8ae12068b23da547d3b4798` (`userId`);

--
-- Indexes for table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_fe30fdc515f6c94d39cd4bbfa76` (`userId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `basket`
--
ALTER TABLE `basket`
  ADD CONSTRAINT `FK_837454751b67b33f976b8d30566` FOREIGN KEY (`itemId`) REFERENCES `item_in_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_afc4d466868eef539f9c678cb6d` FOREIGN KEY (`listId`) REFERENCES `list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `item_in_list`
--
ALTER TABLE `item_in_list`
  ADD CONSTRAINT `FK_0f0fcdebe059aa8ae3ed0fed503` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_7f6cca577485a5fb130e09c2a22` FOREIGN KEY (`listId`) REFERENCES `list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_d636b087c9976dbea910f182464` FOREIGN KEY (`recipeId`) REFERENCES `recipe` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `list`
--
ALTER TABLE `list`
  ADD CONSTRAINT `FK_46ded14b26382088c9f032f8953` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `list_recipes_recipe`
--
ALTER TABLE `list_recipes_recipe`
  ADD CONSTRAINT `FK_524ed0ede6e8c1bb90203becef9` FOREIGN KEY (`recipeId`) REFERENCES `recipe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_e98ccd1f40b328f9a3d8e714792` FOREIGN KEY (`listId`) REFERENCES `list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_329b8ae12068b23da547d3b4798` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `recipe`
--
ALTER TABLE `recipe`
  ADD CONSTRAINT `FK_fe30fdc515f6c94d39cd4bbfa76` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

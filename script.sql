-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 09 fév. 2024 à 12:59
-- Version du serveur : 8.0.30
-- Version de PHP : 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `deno_api_2`
--
CREATE DATABASE IF NOT EXISTS `deno_api_2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `deno_api_2`;

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'USER', '2023-12-02 14:58:08', '2023-12-16 15:03:16'),
(2, 'ADMIN', '2023-12-16 13:51:27', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `share_prices`
--

CREATE TABLE `share_prices` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `volume` decimal(10,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `share_price_history`
--

CREATE TABLE `share_price_history` (
  `id` int NOT NULL,
  `old_value` decimal(10,2) NOT NULL,
  `old_volume` decimal(10,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `share_price_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `transactions`
--

CREATE TABLE `transactions` (
  `id` int NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `volume` decimal(10,2) NOT NULL,
  `type_transaction` varchar(255) NOT NULL,
  `transacted_at` datetime NOT NULL,
  `user_id` int DEFAULT NULL,
  `share_price_history_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `wallet` decimal(10,2) NOT NULL,
  `is_cdu` tinyint(1) NOT NULL,
  `cdu_accepted_at` datetime DEFAULT NULL,
  `register_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `unsubscribe_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `role_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `wallet`, `is_cdu`, `cdu_accepted_at`, `register_at`, `updated_at`, `unsubscribe_at`, `is_active`, `role_id`) VALUES
(1, 'Admin', 'Username', 'admin@gmail.com', '$2a$08$wraTuEDsftiZ1CsIOY1dpuECVDDCt9j375Oj/EVwt037kAaw9hZhm', 357732.99, 0, NULL, '2023-12-02 14:58:19', '2024-01-22 01:24:16', '2024-01-22 01:24:16', 1, 2),
(2, 'User', 'Username', 'user@gmail.com', '$2a$08$wraTuEDsftiZ1CsIOY1dpuECVDDCt9j375Oj/EVwt037kAaw9hZhm', 23.00, 0, NULL, '2023-12-03 16:25:17', NULL, NULL, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `login_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wallet_history`
--

CREATE TABLE `wallet_history` (
  `id` int NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `operation_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wallet_share_price`
--

CREATE TABLE `wallet_share_price` (
  `id` int NOT NULL,
  `volume` decimal(10,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `share_price_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `share_prices`
--
ALTER TABLE `share_prices`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `share_price_history`
--
ALTER TABLE `share_price_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_share_price_id_share_price_history` (`share_price_id`);

--
-- Index pour la table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`user_id`),
  ADD KEY `sharePriceHistoryId` (`share_price_history_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `roleId` (`role_id`);

--
-- Index pour la table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Index pour la table `wallet_history`
--
ALTER TABLE `wallet_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id_wallet_history` (`user_id`);

--
-- Index pour la table `wallet_share_price`
--
ALTER TABLE `wallet_share_price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_share_price_id_wallet_share_price` (`share_price_id`),
  ADD KEY `fk_user_id_wallet_share_price` (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `share_prices`
--
ALTER TABLE `share_prices`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `share_price_history`
--
ALTER TABLE `share_price_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pour la table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wallet_history`
--
ALTER TABLE `wallet_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wallet_share_price`
--
ALTER TABLE `wallet_share_price`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `share_price_history`
--
ALTER TABLE `share_price_history`
  ADD CONSTRAINT `fk_share_price_id_share_price_history` FOREIGN KEY (`share_price_id`) REFERENCES `share_prices` (`id`);

--
-- Contraintes pour la table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`share_price_history_id`) REFERENCES `share_price_history` (`id`);

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);


--
-- Contraintes pour la table `user_logins`
--
ALTER TABLE `user_logins`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `wallet_history`
--
ALTER TABLE `wallet_history`
  ADD CONSTRAINT `fk_user_id_wallet_history` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `wallet_share_price`
--
ALTER TABLE `wallet_share_price`
  ADD CONSTRAINT `fk_share_price_id_wallet_share_price` FOREIGN KEY (`share_price_id`) REFERENCES `share_prices` (`id`),
  ADD CONSTRAINT `fk_user_id_wallet_share_price` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 08, 2025 at 09:11 PM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pathe_rillettes`
--

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id_movie` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `categories` varchar(200) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `ref` varchar(200) NOT NULL,
  `description` varchar(10000) NOT NULL,
  `review` float NOT NULL,
  `poster_ref` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id_movie`, `title`, `categories`, `duration`, `views`, `ref`, `description`, `review`, `poster_ref`) VALUES
(4, 'The Shining', '27, 53', 0, 12, '../movies/shining-1980-_fre_720p.mp4', 'Jack Torrance accepts a caretaker job at the Overlook Hotel, where he, along with his wife Wendy and their son Danny, must live isolated from the rest of the world for the winter. But they aren\'t prepared for the madness that lurks within.', 8.2, 'https://image.tmdb.org/t/p/w500//fFYAlrOudDJRYs8tvuHbUk0OGdL.jpg'),
(5, 'Full Metal Jacket', '18, 10752', 0, 28, '../movies/full-metal-jacket-1987-_fre_720p.mp4', 'A pragmatic U.S. Marine observes the dehumanizing effects the U.S.-Vietnam War has on his fellow recruits from their brutal boot camp training to the bloody street fighting in Hue.', 8.127, 'https://image.tmdb.org/t/p/w500//kMKyx1k8hWWscYFnPbnxxN4Eqo4.jpg'),
(7, 'Wicked', '18, 10749, 14', 0, 8, '../movies/Wicked 2024 Multi Vfq 720P WEBRIP.mkv', 'Elphaba, une jeune femme incomprise à cause de sa peau verte inhabituelle, doit encore découvrir son véritable pouvoir. Glinda, une jeune femme populaire, dorée par le privilège et l\'ambition, doit encore découvrir son véritable cœur. Les deux se rencontrent en tant qu\'étudiantes à l\'Université de Shiz dans le fantastique Pays d\'Oz et forgent une amitié improbable, mais profonde.', 7.363, 'https://image.tmdb.org/t/p/w500//kQkgPhj6sCuoMWzPKWQVOWUXzib.jpg'),
(8, 'Anatomie d\'une chute', '53, 9648, 80', 0, 4, '../movies/anatomie.d.une.chute.2023.french.720p.webrip.h264_fre_720p.mp4', 'Alors qu\'une femme est suspectée du meurtre de son mari, son fils aveugle est placé face à un dilemme moral en tant qu\'unique témoin.', 7.552, 'https://image.tmdb.org/t/p/w500//nSwQKCsDdj2S56mG7Yz2YGfrLT6.jpg'),
(9, 'Orange Mécanique', '878, 80', 0, 0, '../movies/orange-mecanique-1971_fre_720p.mp4', 'Au XXIe siècle, où règnent la violence et le sexe, Alex, jeune chef de bande, exerce avec sadisme une terreur aveugle. Après son emprisonnement, des psychanalystes l\'emploient comme cobaye dans des expériences destinées à juguler la criminalité…', 8.192, 'https://image.tmdb.org/t/p/w500//n2oKNiEq9DZljqs6xsxs8hnsW9p.jpg'),
(10, 'Pacific Rim', '28, 878, 12', 0, 7, '../movies/pacific-rim_fre_720p.mp4', 'Surgies des flots, des hordes de créatures monstrueuses, les \"Kaiju\", ont déclenché une guerre qui a fait des millions de victimes et épuisé les ressources naturelles de l\'humanité pendant des années. Pour les combattre, une arme d\'un genre nouveau a été mise au point : de gigantesques robots, les \"Jaegers\", contrôlés simultanément par deux pilotes qui communiquent par télépathie. Mais même les Jaegers semblent impuissants face aux redoutables Kaiju. Alors que la défaite paraît inéluctable, les forces armées qui protègent l\'humanité n\'ont d\'autre choix que d\'avoir recours à deux héros hors normes : un ancien pilote au bout du rouleau et une jeune femme en cours d\'entraînement qui font équipe pour manœuvrer un Jaeger légendaire, quoique d\'apparence obsolète. Ensemble, ils incarnent désormais le dernier rempart de l\'humanité contre une apocalypse de plus en plus imminente…', 6.906, 'https://image.tmdb.org/t/p/w500//d2rxCDKSQB1WyBkdgbIhIuhQ1CM.jpg'),
(11, 'La cité de la peur', '35', 0, 0, '../movies/la-cite-de-la-peur-1994_fre_720p.mp4', 'Lors du festival de Cannes 1993, Odile Deray, attachée de presse, a bien du mal à faire parler de « Red is dead », un film d’horreur au budget ridicule. Mais un tueur, qui se cache parmi les journalistes, va supprimer des projectionnistes selon le même mode opératoire que l’assassin de fiction du film. Profitant de cette incroyable publicité, Odile envoie Simon, principal acteur du film, sur la Croisette…', 7.496, 'https://image.tmdb.org/t/p/w500//xaTVWUrPbGM4SgrLOaaWLeUEafI.jpg'),
(12, 'Alien : Romulus', '27, 878', 0, 23, '../movies/alien-romulus-2024_fre_720p.mp4', 'Quelques années après les événements sur le vaisseau Nostromo, un groupe de jeunes colons de l\'espace travaillent en tant que mineurs dans l\'espoir de rejoindre une autre planète verdoyante, Yvaga. Un des membres propose d\'utiliser une station spatiale abandonnée en orbite autour de leur planète actuelle afin de se rendre sur Yvaga. Cependant, ils se retrouvent face-à-face avec la forme de vie la plus terrifiante de l\'univers alors qu\'ils fouillent les profondeurs de cette station.', 7.2, 'https://image.tmdb.org/t/p/w500//xmDypImhT0OOloQIj3JLslUrBw8.jpg'),
(13, 'Le Chant du loup', '53, 28, 12', 0, 6, '../movies/le-chant-du-loup-2019_fre_720p.mp4', 'Un jeune homme a le don rare de reconnaître chaque son qu’il entend. A bord d’un sous-marin nucléaire français, tout repose sur lui, l’Oreille d’Or.  Réputé infaillible, il commet pourtant une erreur qui met l’équipage en danger de mort. Il veut retrouver la confiance de ses camarades mais sa quête les entraîne dans une situation encore plus dramatique. Dans le monde de la dissuasion nucléaire et de la désinformation, ils se retrouvent tous pris au piège d’un engrenage incontrôlable.', 7.5, 'https://image.tmdb.org/t/p/w500//hy2rqt5TezQUnca8k1HZalQzqHs.jpg'),
(14, 'Dune', '878, 12', 0, 1, '../movies/dune-2021_fre_720p.mp4', 'L\'histoire de Paul Atreides, jeune homme aussi doué que brillant, voué à connaître un destin hors du commun qui le dépasse totalement. Car, s\'il veut préserver l\'avenir de sa famille et de son peuple, il devra se rendre sur Dune, la planète la plus dangereuse de l\'Univers. Mais aussi la seule à même de fournir la ressource la plus précieuse capable de décupler la puissance de l\'Humanité. Tandis que des forces maléfiques se disputent le contrôle de cette planète, seuls ceux qui parviennent à dominer leur peur pourront survivre…', 7.786, 'https://image.tmdb.org/t/p/w500//qpyaW4xUPeIiYA5ckg5zAZFHvsb.jpg'),
(15, 'Dune : Deuxième partie', '878, 12', 0, 0, '../movies/dune-part-two-2024-truefrench_fre_720p.mp4', 'Le voyage mythique de Paul Atreides qui s\'allie à Chani et aux Fremen dans sa quête de vengeance envers les conspirateurs qui ont anéanti sa famille. Devant choisir entre l\'amour de sa vie et le destin de l\'univers, il fera tout pour éviter un terrible futur que lui seul peut prédire.', 8.2, 'https://image.tmdb.org/t/p/w500//rBrJl1vUtaM6NU0EwxKSnc3nBxE.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `active` tinyint(1) DEFAULT '0',
  `token` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `mail`, `password`, `active`, `token`) VALUES
(1, 'theo.pellefigue@gmail.com', '$2y$10$NsJ1NipDmuofw3cdoPh/ouq3tRqqvU92/zWU0Gl2uNxUy3aYxV5x2', 1, ''),
(16, 'jeanlouis.lamare@gmail.com', '$2y$10$azPmCSramejW6adhJJoP/ewNID5cRqbX/.HRZSdMAuVGz6Jj6fHP.', 1, '409b10d98ccebee1d96d450268fc53c02e94da32a74a2f419f66b7e494ee10ac9e1e6459769038421f285be9f69991ddac66'),
(17, 'test@test.test', '$2y$10$FXmrKOQWjKWkgU7lxhtxY.cYr0x0/lyMjZx62iXISb/Vd8RD6V7b2', 1, '10701d51a5a4ad6852932c74e0e2ff5ec01d274735f737ca2fa1c0764615772266023fdc8635c1bfcaa628172efd5cf095c4');

-- --------------------------------------------------------

--
-- Table structure for table `user_movie`
--

CREATE TABLE `user_movie` (
  `id_user` int(11) NOT NULL,
  `id_movie` int(11) NOT NULL,
  `is_started` tinyint(1) NOT NULL DEFAULT '0',
  `is_finished` tinyint(1) NOT NULL DEFAULT '0',
  `in_list` tinyint(1) NOT NULL DEFAULT '0',
  `time_code` int(11) NOT NULL DEFAULT '0',
  `duration` int(11) NOT NULL DEFAULT '0',
  `watch_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_movie`
--

INSERT INTO `user_movie` (`id_user`, `id_movie`, `is_started`, `is_finished`, `in_list`, `time_code`, `duration`, `watch_date`) VALUES
(1, 4, 0, 0, 0, 0, 0, '2025-01-07 16:54:52'),
(1, 5, 1, 0, 0, 1000, 6990, '2025-01-08 20:49:21'),
(1, 7, 0, 0, 0, 0, 0, '2025-01-08 00:37:28'),
(1, 8, 0, 0, 0, 0, 0, '2025-01-08 00:35:18'),
(1, 9, 0, 0, 1, 0, 0, '2025-01-07 16:58:04'),
(1, 10, 1, 0, 0, 0, 0, '2025-01-08 17:29:31'),
(1, 12, 1, 0, 0, 1260, 7185, '2025-01-08 20:47:16'),
(1, 13, 1, 0, 0, 1900, 6944, '2025-01-08 15:52:52'),
(1, 14, 1, 0, 0, 940, 9326, '2025-01-08 00:38:03'),
(1, 15, 0, 0, 0, 0, 0, '2025-01-08 02:30:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id_movie`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `user_movie`
--
ALTER TABLE `user_movie`
  ADD PRIMARY KEY (`id_user`,`id_movie`),
  ADD KEY `foreign_key_id_movie` (`id_movie`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id_movie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_movie`
--
ALTER TABLE `user_movie`
  ADD CONSTRAINT `foreign_key_id_movie` FOREIGN KEY (`id_movie`) REFERENCES `movies` (`id_movie`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign_key_id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

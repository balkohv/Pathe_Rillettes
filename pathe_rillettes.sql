-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 25, 2025 at 07:42 PM
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
  `duration` varchar(200) DEFAULT NULL,
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
(18, '24', 'Action, Crime, Drama', '44 min', 2, '', 'Counter Terrorism Agent Jack Bauer races against the clock to subvert terrorist plots and save his nation from ultimate disaster.', 0, 'https://m.media-amazon.com/images/M/MV5BMTg5OTkyNzA0NF5BMl5BanBnXkFtZTcwMDYyMDUwMg@@._V1_SX300.jpg'),
(19, '90210', 'Comedy, Drama, Romance', '2 min', 0, '', 'A Kansas family relocates to Beverly Hills, where their two children adapt to the infamous social drama of West Beverly Hills High.', 0, 'https://m.media-amazon.com/images/M/MV5BMTMxNzE4OTE2OV5BMl5BanBnXkFtZTcwNDQxMTY4MQ@@._V1_SX300.jpg'),
(20, 'Angel', 'Action, Adventure, Drama', '16S min', 0, '', 'The vampire Angel, cursed with a soul, moves to Los Angeles and aids people with supernatural-related problems while questing for his own redemption.', 0, 'https://m.media-amazon.com/images/M/MV5BMjQzMTliMWYtNDQ3Ny00MTdmLWJjODQtNTk3NTcyZDMwMmMwXkEyXkFqcGc@._V1_SX300.jpg'),
(21, 'Blade', 'Action, Horror, Sci-Fi', '120 min', 0, '', 'A half-vampire, half-mortal man becomes a protector of the mortal race, while slaying evil vampires.', 0, 'https://m.media-amazon.com/images/M/MV5BNzAzMmY3OWMtNDgyMS00Y2U4LTlmM2UtY2YwMmM0MDI5ODJmXkEyXkFqcGc@._V1_SX300.jpg'),
(22, 'Bloodties', 'Short, Crime', '5 min', 0, '', 'Anthony has a decision he must make. After he decides, everything unravels around him.', 0, 'N/A'),
(23, 'Buffy', 'Short', '7 min', 0, '', 'A portrait of Canadian folk music icon Buffy Sainte-Marie', 0, 'https://m.media-amazon.com/images/M/MV5BMTgxMzYyNGItZmY0MS00ZWU2LTllMzgtODdiMmFjZWUzMmEzXkEyXkFqcGc@._V1_SX300.jpg'),
(24, 'Californication', 'Comedy, Drama', '28 min', 0, '', 'A writer tries to juggle his career, his relationship with his daughter and his ex-girlfriend, as well as his appetite for beautiful women.', 0, 'https://m.media-amazon.com/images/M/MV5BMjAyMDM2ODExNF5BMl5BanBnXkFtZTgwNTI2MjkzMTE@._V1_SX300.jpg'),
(25, 'Caprica', 'Action, Drama, Sci-Fi', '60 min', 1, '', 'Two families, the Graystones and the Adamas, live together on a peaceful planet known as Caprica, where a startling breakthrough in artificial intelligence brings about unforeseen consequences.', 0, 'https://m.media-amazon.com/images/M/MV5BNTA2NGZiOGUtNDI2My00NjAxLWFjZDItNzNhYTJmNmY4MjhiXkEyXkFqcGc@._V1_SX300.jpg'),
(26, 'Charmed', 'Drama, Fantasy, Mystery', '42 min', 0, '', 'Three Halliwell sisters discover that they are descendants of a line of good female witches and are destined to fight against the forces of evil, using their combined power of witchcraft known as the \"Power of Three\".', 0, 'https://m.media-amazon.com/images/M/MV5BOGU5MGU3NmYtOTIzNi00NTg2LTkxMWUtNjQwMzhiNWQ5NzQ0XkEyXkFqcGc@._V1_SX300.jpg'),
(27, 'Chuck', 'Action, Comedy, Drama', '1 min', 0, '', 'When a computer geek inadvertently downloads critical government secrets into his brain, both the CIA and the NSA assign an agent to protect him and exploit his newfound skills.', 0, 'https://m.media-amazon.com/images/M/MV5BMTM0ODIwNjI3NF5BMl5BanBnXkFtZTcwODU2ODUzMw@@._V1_SX300.jpg'),
(28, 'Community', 'Comedy', '22 min', 0, '', 'A suspended lawyer is forced to enroll in a community college with an eccentric staff and student body.', 0, 'https://m.media-amazon.com/images/M/MV5BOGIwYzNmYTktZWExZC00MzAyLTk4NTItODgwZmIyNWZhNDEyXkEyXkFqcGc@._V1_SX300.jpg'),
(29, 'Cupid', 'Horror', '83 min', 0, '', 'After being horrendously embarrassed by the mean girls at school, Faye, a practicing witch, summons the evil Cupid to take revenge on all those who wronged her.', 0, 'https://m.media-amazon.com/images/M/MV5BMzUyMTI5MTctYmY1MC00YTM5LTllOWYtOWRjZWY3YzY0NGY3XkEyXkFqcGc@._V1_SX300.jpg'),
(30, 'Demons', 'Horror', '88 min', 0, '', 'A group of random people are invited to a screening of a mysterious movie, only to find themselves trapped in the theater with ravenous demons.', 0, 'https://m.media-amazon.com/images/M/MV5BNDQ3Nzc2ZjctNTc2Yi00ZDRkLThmY2EtNDEyNTYwZjIzMGFmXkEyXkFqcGc@._V1_SX300.jpg'),
(31, 'Dirt', 'Drama', '60 min', 0, '', 'A tabloid editor and her photographer try to make their way in the world of celebrity journalism.', 0, 'https://m.media-amazon.com/images/M/MV5BMTQwNjIxMDk5NV5BMl5BanBnXkFtZTcwMTcwNjE2MQ@@._V1_SX300.jpg'),
(32, 'Dollhouse', 'Drama, Mystery, Sci-Fi', '42S min', 0, '', 'A top secret organization erases the identities of attractive young people, turning them into blank \"dolls\" ready for imprints of temporary identities they need to fulfill assignments for clients.', 0, 'https://m.media-amazon.com/images/M/MV5BNDY1ODU5MDQ0M15BMl5BanBnXkFtZTcwMTM2MTA4Mg@@._V1_SX300.jpg'),
(33, 'Entourage', 'Comedy, Drama', '28 min', 0, '', 'Film star, Vince Chase, navigates the vapid terrain of Los Angeles with a close circle of friends and his trusty agent.', 0, 'https://m.media-amazon.com/images/M/MV5BZjEyYWJlMDktNGEwMi00OTRjLWE4YzgtOTMwNDc0NzQzMDlmXkEyXkFqcGc@._V1_SX300.jpg'),
(34, 'Eureka', 'Adventure, Comedy, Drama', '60 min', 0, '', 'A U.S. Marshal becomes the sheriff of Eureka, a remote, cozy little Northwestern town where the best minds in the US have secretly been tucked away to build futuristic inventions for the government which often go disastrously wrong.', 0, 'https://m.media-amazon.com/images/M/MV5BMDNlZjFhYWUtYTM0My00ZjQ1LWJhYzktYzM4ZWQ5Yzk3NjEyXkEyXkFqcGc@._V1_SX300.jpg'),
(35, 'Flashforward', 'Drama, Mystery, Sci-Fi', '42 min', 0, '', 'A special task force in the FBI investigates after every person on Earth simultaneously blacks out and awakens with a short vision of their future.', 0, 'https://m.media-amazon.com/images/M/MV5BMTgwY2NhOGYtZGFlNS00NGJkLWJjNGEtYzE3MGIyYTJlMzU1XkEyXkFqcGc@._V1_SX300.jpg'),
(36, 'Friends', 'Comedy, Romance', '22 min', 0, '', 'Follows the personal and professional lives of six twenty to thirty year-old friends living in the Manhattan borough of New York City.', 0, 'https://m.media-amazon.com/images/M/MV5BOTU2YmM5ZjctOGVlMC00YTczLTljM2MtYjhlNGI5YWMyZjFkXkEyXkFqcGc@._V1_SX300.jpg'),
(37, 'Fringe', 'Drama, Mystery, Sci-Fi', '2 min', 0, '', 'An F.B.I. agent is forced to work with an institutionalized scientist and his son in order to rationalize a brewing storm of unexplained phenomena.', 0, 'https://m.media-amazon.com/images/M/MV5BMWVlMmE1MmEtNjhjMC00MDdmLWIzZGMtNjc1YTZmNDc2MWExXkEyXkFqcGc@._V1_SX300.jpg'),
(38, 'Heroes', 'Crime, Drama, Fantasy', '45 min', 0, '', 'Common people discover that they have super powers. Their lives intertwine as a devastating event must be prevented.', 0, 'https://m.media-amazon.com/images/M/MV5BMjI3ODU0OTQ1MV5BMl5BanBnXkFtZTgwNzI0MTQ2MzE@._V1_SX300.jpg'),
(39, 'House', 'Drama, Mystery', '44 min', 0, '', 'Using a crack team of doctors and his wits, an antisocial maverick doctor specializing in diagnostic medicine does whatever it takes to solve puzzling cases that come his way.', 0, 'https://m.media-amazon.com/images/M/MV5BMjgxYjAwNmMtYTAwZC00YmQxLWJlOTMtMWM0NGJmNDE0YmI2XkEyXkFqcGc@._V1_SX300.jpg'),
(40, 'Jekyll', 'Crime, Horror, Sci-Fi', '334 min', 0, '', 'Brilliant scientist Tom Jackman shares his body with a wicked alter ego while an ancient organization monitors their conflict. Tom uses technology to watch over his sinister half and keep his family safe, as a centuries-old plan u...', 0, 'https://m.media-amazon.com/images/M/MV5BMTUzMjkzNDY0MF5BMl5BanBnXkFtZTcwNDQyMzA1MQ@@._V1_SX300.jpg'),
(41, 'Jericho', 'Action, Drama, Mystery', '45 min', 0, '', 'A small town in Kansas is literally left in the dark after seeing a mushroom cloud over nearby Denver, Colorado. The townspeople struggle to find answers about the blast and solutions on how to survive.', 0, 'https://m.media-amazon.com/images/M/MV5BMWU3ZTg3OWQtZWIwNi00ZGI3LWFmYzQtYWFmOTY1NWNhOWI0XkEyXkFqcGc@._V1_SX300.jpg'),
(42, 'Leverage', 'Crime, Mystery, Thriller', '42 min', 0, '', 'Nathan Ford and his five-member team of thieves and hackers come together like modern-day Robin Hoods in an attempt to steal from rich and powerful individuals who take advantage of others.', 0, 'https://m.media-amazon.com/images/M/MV5BODBmMzFjM2EtYWE0OC00YWNiLWExN2MtZmViMzM1ZDk5ZGZjXkEyXkFqcGc@._V1_SX300.jpg'),
(43, 'Life', 'Horror, Sci-Fi, Thriller', '104 min', 0, '', 'A team of scientists aboard the International Space Station discover a rapidly evolving life form that caused extinction on Mars and now threatens all life on Earth.', 0, 'https://m.media-amazon.com/images/M/MV5BNWNkYWYzNGUtOWVjNS00MGY0LWIyY2YtODllNGIxOGRlOTgyXkEyXkFqcGc@._V1_SX300.jpg'),
(44, 'Lost', 'Adventure, Drama, Fantasy', '44 min', 0, '', 'The survivors of a plane crash are forced to work together in order to survive on a seemingly deserted tropical island.', 0, 'https://m.media-amazon.com/images/M/MV5BZmZhY2ViYzYtMTQ0NS00NDcyLWIxZTYtMGUyODE0NDA0NmNkXkEyXkFqcGc@._V1_SX300.jpg'),
(45, 'Madmen', 'Action, Comedy', '85 min', 0, '', 'A comedy about two young guys who escape from psychiatric hospital.', 0, 'N/A'),
(46, 'Medium', 'Crime, Drama, Fantasy', '60 min', 0, '', 'Suburban mom Allison DuBois attempts to balance family life with solving mysteries using her special gift. The dead send her visions of their deaths or other crimes while she sleeps.', 0, 'https://m.media-amazon.com/images/M/MV5BMTIyMTE3MTA2N15BMl5BanBnXkFtZTcwMjU3NTg1MQ@@._V1_SX300.jpg'),
(47, 'Merlin', 'Adventure, Drama, Fantasy', '45 min', 0, '', 'These are the brand new adventures of Merlin, the legendary sorcerer as a young man, when he was just a servant to young Prince Arthur on the royal court of Camelot, who has soon become his best friend, and turned Arthur into a gr...', 0, 'https://m.media-amazon.com/images/M/MV5BNmI5NDgyZmQtNDc3YS00Mjg0LThmMzEtZjcyNzczOTJlYWY4XkEyXkFqcGc@._V1_SX300.jpg'),
(48, 'Moonlight', 'Drama', '111 min', 0, '', 'A young African-American man grapples with his identity and sexuality while experiencing the everyday struggles of childhood, adolescence, and burgeoning adulthood.', 0, 'https://m.media-amazon.com/images/M/MV5BNzQxNTIyODAxMV5BMl5BanBnXkFtZTgwNzQyMDA3OTE@._V1_SX300.jpg'),
(49, 'NCIS', 'Action, Crime, Drama', '17S min', 0, '', 'Follows the Major Case Response Team (MCRT) from the Naval Criminal Investigative Service (NCIS), as they get to the bottom of criminal cases connected to Navy and Marine Corps personnel.', 0, 'https://m.media-amazon.com/images/M/MV5BZGExNmI3NDMtMjYxYS00Y2ZmLTlkNmItMGNkNTQ1MzA1ZGM1XkEyXkFqcGc@._V1_SX300.jpg'),
(50, 'Oz', 'Crime, Drama, Thriller', '31S min', 0, '', 'A series chronicling the daily activities of an unusual prison facility and its criminal inhabitants.', 0, 'https://m.media-amazon.com/images/M/MV5BOTk3ZGE4ZjAtNDk2ZS00ZGRmLTljNTYtNTU3Nzc5NWQ2Y2Y4XkEyXkFqcGc@._V1_SX300.jpg'),
(51, 'Psych', 'Comedy, Crime, Mystery', '44 min', 0, '', 'When a novice sleuth convinces the police he has psychic powers, he and his reluctant best friend are hired on as consultants to help solve complicated cases.', 0, 'https://m.media-amazon.com/images/M/MV5BNDhiNDEwZDAtNGY3NS00ODU3LWE2NjUtYWNiNGFhZjIyMDg5XkEyXkFqcGc@._V1_SX300.jpg'),
(52, 'Reaper', 'Adventure, Comedy, Drama', '4 min', 0, '', 'On his 21st birthday, Sam discovers his parents sold his soul to the devil before birth and he must now be a bounty hunter for the devil until he dies.', 0, 'https://m.media-amazon.com/images/M/MV5BNDYzMDM1NDkwOF5BMl5BanBnXkFtZTcwMDAyMDU1MQ@@._V1_SX300.jpg'),
(53, 'Robinhood', 'N/A', 'N/A', 0, '', 'N/A', 0, 'https://m.media-amazon.com/images/M/MV5BODU3YmNhNjEtMTZiNi00OGQ1LWE2YjItNjU2ZjFhYjNmODVlXkEyXkFqcGdeQXVyMTQ3Mzk2MDg4._V1_SX300.jpg'),
(54, 'Rome', 'Action, Drama, Romance', '52 min', 0, '', 'A down-to-earth account of the lives of both illustrious and ordinary Romans set in the last days of the Roman Republic.', 0, 'https://m.media-amazon.com/images/M/MV5BMGQ0M2YxMGEtMDQ2MC00NGEwLTliMTQtODVkYWZkNDFkM2Y3XkEyXkFqcGc@._V1_SX300.jpg'),
(55, 'Scrubs', 'Comedy, Drama', '1 min', 0, '', 'In the unreal world of Sacred Heart Hospital, intern John \"J.D.\" Dorian learns the ways of medicine, friendship and life.', 0, 'https://m.media-amazon.com/images/M/MV5BZDYwNTk4YzEtMTRjNS00YWZjLTlkOWYtYzFlYWQyMjU2ZjkwXkEyXkFqcGc@._V1_SX300.jpg'),
(56, 'Skins', 'Drama', '1 min', 0, '', 'The story of a group of British teens who are trying to grow up and find love and happiness despite questionable parenting and teachers who would rather be friends (and lovers) than authority figures.', 0, 'https://m.media-amazon.com/images/M/MV5BNTBhMjc1ZmMtZDgxMi00ZjdhLWE1ZTktYWQ5YTI0MzE2MTFmXkEyXkFqcGc@._V1_SX300.jpg'),
(57, 'Smallville', 'Action, Adventure, Drama', '1 min', 0, '', 'A young Clark Kent struggles to find his place in the world as he learns to harness his alien powers for good and deals with the typical troubles of teenage life in Smallville, Kansas.', 0, 'https://m.media-amazon.com/images/M/MV5BZDU0ZDVjOTItMDNkMy00YTI0LWFjYzItY2M1NjU5NjAzZGViXkEyXkFqcGc@._V1_SX300.jpg'),
(58, 'Spaced', 'Comedy', '25 min', 0, '', 'Friends Tim and Daisy, 20-something North Londoners with uncertain futures, must pretend to be a couple to live in the only apartment they can afford.', 0, 'https://m.media-amazon.com/images/M/MV5BNjcwN2JiOGUtNDJkNy00NjVmLWIyYzctZDU4YWFlNjRlZmJlXkEyXkFqcGc@._V1_SX300.jpg'),
(59, 'Swingtown', 'Drama', 'N/A', 0, '', 'As America celebrates its 200th birthday, two generations of friends and neighbors in a Chicago suburb explore new freedoms and seek connections with each other in the midst of the socio/sexual revolution.', 0, 'https://m.media-amazon.com/images/M/MV5BNTIxY2NmYjctNzZjYi00NjhjLWFhMmMtY2E5MjQzNWMzZjEwXkEyXkFqcGc@._V1_SX300.jpg'),
(60, 'Torchwood', 'Action, Drama, Mystery', '50 min', 0, '', 'The members of the Torchwood Institute, a secret organization founded by the British Crown, fight to protect the Earth from extraterrestrial and supernatural threats.', 0, 'https://m.media-amazon.com/images/M/MV5BMDliY2E3NzctNzIyNC00ODM4LWExMTEtYmFmZDJjZmE3MmI5XkEyXkFqcGc@._V1_SX300.jpg'),
(61, 'Traveler', 'Action, Crime, Mystery', '45 min', 0, '', 'Jay and Tyler are hunted by the FBI after the bombing of a museum. Their only lead is their best friend, Will Traveler, who disappeared. What part did he play in this nightmare of violence, death and conspiracies. Who is Will Trav...', 0, 'https://m.media-amazon.com/images/M/MV5BNmFkOTEwNTUtNjIwZS00MjMxLWJlZDItZTA4NjBiZjM0ZTZkXkEyXkFqcGc@._V1_SX300.jpg'),
(62, 'V', 'Drama, Sci-Fi, Thriller', '42 min', 0, '', 'An extraterrestrial race arrives on Earth with seemingly good intentions, only to slowly reveal their true machinations the more ingrained into society they become.', 0, 'https://m.media-amazon.com/images/M/MV5BMTYxNTQ5NTg2Ml5BMl5BanBnXkFtZTcwODUyNTY5Mg@@._V1_SX300.jpg'),
(63, 'Weeds', 'Comedy, Crime, Drama', '28 min', 0, '', 'When a suburban mother turns to dealing marijuana in order to maintain her privileged lifestyle after her husband dies, she finds out just how addicted her entire neighborhood already is.', 0, 'https://m.media-amazon.com/images/M/MV5BOWVmOGQyNDEtY2Y1NS00MGM2LWI5ZTMtNmJmOGUwNjY0N2FkXkEyXkFqcGc@._V1_SX300.jpg'),
(64, 'Whitechapel', 'Crime, Mystery, Thriller', '180 min', 0, '', 'A fast-tracked inspector, a hardened detective sergeant, and an expert in historical homicides investigate modern crimes with connections to the past in the Whitechapel district of London.', 0, 'https://m.media-amazon.com/images/M/MV5BODM3OTc2YzgtNDViZS00ZGM0LTk4NjMtZjM1MjQyZDU0Mjk1XkEyXkFqcGc@._V1_SX300.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `active` tinyint(1) DEFAULT '1',
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
  `watch_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `vote` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_movie`
--

INSERT INTO `user_movie` (`id_user`, `id_movie`, `is_started`, `is_finished`, `in_list`, `time_code`, `duration`, `watch_date`, `vote`) VALUES
(1, 18, 1, 0, 0, 10000, 5, '2025-01-25 19:36:48', 0),
(1, 19, 0, 0, 1, 0, 0, '2025-01-25 19:30:46', 0),
(1, 21, 0, 0, 0, 0, 0, '2025-01-25 20:40:33', 0),
(1, 22, 0, 0, 0, 0, 0, '2025-01-25 20:12:04', 0),
(1, 23, 0, 0, 0, 0, 0, '2025-01-25 20:11:59', 0),
(1, 25, 0, 0, 0, 10000, 0, '2025-01-25 19:36:44', 0),
(1, 53, 0, 0, 0, 0, 0, '2025-01-25 20:16:21', 0),
(1, 59, 0, 0, 0, 0, 0, '2025-01-25 20:11:02', 0);

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
  MODIFY `id_movie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

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

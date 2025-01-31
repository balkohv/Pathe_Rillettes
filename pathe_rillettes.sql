-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 30 jan. 2025 à 21:06
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `pathe_rillettes`
--

-- --------------------------------------------------------

--
-- Structure de la table `movies`
--

CREATE TABLE `movies` (
  `id_movie` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `categories` varchar(200) DEFAULT NULL,
  `duration` varchar(200) DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `ref` varchar(200) NOT NULL,
  `description` varchar(10000) NOT NULL,
  `review` float NOT NULL,
  `poster_ref` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `movies`
--

INSERT INTO `movies` (`id_movie`, `title`, `categories`, `duration`, `views`, `ref`, `description`, `review`, `poster_ref`) VALUES
(83437, 'Knight Rider', 'Action, Crime, Drama', '59S min', 1, '', 'A lone crimefighter battles the forces of evil with the help of a virtually indestructible and artificially intelligent supercar.', 0, 'https://m.media-amazon.com/images/M/MV5BZjlmZmMwN2MtOWU5OC00ZTE3LThiNjctNTFmYmQyNzM2NzY3XkEyXkFqcGc@._V1_SX300.jpg'),
(89013, 'Demons', 'Horror', '88 min', 0, '', 'A group of random people are invited to a screening of a mysterious movie, only to find themselves trapped in the theater with ravenous demons.', 0, 'https://m.media-amazon.com/images/M/MV5BNDQ3Nzc2ZjctNTc2Yi00ZDRkLThmY2EtNDEyNTYwZjIzMGFmXkEyXkFqcGc@._V1_SX300.jpg'),
(103491, 'Melrose Place', 'Drama, Romance', 'N/A', 0, '', 'Classic serial drama around a group of friends living in Melrose Place, California.', 0, 'https://m.media-amazon.com/images/M/MV5BMTcxOTU5NjE0M15BMl5BanBnXkFtZTcwMTY2MzYzMQ@@._V1_SX300.jpg'),
(108778, 'Friends', 'Comedy, Romance', '22 min', 0, '', 'Follows the personal and professional lives of six twenty to thirty year-old friends living in the Manhattan borough of New York City.', 0, 'https://m.media-amazon.com/images/M/MV5BOTU2YmM5ZjctOGVlMC00YTczLTljM2MtYjhlNGI5YWMyZjFkXkEyXkFqcGc@._V1_SX300.jpg'),
(115320, 'The Pretender', 'Action, Drama, Mystery', '45S min', 0, '', 'A specially gifted man, with the ability to instantly master any skill, escapes from a secret testing facility and travels the country taking on different jobs and helping strangers while hiding from his kidnappers.', 0, 'https://m.media-amazon.com/images/M/MV5BMzk5MzQ0NDMtNjVkYS00YzAxLWExMTktYTc0NzYxYjI0Y2VjXkEyXkFqcGc@._V1_SX300.jpg'),
(118276, 'Buffy the Vampire Slayer', 'Action, Adventure, Drama', '44 min', 0, '', 'A young woman, destined to slay vampires, demons and other infernal creatures, deals with her life fighting evil, with the help of her friends.', 0, 'https://m.media-amazon.com/images/M/MV5BMDk4MGVkNDAtZjQwZi00MDc3LWE4MmEtY2YyODQ2NDQyMjgxXkEyXkFqcGc@._V1_SX300.jpg'),
(118421, 'Oz', 'Crime, Drama, Thriller', '31S min', 0, '', 'A series chronicling the daily activities of an unusual prison facility and its criminal inhabitants.', 0, 'https://m.media-amazon.com/images/M/MV5BOTk3ZGE4ZjAtNDk2ZS00ZGRmLTljNTYtNTU3Nzc5NWQ2Y2Y4XkEyXkFqcGc@._V1_SX300.jpg'),
(120611, 'Blade', 'Action, Horror, Sci-Fi', '120 min', 0, '', 'A half-vampire, half-mortal man becomes a protector of the mortal race, while slaying evil vampires.', 0, 'https://m.media-amazon.com/images/M/MV5BNzAzMmY3OWMtNDgyMS00Y2U4LTlmM2UtY2YwMmM0MDI5ODJmXkEyXkFqcGc@._V1_SX300.jpg'),
(121955, 'South Park', 'Animation, Comedy', '22 min', 0, '', 'Follows the misadventures of four irreverent grade-schoolers in the quiet, dysfunctional town of South Park, Colorado.', 0, 'https://m.media-amazon.com/images/M/MV5BNTBlMzA3ZTUtODZjNi00NTM0LWExMjMtNjJhYzA3YTkwMWYwXkEyXkFqcGc@._V1_SX300.jpg'),
(141842, 'The Sopranos', 'Crime, Drama', '55 min', 0, '', 'New Jersey mob boss Tony Soprano deals with personal and professional issues in his home and business life that affect his mental state, leading him to seek professional psychiatric counseling.', 0, 'https://m.media-amazon.com/images/M/MV5BMjRmMTNiMTQtMDg1ZS00MGM1LWE1MGUtYjEzMGFjNWUzOWRkXkEyXkFqcGc@._V1_SX300.jpg'),
(158552, 'Charmed', 'Drama, Fantasy, Mystery', '42 min', 0, '', 'Three Halliwell sisters discover that they are descendants of a line of good female witches and are destined to fight against the forces of evil, using their combined power of witchcraft known as the \"Power of Three\".', 0, 'https://m.media-amazon.com/images/M/MV5BOGU5MGU3NmYtOTIzNi00NTg2LTkxMWUtNjQwMzhiNWQ5NzQ0XkEyXkFqcGc@._V1_SX300.jpg'),
(159206, 'Sex and the City', 'Comedy, Drama, Romance', '31S min', 0, '', 'Four female New Yorkers gossip about their sex lives (or lack thereof) and find new ways to deal with being a woman in the late 1990s.', 0, 'https://m.media-amazon.com/images/M/MV5BNjMwNzczODYtZDQwZC00NjJmLTg5ZWYtYzUxZjViYmNhN2IyXkEyXkFqcGc@._V1_SX300.jpg'),
(162065, 'Angel', 'Action, Adventure, Drama', '16S min', 0, '', 'The vampire Angel, cursed with a soul, moves to Los Angeles and aids people with supernatural-related problems while questing for his own redemption.', 0, 'https://m.media-amazon.com/images/M/MV5BMjQzMTliMWYtNDQ3Ny00MTdmLWJjODQtNTk3NTcyZDMwMmMwXkEyXkFqcGc@._V1_SX300.jpg'),
(187664, 'Spaced', 'Comedy', '25 min', 0, '', 'Friends Tim and Daisy, 20-something North Londoners with uncertain futures, must pretend to be a couple to live in the only apartment they can afford.', 0, 'https://m.media-amazon.com/images/M/MV5BNjcwN2JiOGUtNDJkNy00NjVmLWIyYzctZDU4YWFlNjRlZmJlXkEyXkFqcGc@._V1_SX300.jpg'),
(248654, 'Six Feet Under', 'Comedy, Drama', '55 min', 0, '', 'When death is your business, what is your life? Laced with irony and dark situational humor, the show approaches the subject of death through the eyes of the Fisher family, who owns and operates a funeral home in Los Angeles.', 0, 'https://m.media-amazon.com/images/M/MV5BMDA5YTAxNGMtOWYxYy00ZDdkLWIwODUtNjdlYmNhMWQ5NzViXkEyXkFqcGc@._V1_SX300.jpg'),
(279600, 'Smallville', 'Action, Adventure, Drama', '1 min', 0, '', 'A young Clark Kent struggles to find his place in the world as he learns to harness his alien powers for good and deals with the typical troubles of teenage life in Smallville, Kansas.', 0, 'https://m.media-amazon.com/images/M/MV5BZDU0ZDVjOTItMDNkMy00YTI0LWFjYzItY2M1NjU5NjAzZGViXkEyXkFqcGc@._V1_SX300.jpg'),
(285331, '24', 'Action, Crime, Drama', '44 min', 0, '', 'Counter Terrorism Agent Jack Bauer races against the clock to subvert terrorist plots and save his nation from ultimate disaster.', 0, 'https://m.media-amazon.com/images/M/MV5BMTg5OTkyNzA0NF5BMl5BanBnXkFtZTcwMDYyMDUwMg@@._V1_SX300.jpg'),
(285403, 'Scrubs', 'Comedy, Drama', '1 min', 0, '', 'In the unreal world of Sacred Heart Hospital, intern John \"J.D.\" Dorian learns the ways of medicine, friendship and life.', 0, 'https://m.media-amazon.com/images/M/MV5BZDYwNTk4YzEtMTRjNS00YWZjLTlkOWYtYzFlYWQyMjU2ZjkwXkEyXkFqcGc@._V1_SX300.jpg'),
(286486, 'The Shield', 'Crime, Drama, Thriller', '47 min', 0, '', 'Follows a gang of corrupt Los Angeles Police Department (LAPD) cops called The Strike Team, who uses illegal methods to maintain law and order, whilst engaging in a series of undercover dealings secretly in order to get rich.', 0, 'https://m.media-amazon.com/images/M/MV5BMTcwNzQwODI5NV5BMl5BanBnXkFtZTcwNzQxMjI5MQ@@._V1_SX300.jpg'),
(306414, 'The Wire', 'Crime, Drama, Thriller', '59 min', 0, '', 'The Baltimore drug scene, as seen through the eyes of drug dealers and law enforcement.', 0, 'https://m.media-amazon.com/images/M/MV5BZWYyNmRhYjktNjBhNC00M2NhLWEzYmMtZDYwNmIyZTRiZWMzXkEyXkFqcGc@._V1_SX300.jpg'),
(364817, 'Tru Calling', 'Drama, Fantasy, Mystery', '16S min', 0, '', 'A university graduate working in the city morgue is able to repeat the same day over again to prevent murders or other disasters.', 0, 'https://m.media-amazon.com/images/M/MV5BZGQzMTU0YTctYWE4ZC00MWI2LWE2Y2UtOTcxYTkyNjA4MGUzXkEyXkFqcGc@._V1_SX300.jpg'),
(364845, 'NCIS', 'Action, Crime, Drama', '17S min', 0, '', 'Follows the Major Case Response Team (MCRT) from the Naval Criminal Investigative Service (NCIS), as they get to the bottom of criminal cases connected to Navy and Marine Corps personnel.', 0, 'https://m.media-amazon.com/images/M/MV5BZGExNmI3NDMtMjYxYS00Y2ZmLTlkNmItMGNkNTQ1MzA1ZGM1XkEyXkFqcGc@._V1_SX300.jpg'),
(368530, 'One Tree Hill', 'Drama, Romance, Sport', '60 min', 0, '', 'Half-brothers Lucas and Nathan Scott trade between kinship and rivalry both on the basketball court and in the hearts of their friends in the small, but not so quiet town of Tree Hill, North Carolina.', 0, 'https://m.media-amazon.com/images/M/MV5BMzk2YjJiNzMtZjk2Mi00ZGU5LWI1ZTUtNjIwMGI2NjZiMTVjXkEyXkFqcGc@._V1_SX300.jpg'),
(374455, 'Stargate: Atlantis', 'Action, Adventure, Drama', '1 min', 0, '', 'An international team of scientists and military personnel discover a Stargate network in the Pegasus Galaxy and come face-to-face with a new, powerful enemy: The Wraith.', 0, 'https://m.media-amazon.com/images/M/MV5BMjI0MTI4MTY3N15BMl5BanBnXkFtZTcwMjg1NjQ4NA@@._V1_SX300.jpg'),
(384766, 'Rome', 'Action, Drama, Romance', '52 min', 0, '', 'A down-to-earth account of the lives of both illustrious and ordinary Romans set in the last days of the Roman Republic.', 0, 'https://m.media-amazon.com/images/M/MV5BMGQ0M2YxMGEtMDQ2MC00NGEwLTliMTQtODVkYWZkNDFkM2Y3XkEyXkFqcGc@._V1_SX300.jpg'),
(387199, 'Entourage', 'Comedy, Drama', '28 min', 0, '', 'Film star, Vince Chase, navigates the vapid terrain of Los Angeles with a close circle of friends and his trusty agent.', 0, 'https://m.media-amazon.com/images/M/MV5BZjEyYWJlMDktNGEwMi00OTRjLWE4YzgtOTMwNDc0NzQzMDlmXkEyXkFqcGc@._V1_SX300.jpg'),
(389564, 'The 4400', 'Drama, Mystery, Sci-Fi', '43 min', 0, '', 'As the reappearance of 4,400 missing persons on a single day confounds the global community, federal agents on the case slowly discover the ways in which the victims have been changed.', 0, 'https://m.media-amazon.com/images/M/MV5BNjU5NDgxYmEtZjgzMy00Nzc1LWE5ZDMtZjFhMzZlNTFjZjdlXkEyXkFqcGc@._V1_SX300.jpg'),
(407362, 'Battlestar Galactica', 'Action, Adventure, Drama', '44 min', 0, '', 'When an old enemy, the Cylons, resurface and obliterate the 12 colonies, the crew of the aged Galactica protect a small civilian fleet - the last of humanity - as they journey toward the fabled 13th colony, Earth.', 0, 'https://m.media-amazon.com/images/M/MV5BNmMzYzdmNWMtM2ZmMi00Y2E2LWI5ZTMtYWJlNmJiMDgyYWRiXkEyXkFqcGc@._V1_SX300.jpg'),
(410975, 'Desperate Housewives', 'Comedy, Drama, Mystery', '45 min', 0, '', 'A close-knit group of housewives reside in Wisteria Lane. It may appear to be a seemingly perfect neighborhood but it hides many secrets, crimes, forbidden romances and domestic struggles.', 0, 'https://m.media-amazon.com/images/M/MV5BMDljYmI5OTktNDFmNC00NmIxLWFhODktM2YyM2JlODVmMWUwXkEyXkFqcGc@._V1_SX300.jpg'),
(411008, 'Lost', 'Adventure, Drama, Fantasy', '44 min', 0, '', 'The survivors of a plane crash are forced to work together in order to survive on a seemingly deserted tropical island.', 0, 'https://m.media-amazon.com/images/M/MV5BZmZhY2ViYzYtMTQ0NS00NDcyLWIxZTYtMGUyODE0NDA0NmNkXkEyXkFqcGc@._V1_SX300.jpg'),
(412142, 'House', 'Drama, Mystery', '44 min', 0, '', 'Using a crack team of doctors and his wits, an antisocial maverick doctor specializing in diagnostic medicine does whatever it takes to solve puzzling cases that come his way.', 0, 'https://m.media-amazon.com/images/M/MV5BMjgxYjAwNmMtYTAwZC00YmQxLWJlOTMtMWM0NGJmNDE0YmI2XkEyXkFqcGc@._V1_SX300.jpg'),
(412175, 'Medium', 'Crime, Drama, Fantasy', '60 min', 0, '', 'Suburban mom Allison DuBois attempts to balance family life with solving mysteries using her special gift. The dead send her visions of their deaths or other crimes while she sleeps.', 0, 'https://m.media-amazon.com/images/M/MV5BMTIyMTE3MTA2N15BMl5BanBnXkFtZTcwMjU3NTg1MQ@@._V1_SX300.jpg'),
(412253, 'Veronica Mars', 'Crime, Drama, Mystery', '2 min', 0, '', 'After her best friend is murdered, and her father is removed as county Sheriff, Veronica Mars dedicates her life to cracking the toughest mysteries in the affluent town of Neptune.', 0, 'https://m.media-amazon.com/images/M/MV5BYjYyODQ3OTktM2IyMC00ZDk4LWIzMjYtZjczN2FkZGRhMDYwXkEyXkFqcGc@._V1_SX300.jpg'),
(436992, 'Doctor Who', 'Adventure, Drama, Sci-Fi', '45 min', 0, '', 'The further adventures in time and space of the alien adventurer known as the Doctor and his companions from planet Earth.', 0, 'https://m.media-amazon.com/images/M/MV5BZGVmY2RkZjAtZDAwMC00MmZhLThhMGItZmVlNzE4MTgyMWRkXkEyXkFqcGc@._V1_SX300.jpg'),
(439100, 'Weeds', 'Comedy, Crime, Drama', '28 min', 0, '', 'When a suburban mother turns to dealing marijuana in order to maintain her privileged lifestyle after her husband dies, she finds out just how addicted her entire neighborhood already is.', 0, 'https://m.media-amazon.com/images/M/MV5BOWVmOGQyNDEtY2Y1NS00MGM2LWI5ZTMtNmJmOGUwNjY0N2FkXkEyXkFqcGc@._V1_SX300.jpg'),
(452046, 'Criminal Minds', 'Crime, Drama, Mystery', '42 min', 0, '', 'A group of criminal profilers who work for the FBI as members of its Behavioral Analysis Unit (BAU) using behavioral analysis and profiling to help investigate crimes and find the suspect known as the unsub.', 0, 'https://m.media-amazon.com/images/M/MV5BNjJhMWNjNGYtMmQ2Ny00NTdlLTlkOTAtNDc2NjA4MmQyOWFhXkEyXkFqcGc@._V1_SX300.jpg'),
(455275, 'Prison Break', 'Action, Crime, Drama', '44 min', 0, '', 'A structural engineer installs himself in a prison he helped design, in order to save his falsely accused brother from a death sentence by breaking themselves out from the inside.', 0, 'https://m.media-amazon.com/images/M/MV5BMTg3NTkwNzAxOF5BMl5BanBnXkFtZTcwMjM1NjI5MQ@@._V1_SX300.jpg'),
(460649, 'How I Met Your Mother', 'Comedy, Drama, Romance', '22 min', 0, '', 'A father recounts to his children - through a series of flashbacks - the journey he and his four best friends took leading up to him meeting their mother.', 0, 'https://m.media-amazon.com/images/M/MV5BNjg1MDQ5MjQ2N15BMl5BanBnXkFtZTYwNjI5NjA3._V1_SX300.jpg'),
(485301, 'Torchwood', 'Action, Drama, Mystery', '50 min', 0, '', 'The members of the Torchwood Institute, a secret organization founded by the British Crown, fight to protect the Earth from extraterrestrial and supernatural threats.', 0, 'https://m.media-amazon.com/images/M/MV5BMDliY2E3NzctNzIyNC00ODM4LWExMTEtYmFmZDJjZmE3MmI5XkEyXkFqcGc@._V1_SX300.jpg'),
(491738, 'Psych', 'Comedy, Crime, Mystery', '44 min', 0, '', 'When a novice sleuth convinces the police he has psychic powers, he and his reluctant best friend are hired on as consultants to help solve complicated cases.', 0, 'https://m.media-amazon.com/images/M/MV5BNDhiNDEwZDAtNGY3NS00ODU3LWE2NjUtYWNiNGFhZjIyMDg5XkEyXkFqcGc@._V1_SX300.jpg'),
(496275, 'Dirt', 'Drama', '60 min', 0, '', 'A tabloid editor and her photographer try to make their way in the world of celebrity journalism.', 0, 'https://m.media-amazon.com/images/M/MV5BMTQwNjIxMDk5NV5BMl5BanBnXkFtZTcwMTcwNjE2MQ@@._V1_SX300.jpg'),
(496343, 'The Riches', 'Comedy, Crime, Drama', '45 min', 0, '', 'A family of crooks assume the identity of an upper-middle-class suburban clan in the Deep South.', 0, 'https://m.media-amazon.com/images/M/MV5BNTgwYmY4MDktZWRlNi00NTU3LWIwOWUtNTYxMTA5MmVjNmY5XkEyXkFqcGc@._V1_SX300.jpg'),
(497298, 'Jekyll', 'Crime, Horror, Sci-Fi', '334 min', 0, '', 'Brilliant scientist Tom Jackman shares his body with a wicked alter ego while an ancient organization monitors their conflict. Tom uses technology to watch over his sinister half and keep his family safe, as a centuries-old plan u...', 0, 'https://m.media-amazon.com/images/M/MV5BMTUzMjkzNDY0MF5BMl5BanBnXkFtZTcwNDQyMzA1MQ@@._V1_SX300.jpg'),
(756509, 'Kyle XY', 'Drama, Mystery, Romance', '60 min', 0, '', 'A family takes in a formerly institutionalized teen savant who is missing standard human behaviors such as anger, joy, and love.', 0, 'https://m.media-amazon.com/images/M/MV5BZThhMTg3YmMtYWZhMS00MGQ1LWJjZDctMDhmYWQxOTkxZjRhXkEyXkFqcGc@._V1_SX300.jpg'),
(758790, 'The Tudors', 'Drama, History, Romance', '60 min', 0, '', 'Epic series reveals the scandalous life of a young king whose affairs and obsession with producing a male heir changed marriage, the church, and the world.', 0, 'https://m.media-amazon.com/images/M/MV5BYzQ4ZDhmZDEtNDA5YS00NzJlLWE3YjgtODEzZmQ2ZTFlMTYwXkEyXkFqcGc@._V1_SX300.jpg'),
(772139, 'Masters of Science Fiction', 'Drama, Fantasy, Horror', '42 min', 0, '', '\"Masters of Science Fiction\" was a 2007 hosted science fiction anthology series, hosted by Stephen Hawking.', 0, 'https://m.media-amazon.com/images/M/MV5BNmE4NjgyYjUtNzhmMS00NDQyLWE5YWEtOWVkMzliMGI1OTU0XkEyXkFqcGc@._V1_SX300.jpg'),
(796264, 'Eureka', 'Adventure, Comedy, Drama', '60 min', 0, '', 'A U.S. Marshal becomes the sheriff of Eureka, a remote, cozy little Northwestern town where the best minds in the US have secretly been tucked away to build futuristic inventions for the government which often go disastrously wrong.', 0, 'https://m.media-amazon.com/images/M/MV5BMDNlZjFhYWUtYTM0My00ZjQ1LWJhYzktYzM4ZWQ5Yzk3NjEyXkEyXkFqcGc@._V1_SX300.jpg'),
(799862, 'Caprica', 'Action, Drama, Sci-Fi', '60 min', 0, '', 'Two families, the Graystones and the Adamas, live together on a peaceful planet known as Caprica, where a startling breakthrough in artificial intelligence brings about unforeseen consequences.', 0, 'https://m.media-amazon.com/images/M/MV5BNTA2NGZiOGUtNDI2My00NjAxLWFjZDItNzNhYTJmNmY4MjhiXkEyXkFqcGc@._V1_SX300.jpg'),
(801426, 'The Nine', 'Crime, Drama', '45 min', 0, '', 'Nine surviving hostages from a spectacular bank hold-up meet regularly. The memories keep haunting them, in flashbacks that slowly reveal the story. Two surviving perpetrators in jail, who are brothers, and the police, including s...', 0, 'https://m.media-amazon.com/images/M/MV5BMjI1NzMzMDUyN15BMl5BanBnXkFtZTgwNDczMDIyNTE@._V1_SX300.jpg'),
(805663, 'Jericho', 'Action, Drama, Mystery', '45 min', 0, '', 'A small town in Kansas is literally left in the dark after seeing a mushroom cloud over nearby Denver, Colorado. The townspeople struggle to find answers about the blast and solutions on how to survive.', 0, 'https://m.media-amazon.com/images/M/MV5BMWU3ZTg3OWQtZWIwNi00ZGI3LWFmYzQtYWFmOTY1NWNhOWI0XkEyXkFqcGc@._V1_SX300.jpg'),
(805668, 'Traveler', 'Action, Crime, Mystery', '45 min', 0, '', 'Jay and Tyler are hunted by the FBI after the bombing of a museum. Their only lead is their best friend, Will Traveler, who disappeared. What part did he play in this nightmare of violence, death and conspiracies. Who is Will Trav...', 0, 'https://m.media-amazon.com/images/M/MV5BNmFkOTEwNTUtNjIwZS00MjMxLWJlZDItZTA4NjBiZjM0ZTZkXkEyXkFqcGc@._V1_SX300.jpg'),
(805669, 'Ugly Betty', 'Comedy, Drama, Romance', '1 min', 0, '', 'Smart but wholesome Betty embraces her unique appearance and independent attitude in the cutthroat world of New York fashion.', 0, 'https://m.media-amazon.com/images/M/MV5BMTg4ODA2OTg5MF5BMl5BanBnXkFtZTcwNzcyMTQ5Mg@@._V1_SX300.jpg'),
(813715, 'Heroes', 'Crime, Drama, Fantasy', '45 min', 0, '', 'Common people discover that they have super powers. Their lives intertwine as a devastating event must be prevented.', 0, 'https://m.media-amazon.com/images/M/MV5BMjI3ODU0OTQ1MV5BMl5BanBnXkFtZTgwNzI0MTQ2MzE@._V1_SX300.jpg'),
(814164, 'John from Cincinnati', 'Drama, Fantasy, Mystery', '55 min', 0, '', 'In Imperial Beach, California, the dysfunctional Yost family intersects with two new arrivals to the community: a dim-but-wealthy surfing enthusiast, and a man spurned by the Yosts years ago.', 0, 'https://m.media-amazon.com/images/M/MV5BMTMyNTM2MDYyMF5BMl5BanBnXkFtZTcwOTg4NDA1MQ@@._V1_SX300.jpg'),
(830361, 'The Lost Room', 'Action, Fantasy, Mystery', '51S min', 0, '', 'A detective investigates a mysterious motel room which acts as a portal to anywhere in the world.', 0, 'https://m.media-amazon.com/images/M/MV5BYmU3YzhkY2MtMmM1Yy00Zjg0LWJhZTgtODM2MWVlYTM0YzljXkEyXkFqcGc@._V1_SX300.jpg'),
(835434, 'In Treatment', 'Drama', '25 min', 0, '', 'A psychotherapist questions his abilities and gets help by reuniting with his old therapist, whom he has not seen for ten years.', 0, 'https://m.media-amazon.com/images/M/MV5BNjM4NzMzMDI1NF5BMl5BanBnXkFtZTcwOTE2MTMwNA@@._V1_SX300.jpg'),
(840196, 'Skins', 'Drama', '1 min', 0, '', 'The story of a group of British teens who are trying to grow up and find love and happiness despite questionable parenting and teachers who would rather be friends (and lovers) than authority figures.', 0, 'https://m.media-amazon.com/images/M/MV5BNTBhMjc1ZmMtZDgxMi00ZjdhLWE1ZTktYWQ5YTI0MzE2MTFmXkEyXkFqcGc@._V1_SX300.jpg'),
(844441, 'True Blood', 'Drama, Fantasy, Mystery', '55 min', 0, '', 'Telepathic waitress Sookie Stackhouse encounters a strange new supernatural world when she meets the mysterious Bill Compton, a southern Louisiana gentleman and vampire.', 0, 'https://m.media-amazon.com/images/M/MV5BZGViZTA1ODktNmMyYy00YjBmLWFkMjgtMTYxNjgzMjEyODlkXkEyXkFqcGc@._V1_SX300.jpg'),
(851851, 'Terminator: The Sarah Connor Chronicles', 'Action, Drama, Fantasy', '31S min', 0, '', 'Set after the events in Terminator 2: Judgment Day (1991), Sarah Connor and her son, John, try to stay under-the-radar from the government, as they plot to destroy the computer network, Skynet, in hopes of preventing Armageddon.', 0, 'https://m.media-amazon.com/images/M/MV5BMjMwYTA0YWItNmFhOS00OGE1LTkzODMtMjU2NjRjNWE5YmFlXkEyXkFqcGc@._V1_SX300.jpg'),
(862593, 'The Kill Point', 'Action, Crime, Drama', '33S min', 0, '', 'A group of military veterans, who recently returned home from serving in Iraq, band together to pull off a major bank heist.', 0, 'https://m.media-amazon.com/images/M/MV5BMWMyNzdiMDItNjk3OC00NTc5LThjZjAtNTBmM2RlZmFmZTRlXkEyXkFqcGc@._V1_SX300.jpg'),
(863046, 'Flight of the Conchords', 'Comedy, Music, Musical', '33S min', 0, '', 'Bret and Jemaine are Flight of the Conchords, a folk-rock band from New Zealand living in New York City in search of stardom.', 0, 'https://m.media-amazon.com/images/M/MV5BYjQzYTdhNjYtN2IzOC00YzBiLTg5NDQtYzU4OTdmYzUxMjIxXkEyXkFqcGc@._V1_SX300.jpg'),
(866432, 'Painkiller Jane', 'Action, Sci-Fi', '44 min', 0, '', 'Jane Vasco is a DEA agent recruited by a covert government agency that hunts genetically enhanced individuals. She discovers that she can heal rapidly from any injury and begins to investigate the source of her powers.', 0, 'https://m.media-amazon.com/images/M/MV5BMTc5MjIwNzIyNV5BMl5BanBnXkFtZTYwMjQwNTc2._V1_SX300.jpg'),
(880557, 'Bionic Woman', 'Action, Sci-Fi, Thriller', '60 min', 0, '', 'A reimagining of the popular 1970s TV series about a female athlete who is given bionic strength.', 0, 'https://m.media-amazon.com/images/M/MV5BMzE3Njc4MDYtMzA3NC00OGRmLTkzZDgtZGIxMTAyMjUzYzJhXkEyXkFqcGc@._V1_SX300.jpg'),
(898266, 'The Big Bang Theory', 'Comedy, Romance', '22 min', 0, '', 'Aspiring film actress Penny moves into a Pasadena apartment across the hall from brilliant, but socially awkward, physicists Sheldon Cooper and Leonard Hofstadter and shows them how little they know about life outside of the lab.', 0, 'https://m.media-amazon.com/images/M/MV5BZjgzY2QyNzItNDhhYi00ZWIwLWFjN2UtZDJkN2MxYWNjMmJjXkEyXkFqcGc@._V1_SX300.jpg'),
(898332, 'Samantha Who?', 'Comedy, Mystery, Romance', '22 min', 0, '', 'A woman suffers from amnesia and is forced to find out who she really is.', 0, 'https://m.media-amazon.com/images/M/MV5BMTI4NTIxOTgyOV5BMl5BanBnXkFtZTcwMzI0MTU1MQ@@._V1_SX300.jpg'),
(904208, 'Californication', 'Comedy, Drama', '28 min', 5, '', 'A writer tries to juggle his career, his relationship with his daughter and his ex-girlfriend, as well as his appetite for beautiful women.', 0, 'https://m.media-amazon.com/images/M/MV5BMjAyMDM2ODExNF5BMl5BanBnXkFtZTgwNTI2MjkzMTE@._V1_SX300.jpg'),
(925266, 'Pushing Daisies', 'Comedy, Drama, Fantasy', 'N/A', 0, '', 'A pastry chef with the power to bring dead people back to life solves murder mysteries with his resurrected childhood sweetheart, a cynical private investigator, and a lovesick waitress.', 0, 'https://m.media-amazon.com/images/M/MV5BMTY3ODYxNjU1Nl5BMl5BanBnXkFtZTcwMTI0MTU1MQ@@._V1_SX300.jpg'),
(928173, 'Swingtown', 'Drama', 'N/A', 0, '', 'As America celebrates its 200th birthday, two generations of friends and neighbors in a Chicago suburb explore new freedoms and seek connections with each other in the midst of the socio/sexual revolution.', 0, 'https://m.media-amazon.com/images/M/MV5BNTIxY2NmYjctNzZjYi00NjhjLWFhMmMtY2E5MjQzNWMzZjEwXkEyXkFqcGc@._V1_SX300.jpg'),
(934814, 'Chuck', 'Action, Comedy, Drama', '1 min', 0, '', 'When a computer geek inadvertently downloads critical government secrets into his brain, both the CIA and the NSA assign an agent to protect him and exploit his newfound skills.', 0, 'https://m.media-amazon.com/images/M/MV5BMTM0ODIwNjI3NF5BMl5BanBnXkFtZTcwODU2ODUzMw@@._V1_SX300.jpg'),
(955322, 'Reaper', 'Adventure, Comedy, Drama', '4 min', 0, '', 'On his 21st birthday, Sam discovers his parents sold his soul to the devil before birth and he must now be a bounty hunter for the devil until he dies.', 0, 'https://m.media-amazon.com/images/M/MV5BNDYzMDM1NDkwOF5BMl5BanBnXkFtZTcwMDAyMDU1MQ@@._V1_SX300.jpg'),
(1103987, 'Leverage', 'Crime, Mystery, Thriller', '42 min', 0, '', 'Nathan Ford and his five-member team of thieves and hackers come together like modern-day Robin Hoods in an attempt to steal from rich and powerful individuals who take advantage of others.', 0, 'https://m.media-amazon.com/images/M/MV5BODBmMzFjM2EtYWE0OC00YWNiLWExN2MtZmViMzM1ZDk5ZGZjXkEyXkFqcGc@._V1_SX300.jpg'),
(1112285, 'Fear Itself', 'Horror', '2 min', 0, '', 'A television series broken down into 13 separate 60-minute films from premiere horror writers and directors.', 0, 'https://m.media-amazon.com/images/M/MV5BZTQxNTYwOGYtYTM3Ny00ZGE3LWI5OTMtNjllYzllM2RkOTUzXkEyXkFqcGc@._V1_SX300.jpg'),
(1118697, 'Eleventh Hour', 'Crime, Drama, Mystery', '45 min', 0, '', 'A government scientist and his tough, attractive FBI handler try to save people from deadly scientific experiments, poisoners, rare diseases, and environmental hazards.', 0, 'https://m.media-amazon.com/images/M/MV5BMTY3OTEzODA1OV5BMl5BanBnXkFtZTcwODQwOTIxMw@@._V1_SX300.jpg'),
(1119644, 'Fringe', 'Drama, Mystery, Sci-Fi', '2 min', 0, '', 'An F.B.I. agent is forced to work with an institutionalized scientist and his son in order to rationalize a brewing storm of unexplained phenomena.', 0, 'https://m.media-amazon.com/images/M/MV5BMWVlMmE1MmEtNjhjMC00MDdmLWIzZGMtNjc1YTZmNDc2MWExXkEyXkFqcGc@._V1_SX300.jpg'),
(1124373, 'Sons of Anarchy', 'Crime, Drama, Thriller', '45 min', 0, '', 'A biker struggles to balance being a father and being involved in an outlaw motorcycle club.', 0, 'https://m.media-amazon.com/images/M/MV5BZWNiZjFiNGEtNGZmMS00YTBlLWJlNmQtZTA2NzEzZWE4ZGQyXkEyXkFqcGc@._V1_SX300.jpg'),
(1135300, 'Dollhouse', 'Drama, Mystery, Sci-Fi', '42S min', 0, '', 'A top secret organization erases the identities of attractive young people, turning them into blank \"dolls\" ready for imprints of temporary identities they need to fulfill assignments for clients.', 0, 'https://m.media-amazon.com/images/M/MV5BNDY1ODU5MDQ0M15BMl5BanBnXkFtZTcwMTM2MTA4Mg@@._V1_SX300.jpg'),
(1186356, 'Whitechapel', 'Crime, Mystery, Thriller', '180 min', 0, '', 'A fast-tracked inspector, a hardened detective sergeant, and an expert in historical homicides investigate modern crimes with connections to the past in the Whitechapel district of London.', 0, 'https://m.media-amazon.com/images/M/MV5BODM3OTc2YzgtNDViZS00ZGM0LTk4NjMtZjM1MjQyZDU0Mjk1XkEyXkFqcGc@._V1_SX300.jpg'),
(1196946, 'The Mentalist', 'Crime, Drama, Mystery', '43 min', 0, '', 'A famous \"psychic\" outs himself as a fake, and starts working as a consultant for the California Bureau of Investigation so he can find \"Red John\", the madman who killed his wife and daughter.', 0, 'https://m.media-amazon.com/images/M/MV5BMTQ5OTgzOTczM15BMl5BanBnXkFtZTcwMDM2OTY4MQ@@._V1_SX300.jpg'),
(1199099, 'Merlin', 'Adventure, Drama, Fantasy', '45 min', 0, '', 'These are the brand new adventures of Merlin, the legendary sorcerer as a young man, when he was just a servant to young Prince Arthur on the royal court of Camelot, who has soon become his best friend, and turned Arthur into a gr...', 0, 'https://m.media-amazon.com/images/M/MV5BNmI5NDgyZmQtNDc3YS00Mjg0LThmMzEtZjcyNzczOTJlYWY4XkEyXkFqcGc@._V1_SX300.jpg'),
(1225901, '90210', 'Comedy, Drama, Romance', '2 min', 0, '', 'A Kansas family relocates to Beverly Hills, where their two children adapt to the infamous social drama of West Beverly Hills High.', 0, 'https://m.media-amazon.com/images/M/MV5BMTMxNzE4OTE2OV5BMl5BanBnXkFtZTcwNDQxMTY4MQ@@._V1_SX300.jpg'),
(1229401, 'Gary Unmarried', 'Comedy', '30 min', 0, '', 'Newly divorced after fifteen years of marriage, Gary Brooks, a painting contractor, strives to balance work, shared custody of his two children, a controlling ex-wife, and his foxy new girlfriend.', 0, 'https://m.media-amazon.com/images/M/MV5BMTczNDY4NjYxNl5BMl5BanBnXkFtZTcwODI2OTY4MQ@@._V1_SX300.jpg'),
(1235547, 'Better Off Ted', 'Comedy, Sci-Fi', '31S min', 0, '', 'In an amoral science-based company, a manager tries to keep control of his scientists while being pressured by his shrewd boss.', 0, 'https://m.media-amazon.com/images/M/MV5BMTI3NDgzMTU2Nl5BMl5BanBnXkFtZTcwOTUzMzA1Mg@@._V1_SX300.jpg'),
(1286039, 'Stargate Universe', 'Drama, Sci-Fi', '43 min', 0, '', 'Trapped on an Ancient spaceship billions of light-years from home, a group of soldiers and civilians struggle to survive and find their way back to Earth.', 0, 'https://m.media-amazon.com/images/M/MV5BOTEzNTY5NDY5M15BMl5BanBnXkFtZTcwMTY4MDQ3Mg@@._V1_SX300.jpg'),
(1307824, 'V', 'Drama, Sci-Fi, Thriller', '42 min', 0, '', 'An extraterrestrial race arrives on Earth with seemingly good intentions, only to slowly reveal their true machinations the more ingrained into society they become.', 0, 'https://m.media-amazon.com/images/M/MV5BMTYxNTQ5NTg2Ml5BMl5BanBnXkFtZTcwODUyNTY5Mg@@._V1_SX300.jpg'),
(1378167, 'NCIS: Los Angeles', 'Action, Crime, Drama', '43 min', 0, '', 'Follows the undercover agents assigned to the Office of Special Projects (OSP), a special branch of the Naval Criminal Investigative Service (NCIS) that investigate terrorism and National Security threats.', 0, 'https://m.media-amazon.com/images/M/MV5BZmEyMmQ1ZDItODMyNC00MjMzLWIyYjQtNThhOGJiNmY1OGEwXkEyXkFqcGc@._V1_SX300.jpg'),
(1405406, 'The Vampire Diaries', 'Drama, Fantasy, Horror', '43 min', 0, '', 'The lives, loves, dangers and disasters in the town, Mystic Falls, Virginia. Creatures of unspeakable horror lurk beneath this town as a teenage girl is suddenly torn between two vampire brothers.', 0, 'https://m.media-amazon.com/images/M/MV5BMmNjOWQzYmYtNGYxOS00MjVkLTg1MWUtMTkzMGE0MDgwNzQ5XkEyXkFqcGc@._V1_SX300.jpg'),
(1439629, 'Community', 'Comedy', '22 min', 0, '', 'A suspended lawyer is forced to enroll in a community college with an eccentric staff and student body.', 0, 'https://m.media-amazon.com/images/M/MV5BOGIwYzNmYTktZWExZC00MzAyLTk4NTItODgwZmIyNWZhNDEyXkEyXkFqcGc@._V1_SX300.jpg'),
(1441135, 'Flashforward', 'Drama, Mystery, Sci-Fi', '42 min', 0, '', 'A special task force in the FBI investigates after every person on Earth simultaneously blacks out and awakens with a short vision of their future.', 0, 'https://m.media-amazon.com/images/M/MV5BMTgwY2NhOGYtZGFlNS00NGJkLWJjNGEtYzE3MGIyYTJlMzU1XkEyXkFqcGc@._V1_SX300.jpg'),
(1906419, 'Madmen', 'Action, Comedy', '85 min', 0, '', 'A comedy about two young guys who escape from psychiatric hospital.', 0, 'N/A'),
(4237468, 'Stargate SG1: A Classic Moment', 'Short', '1 min', 0, '', 'N/A', 0, 'N/A'),
(4975722, 'Moonlight', 'Drama', '111 min', 0, '', 'A young African-American man grapples with his identity and sexuality while experiencing the everyday struggles of childhood, adolescence, and burgeoning adulthood.', 0, 'https://m.media-amazon.com/images/M/MV5BNzQxNTIyODAxMV5BMl5BanBnXkFtZTgwNzQyMDA3OTE@._V1_SX300.jpg'),
(5442430, 'Life', 'Horror, Sci-Fi, Thriller', '104 min', 0, '', 'A team of scientists aboard the International Space Station discover a rapidly evolving life form that caused extinction on Mars and now threatens all life on Earth.', 0, 'https://m.media-amazon.com/images/M/MV5BNWNkYWYzNGUtOWVjNS00MGY0LWIyY2YtODllNGIxOGRlOTgyXkEyXkFqcGc@._V1_SX300.jpg'),
(8020560, 'The Nip Tuck Trip', 'Documentary', '46 min', 0, '', 'N/A', 0, 'https://m.media-amazon.com/images/M/MV5BYzZiYmQ0OGMtNWI0My00MThlLTlhZWYtYjVlYjU4YmUwZWJmXkEyXkFqcGc@._V1_SX300.jpg'),
(8196148, 'Bloodties', 'Short, Crime', '5 min', 0, '', 'Anthony has a decision he must make. After he decides, everything unravels around him.', 0, 'N/A'),
(10817348, 'Cupid', 'Horror', '83 min', 0, '', 'After being horrendously embarrassed by the mean girls at school, Faye, a practicing witch, summons the evil Cupid to take revenge on all those who wronged her.', 0, 'https://m.media-amazon.com/images/M/MV5BMzUyMTI5MTctYmY1MC00YTM5LTllOWYtOWRjZWY3YzY0NGY3XkEyXkFqcGc@._V1_SX300.jpg'),
(15907000, 'Selling the OC', 'Reality-TV', '1 min', 0, '', 'Jason Oppenheim, owner of the Oppenheim Group, expands the company opening a second office in Newport Beach.', 0, 'https://m.media-amazon.com/images/M/MV5BMDY5MWE1ZWYtZGM3Yi00NDg2LWFiZDktYTQ2NGY3MDFkNzU5XkEyXkFqcGc@._V1_SX300.jpg'),
(27171077, 'Robinhood', 'N/A', 'N/A', 0, '', 'N/A', 0, 'https://m.media-amazon.com/images/M/MV5BODU3YmNhNjEtMTZiNi00OGQ1LWE2YjItNjU2ZjFhYjNmODVlXkEyXkFqcGdeQXVyMTQ3Mzk2MDg4._V1_SX300.jpg'),
(28856655, 'X Files', 'Horror, Sci-Fi', 'N/A', 0, '', 'In the world there are thousands of mysteries still unsolved, the problem is when these mysteries become our greatest fears of our life. These stories awaken our worst nightmares.', 0, 'https://m.media-amazon.com/images/M/MV5BYmNlY2FmY2UtODZjYS00NjU4LTkzOGYtZmI0NTlkNGYzYWZiXkEyXkFqcGdeQXVyMTAzOTA4NjM@._V1_SX300.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `active` tinyint(1) DEFAULT 1,
  `token` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id_user`, `mail`, `password`, `active`, `token`) VALUES
(1, 'theo.pellefigue@gmail.com', '$2y$10$NsJ1NipDmuofw3cdoPh/ouq3tRqqvU92/zWU0Gl2uNxUy3aYxV5x2', 1, ''),
(16, 'jeanlouis.lamare@gmail.com', '$2y$10$azPmCSramejW6adhJJoP/ewNID5cRqbX/.HRZSdMAuVGz6Jj6fHP.', 1, '409b10d98ccebee1d96d450268fc53c02e94da32a74a2f419f66b7e494ee10ac9e1e6459769038421f285be9f69991ddac66'),
(17, 'test@test.test', '$2y$10$FXmrKOQWjKWkgU7lxhtxY.cYr0x0/lyMjZx62iXISb/Vd8RD6V7b2', 1, '10701d51a5a4ad6852932c74e0e2ff5ec01d274735f737ca2fa1c0764615772266023fdc8635c1bfcaa628172efd5cf095c4'),
(18, 'jas.bessier@gmail.com', '$2y$10$koE6MsRDanJMDmlsYZhteekCZ2VXt0Nsuz4BZN1A20S1YimhnlFvK', 1, 'd8be18963a4eabf866efdce07380eb2814814942e4fad3805eca1e84706b370f8c79af964a4fbf501fa8e11f9555b97dfd0c');

-- --------------------------------------------------------

--
-- Structure de la table `user_movie`
--

CREATE TABLE `user_movie` (
  `id_user` int(11) NOT NULL,
  `id_movie` int(11) NOT NULL,
  `is_started` tinyint(1) NOT NULL DEFAULT 0,
  `is_finished` tinyint(1) NOT NULL DEFAULT 0,
  `in_list` tinyint(1) NOT NULL DEFAULT 0,
  `time_code` int(11) NOT NULL DEFAULT 0,
  `duration` int(11) NOT NULL DEFAULT 0,
  `watch_date` datetime NOT NULL DEFAULT current_timestamp(),
  `vote` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `user_movie`
--

INSERT INTO `user_movie` (`id_user`, `id_movie`, `is_started`, `is_finished`, `in_list`, `time_code`, `duration`, `watch_date`, `vote`) VALUES
(18, 83437, 1, 0, 0, 10000, 5, '2025-01-26 21:45:40', 0),
(18, 89013, 0, 0, 0, 0, 0, '2025-01-26 12:30:02', 0),
(18, 103491, 0, 0, 0, 0, 0, '2025-01-26 12:30:17', 0),
(18, 108778, 0, 0, 1, 0, 0, '2025-01-26 12:30:07', 0),
(18, 115320, 0, 0, 0, 0, 0, '2025-01-26 21:47:37', 0),
(18, 118276, 0, 0, 0, 0, 0, '2025-01-26 12:28:47', 0),
(18, 118421, 0, 0, 0, 0, 0, '2025-01-26 21:46:57', 0),
(18, 120611, 0, 0, 0, 0, 0, '2025-01-26 21:48:36', 0),
(18, 364817, 0, 0, 0, 0, 0, '2025-01-26 12:28:49', 0),
(18, 364845, 0, 0, 0, 0, 0, '2025-01-26 12:28:52', 0),
(18, 368530, 0, 0, 0, 0, 0, '2025-01-26 12:28:54', 0),
(18, 411008, 0, 0, 0, 0, 0, '2025-01-26 12:23:05', 0),
(18, 455275, 0, 0, 0, 0, 0, '2025-01-26 12:28:56', 0),
(18, 904208, 1, 0, 0, 10000, 5, '2025-01-26 21:45:36', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id_movie`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Index pour la table `user_movie`
--
ALTER TABLE `user_movie`
  ADD PRIMARY KEY (`id_user`,`id_movie`),
  ADD KEY `foreign_key_id_movie` (`id_movie`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `movies`
--
ALTER TABLE `movies`
  MODIFY `id_movie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28856656;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `user_movie`
--
ALTER TABLE `user_movie`
  ADD CONSTRAINT `foreign_key_id_movie` FOREIGN KEY (`id_movie`) REFERENCES `movies` (`id_movie`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign_key_id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

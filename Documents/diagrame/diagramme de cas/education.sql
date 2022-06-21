-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 03 juin 2022 à 01:48
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cv`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `idCategorie` int(11) NOT NULL,
  `nameCategorie` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`idCategorie`, `nameCategorie`) VALUES
(1, 'ghgfhgh'),
(2, 'dfsdfdfd');

-- --------------------------------------------------------

--
-- Structure de la table `contenucours`
--

CREATE TABLE `contenucours` (
  `idContent` int(11) NOT NULL,
  `idCourse` int(11) NOT NULL,
  `title` varchar(254) DEFAULT NULL,
  `description` varchar(254) DEFAULT NULL,
  `duree` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `course`
--

CREATE TABLE `course` (
  `idCourse` int(11) NOT NULL,
  `idProf` int(11) NOT NULL,
  `idCategorie` int(11) NOT NULL,
  `titreCourse` varchar(254) DEFAULT NULL,
  `prix` varchar(254) DEFAULT NULL,
  `string` varchar(254) DEFAULT NULL,
  `dateAjout` datetime DEFAULT NULL,
  `video` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `course`
--

INSERT INTO `course` (`idCourse`, `idProf`, `idCategorie`, `titreCourse`, `prix`, `string`, `dateAjout`, `video`) VALUES
(1, 1, 1, 'dfgfgfg', '232', '21312', '2022-06-29 21:42:30', 'gfhgh');

-- --------------------------------------------------------

--
-- Structure de la table `detailsd_unscription`
--

CREATE TABLE `detailsd_unscription` (
  `idCourse` int(11) NOT NULL,
  `idEtudient` int(11) NOT NULL,
  `dateinscripton` datetime DEFAULT NULL,
  `payment` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `etudient`
--

CREATE TABLE `etudient` (
  `idEtudient` int(11) NOT NULL,
  `nom` varchar(254) DEFAULT NULL,
  `prenom` varchar(254) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `telephone` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `prof`
--

CREATE TABLE `prof` (
  `idProf` int(11) NOT NULL,
  `nom` varchar(254) DEFAULT NULL,
  `prenom` varchar(254) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `motPasse` varchar(254) DEFAULT NULL,
  `telephone` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `prof`
--

INSERT INTO `prof` (`idProf`, `nom`, `prenom`, `email`, `motPasse`, `telephone`) VALUES
(1, 'jghjgh', 'gjhjgh', 'jghjj', 'gjghjhjh', '5225535'),
(2, 'hjbhb', 'fgcfgfgcgc', 'jhhh', 'fhftgh', 'ghgh');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`idCategorie`);

--
-- Index pour la table `contenucours`
--
ALTER TABLE `contenucours`
  ADD PRIMARY KEY (`idContent`),
  ADD KEY `FK_association2` (`idCourse`);

--
-- Index pour la table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`idCourse`),
  ADD KEY `idCategorie` (`idCategorie`),
  ADD KEY `idProf` (`idProf`);

--
-- Index pour la table `detailsd_unscription`
--
ALTER TABLE `detailsd_unscription`
  ADD PRIMARY KEY (`idCourse`,`idEtudient`),
  ADD KEY `idEtudient` (`idEtudient`);

--
-- Index pour la table `etudient`
--
ALTER TABLE `etudient`
  ADD PRIMARY KEY (`idEtudient`);

--
-- Index pour la table `prof`
--
ALTER TABLE `prof`
  ADD PRIMARY KEY (`idProf`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `idCategorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `contenucours`
--
ALTER TABLE `contenucours`
  MODIFY `idContent` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `course`
--
ALTER TABLE `course`
  MODIFY `idCourse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `etudient`
--
ALTER TABLE `etudient`
  MODIFY `idEtudient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `prof`
--
ALTER TABLE `prof`
  MODIFY `idProf` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `contenucours`
--
ALTER TABLE `contenucours`
  ADD CONSTRAINT `FK_association2` FOREIGN KEY (`idCourse`) REFERENCES `course` (`idCourse`);

--
-- Contraintes pour la table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `idCategorie` FOREIGN KEY (`idCategorie`) REFERENCES `categorie` (`idCategorie`),
  ADD CONSTRAINT `idProf` FOREIGN KEY (`idProf`) REFERENCES `prof` (`idProf`);

--
-- Contraintes pour la table `detailsd_unscription`
--
ALTER TABLE `detailsd_unscription`
  ADD CONSTRAINT `idCourse` FOREIGN KEY (`idCourse`) REFERENCES `course` (`idCourse`),
  ADD CONSTRAINT `idEtudient` FOREIGN KEY (`idEtudient`) REFERENCES `etudient` (`idEtudient`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

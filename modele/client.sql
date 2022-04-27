-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Ven 15 Octobre 2021 à 13:41
-- Version du serveur :  5.6.20-log
-- Version de PHP :  5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `client`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
`ID_Client` int(10) NOT NULL,
  `nom` char(20) NOT NULL,
  `pseudo` char(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `MDP` varchar(20) NOT NULL,
  `NomE` varchar(20) NOT NULL,
  `AdresseE` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE IF NOT EXISTS `facture` (
`ID_facture` int(10) NOT NULL,
  `ide` int(10) NOT NULL,
  `idv` int(10) NOT NULL,
  `date_d` int(10) NOT NULL,
  `datef` date NOT NULL,
  `valeur` int(20) NOT NULL,
  `etat` char(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `voiture`
--

CREATE TABLE IF NOT EXISTS `voiture` (
  `ID_Voiture` int(10) NOT NULL,
  `type` int(20) NOT NULL,
  `nb` int(10) NOT NULL,
  `caract` varchar(30) NOT NULL,
  `photo` char(20) NOT NULL,
  `etatl` char(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
 ADD PRIMARY KEY (`ID_Client`);

--
-- Index pour la table `facture`
--
ALTER TABLE `facture`
 ADD PRIMARY KEY (`ID_facture`);

--
-- Index pour la table `voiture`
--
ALTER TABLE `voiture`
 ADD PRIMARY KEY (`ID_Voiture`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
MODIFY `ID_Client` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `facture`
--
ALTER TABLE `facture`
MODIFY `ID_facture` int(10) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

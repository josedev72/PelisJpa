-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 22-07-2024 a las 00:59:24
-- Versión del servidor: 10.10.2-MariaDB
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `webjpa`
--
CREATE DATABASE IF NOT EXISTS `webjpa` DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci;
USE `webjpa`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `director`
--

DROP TABLE IF EXISTS `director`;
CREATE TABLE IF NOT EXISTS `director` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `APELLIDO` varchar(255) DEFAULT NULL,
  `FECHA_NAC` date DEFAULT NULL,
  `NACIONALIDAD` varchar(255) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `director`
--

INSERT INTO `director` VALUES
(1, 'CAMERON', '1970-01-01', 'EEUU', 'JAMES'),
(2, 'Chan', '1960-01-01', 'China', 'Jackie'),
(3, 'Villeneuve', '1967-10-03', 'Canadá', 'Denis'),
(4, 'Mitchel', '1970-10-18', 'EEUU', 'Mike'),
(5, 'Wingard', '1982-12-03', 'EEUU', 'Adam'),
(6, 'Lin', '1971-10-11', 'China', 'Justin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estrellas`
--

DROP TABLE IF EXISTS `estrellas`;
CREATE TABLE IF NOT EXISTS `estrellas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `estrellas`
--

INSERT INTO `estrellas` VALUES
(1, 'UNA'),
(2, 'DOS'),
(3, 'TRES'),
(4, 'CUATRO'),
(5, 'CINCO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

DROP TABLE IF EXISTS `pelicula`;
CREATE TABLE IF NOT EXISTS `pelicula` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ANIO` int(11) DEFAULT NULL,
  `CALIFICACION` int(11) DEFAULT NULL,
  `DESCRIPCION` varchar(255) NOT NULL,
  `GENERO` int(11) DEFAULT NULL,
  `ID_DIRECTOR` int(11) DEFAULT NULL,
  `ID_ESTRELLAS` int(11) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `URLIMAGEN` varchar(100) NOT NULL DEFAULT 'sin_imagen.jpg',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `pelicula`
--

INSERT INTO `pelicula` VALUES
(1, 2000, 8, 'MADE IN ITALIA', 1, 1, 4, 'LA VIDA ES BELA', 'LA VIDA ES BELA.jpg'),
(2, 2000, 7, 'En la película, Dominic Toretto (Diesel) y el agente del FBI Brian O\'Conner (Walker) se ven obligados a trabajar juntos para vengar el asesinato de la amante de Toretto, Letty Ortiz (Rodríguez) y detener al narcotraficante Arturo Braga.', 2, 1, 5, 'Rapidos y Furiosos 4', 'RyF4.jpg'),
(3, 2021, 3, 'En el Año 10191 el desértico planeta Arrakis, feudo de la familia Harkonnen desde hace generaciones, queda en manos de la Casa de los Atreides por orden del emperador. ', 1, 3, 4, 'Dune', 'dune.jpg'),
(4, 2024, 3, 'Po se está preparando para convertirse en el Líder Espiritual del Valle de la Paz, por lo que necesita a alguien que ocupe su lugar como Guerrero Dragón. Po recorrerá con la ayuda de Zhen , una ladrona muy buscada en un pueblo lejano al Valle de la Paz.', 1, 4, 4, 'Kung Fu Panda 4', 'KungFuPanda4.jpg'),
(5, 2021, 3, 'Godzilla y Kong, dos de las fuerzas más poderosas de un planeta habitado por todo tipo de aterradoras criaturas, se enfrentan en un espectacular combate que sacude los cimientos de la humanidad', 1, 5, 4, 'godzilla vs kingkong', 'GodzillaVsKingkong.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APELLIDO` varchar(255) DEFAULT NULL,
  `CONTRASENIA` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `FECHA_NAC` date DEFAULT NULL,
  `NACIONALIDAD` varchar(255) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` VALUES
(1, 'Mento', '123', 'lola@gmail.com', '1970-01-01', 'Mundial', 'Lola');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-03-2021 a las 10:28:41
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `reyes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ninos`
--

CREATE TABLE `ninos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `fechaDeNacimiento` date NOT NULL,
  `bueno` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ninos`
--

INSERT INTO `ninos` (`id`, `nombre`, `apellidos`, `fechaDeNacimiento`, `bueno`) VALUES
(7, 'Alberto', 'Alcántara', '1994-10-13', 0),
(8, 'Beatriz', 'Bueno', '1982-04-18', 1),
(9, 'Carlos', 'Crepo', '1998-12-01', 1),
(10, 'Diana', 'Domínguez', '1987-09-02', 0),
(11, 'Emilio', 'Enamorado', '1996-08-12', 1),
(12, 'Francisca', 'Fernández', '1990-07-28', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ninos_regalos_rey`
--

CREATE TABLE `ninos_regalos_rey` (
  `rey_id` int(11) NOT NULL,
  `regalo_id` int(11) NOT NULL,
  `nino_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ninos_regalos_rey`
--

INSERT INTO `ninos_regalos_rey` (`rey_id`, `regalo_id`, `nino_id`) VALUES
(1, 16, 8),
(1, 18, 8),
(1, 19, 8),
(1, 20, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regalos`
--

CREATE TABLE `regalos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `regalos`
--

INSERT INTO `regalos` (`id`, `nombre`, `precio`) VALUES
(16, 'Aula de ciencia: Robot Mini ERP', '159.95'),
(17, 'Carbón ', '0.00'),
(18, 'Cochecito Classic ', '99.95'),
(19, 'Consola PS4 1 TB', '349.90'),
(20, 'Lego Villa familiar modular', '64.99'),
(21, 'Magia Borrás Clásica 150 trucos con luz', '32.95'),
(22, 'Meccano Excavadora construcción', '30.99'),
(23, 'Nenuco Hace pompas', '29.95'),
(24, 'Peluche delfín rosa ', '34.00'),
(25, 'Pequeordenador ', '22.95'),
(26, 'Robot Coji', '69.95'),
(27, 'Telescopio astronómico terrestre', '72.00'),
(28, 'Twister ', '17.95');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rey`
--

CREATE TABLE `rey` (
  `id` int(10) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rey`
--

INSERT INTO `rey` (`id`, `nombre`) VALUES
(1, 'Melchor'),
(2, 'Gaspar'),
(3, 'Baltasar');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ninos`
--
ALTER TABLE `ninos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ninos_regalos_rey`
--
ALTER TABLE `ninos_regalos_rey`
  ADD KEY `rey_id` (`rey_id`),
  ADD KEY `regalo_id` (`regalo_id`),
  ADD KEY `nino_id` (`nino_id`);

--
-- Indices de la tabla `regalos`
--
ALTER TABLE `regalos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rey`
--
ALTER TABLE `rey`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ninos`
--
ALTER TABLE `ninos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `regalos`
--
ALTER TABLE `regalos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `rey`
--
ALTER TABLE `rey`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ninos_regalos_rey`
--
ALTER TABLE `ninos_regalos_rey`
  ADD CONSTRAINT `ninos_regalos_rey_ibfk_1` FOREIGN KEY (`nino_id`) REFERENCES `ninos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ninos_regalos_rey_ibfk_2` FOREIGN KEY (`rey_id`) REFERENCES `rey` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ninos_regalos_rey_ibfk_3` FOREIGN KEY (`regalo_id`) REFERENCES `regalos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

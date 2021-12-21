-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 21-12-2021 a las 04:31:25
-- Versión del servidor: 8.0.26
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `agencia_turismo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `ID_CLIENTE` int NOT NULL,
  `APELLIDO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CELULAR` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DIRECCION` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DNI` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FECHANACIMIENTO` date DEFAULT NULL,
  `NACIONALIDAD` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NOMBRE` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID_CLIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`ID_CLIENTE`, `APELLIDO`, `CELULAR`, `DIRECCION`, `DNI`, `EMAIL`, `FECHANACIMIENTO`, `NACIONALIDAD`, `NOMBRE`) VALUES
(3, 'Sosa', '2612074967', 'El Challao', '2940107', 'barbarita_so@hotmail.com', '1981-12-28', 'Argentina', 'Barbara'),
(51, 'Corvalan', '2613058478', 'Barrio SOEVA B2', '36560340', 'trinicrvln@hotmail.com', '1999-12-27', 'Argentina', 'Trinidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE IF NOT EXISTS `empleado` (
  `ID_EMPLEADO` int NOT NULL,
  `APELLIDO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CARGO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CELULAR` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DIRECCION` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DNI` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FECHANACIMIENTO` date DEFAULT NULL,
  `NACIONALIDAD` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NOMBRE` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `SUELDO` double DEFAULT NULL,
  `USUARIO_IDUSUARIO` int DEFAULT NULL,
  PRIMARY KEY (`ID_EMPLEADO`),
  KEY `FK_EMPLEADO_USUARIO_IDUSUARIO` (`USUARIO_IDUSUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`ID_EMPLEADO`, `APELLIDO`, `CARGO`, `CELULAR`, `DIRECCION`, `DNI`, `EMAIL`, `FECHANACIMIENTO`, `NACIONALIDAD`, `NOMBRE`, `SUELDO`, `USUARIO_IDUSUARIO`) VALUES
(2, 'Corvalan', 'Jefe Supremo', '2612074967', 'Barrio SOEVA B2', '25782631', 'fer__co@hotmail.com', '1976-12-27', 'Argentina', 'Fernando', 5400, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paqueteturistico`
--

DROP TABLE IF EXISTS `paqueteturistico`;
CREATE TABLE IF NOT EXISTS `paqueteturistico` (
  `CODIGO_PAQUETE` int NOT NULL,
  `COSTO_PAQUETE` double DEFAULT NULL,
  `NOMBRE` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PAQUETE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `paqueteturistico`
--

INSERT INTO `paqueteturistico` (`CODIGO_PAQUETE`, `COSTO_PAQUETE`, `NOMBRE`) VALUES
(11, 445.5, 'Rio Full'),
(12, 355.5, 'Rio Intermedio'),
(13, 202.5, 'Rio Base');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paqueteturistico_servicioturistico`
--

DROP TABLE IF EXISTS `paqueteturistico_servicioturistico`;
CREATE TABLE IF NOT EXISTS `paqueteturistico_servicioturistico` (
  `PaqueteTuristico_CODIGO_PAQUETE` int NOT NULL,
  `listaServicios_CODIGO_SERVICIO` int NOT NULL,
  PRIMARY KEY (`PaqueteTuristico_CODIGO_PAQUETE`,`listaServicios_CODIGO_SERVICIO`),
  KEY `PQTTRSTICOSERVICIOTURISTICOlstSrvcosCODIGOSERVICIO` (`listaServicios_CODIGO_SERVICIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `paqueteturistico_servicioturistico`
--

INSERT INTO `paqueteturistico_servicioturistico` (`PaqueteTuristico_CODIGO_PAQUETE`, `listaServicios_CODIGO_SERVICIO`) VALUES
(11, 4),
(12, 4),
(13, 4),
(11, 5),
(12, 5),
(13, 6),
(11, 7),
(12, 8),
(11, 9),
(12, 9),
(13, 9),
(11, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sequence`
--

DROP TABLE IF EXISTS `sequence`;
CREATE TABLE IF NOT EXISTS `sequence` (
  `SEQ_NAME` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL,
  PRIMARY KEY (`SEQ_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `sequence`
--

INSERT INTO `sequence` (`SEQ_NAME`, `SEQ_COUNT`) VALUES
('SEQ_GEN', '100');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicioturistico`
--

DROP TABLE IF EXISTS `servicioturistico`;
CREATE TABLE IF NOT EXISTS `servicioturistico` (
  `CODIGO_SERVICIO` int NOT NULL,
  `COSTO_SERVICIO` double DEFAULT NULL,
  `DESCRIPCION_BREVE` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DESTINO_SERVICIO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FECHA_SERVICIO` date DEFAULT NULL,
  `NOMBRE` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`CODIGO_SERVICIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `servicioturistico`
--

INSERT INTO `servicioturistico` (`CODIGO_SERVICIO`, `COSTO_SERVICIO`, `DESCRIPCION_BREVE`, `DESTINO_SERVICIO`, `FECHA_SERVICIO`, `NOMBRE`) VALUES
(4, 150, 'EstadÃ­a de 7 dÃ­as en hotel 4 estrellas, desayuno incluido', 'Rio de Janeiro', '2021-12-27', 'Hotel por noche/s'),
(5, 50, 'Alquiler de auto capacidad 5 personas, kilÃ³metros libres, tanque lleno', 'Rio de Janeiro', '2021-12-27', 'Alquiler de auto'),
(6, 50, 'Pasajes de colectivo Ida/Vuelta mÃ¡s traslados EstaciÃ³n Terminal - Hotel', 'Rio de Janeiro', '2021-12-27', 'Pasajes de colectivo'),
(7, 250, 'Pasajes aÃ©reos Ida/Vuelta mÃ¡s traslado Aeropuerto - Hotel', 'Rio de Janeiro', '2021-12-27', 'Pasajes de aviÃ³n'),
(8, 170, 'Pasajes de Tren Ida/Vuelta mÃ¡s traslados EstaciÃ³n Terminal - Hotel', 'Rio de Janeiro', '2021-12-27', 'Pasajes de tren'),
(9, 25, '2 Excursiones a elecciÃ³n segÃºn disponibilidad', 'Rio de Janeiro', '2021-12-27', 'Excursiones'),
(10, 20, 'Entradas para eventos varios segÃºn disponibiliad', 'Rio de Janeiro', '2021-12-27', 'Entradas a Eventos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicioturistico_paqueteturistico`
--

DROP TABLE IF EXISTS `servicioturistico_paqueteturistico`;
CREATE TABLE IF NOT EXISTS `servicioturistico_paqueteturistico` (
  `ServicioTuristico_CODIGO_SERVICIO` int NOT NULL,
  `listaPaquetes_CODIGO_PAQUETE` int NOT NULL,
  PRIMARY KEY (`ServicioTuristico_CODIGO_SERVICIO`,`listaPaquetes_CODIGO_PAQUETE`),
  KEY `SRVCTRISTICOPAQUETETURISTICOlstPqetesCODIGOPAQUETE` (`listaPaquetes_CODIGO_PAQUETE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `servicioturistico_paqueteturistico`
--

INSERT INTO `servicioturistico_paqueteturistico` (`ServicioTuristico_CODIGO_SERVICIO`, `listaPaquetes_CODIGO_PAQUETE`) VALUES
(4, 11),
(5, 11),
(7, 11),
(9, 11),
(10, 11),
(4, 12),
(5, 12),
(8, 12),
(9, 12),
(4, 13),
(6, 13),
(9, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `IDUSUARIO` int NOT NULL,
  `NOMBREUSUARIO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`IDUSUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`IDUSUARIO`, `NOMBREUSUARIO`, `PASSWORD`) VALUES
(1, 'ferco', '1234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

DROP TABLE IF EXISTS `venta`;
CREATE TABLE IF NOT EXISTS `venta` (
  `NUM_VENTA` int NOT NULL,
  `FECHA_VENTA` date DEFAULT NULL,
  `MEDIO_PAGO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `UNCLIENTE_ID_CLIENTE` int DEFAULT NULL,
  `UNEMPLEADO_ID_EMPLEADO` int DEFAULT NULL,
  `UNPAQUETE_CODIGO_PAQUETE` int DEFAULT NULL,
  `UNSERVICIO_CODIGO_SERVICIO` int DEFAULT NULL,
  PRIMARY KEY (`NUM_VENTA`),
  KEY `FK_VENTA_UNPAQUETE_CODIGO_PAQUETE` (`UNPAQUETE_CODIGO_PAQUETE`),
  KEY `FK_VENTA_UNSERVICIO_CODIGO_SERVICIO` (`UNSERVICIO_CODIGO_SERVICIO`),
  KEY `FK_VENTA_UNEMPLEADO_ID_EMPLEADO` (`UNEMPLEADO_ID_EMPLEADO`),
  KEY `FK_VENTA_UNCLIENTE_ID_CLIENTE` (`UNCLIENTE_ID_CLIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `FK_EMPLEADO_USUARIO_IDUSUARIO` FOREIGN KEY (`USUARIO_IDUSUARIO`) REFERENCES `usuario` (`IDUSUARIO`);

--
-- Filtros para la tabla `paqueteturistico_servicioturistico`
--
ALTER TABLE `paqueteturistico_servicioturistico`
  ADD CONSTRAINT `PQTTRSTICOSERVICIOTURISTICOlstSrvcosCODIGOSERVICIO` FOREIGN KEY (`listaServicios_CODIGO_SERVICIO`) REFERENCES `servicioturistico` (`CODIGO_SERVICIO`),
  ADD CONSTRAINT `PQTTRSTICOSERVICIOTURISTICOPqtTrsticoCODIGOPAQUETE` FOREIGN KEY (`PaqueteTuristico_CODIGO_PAQUETE`) REFERENCES `paqueteturistico` (`CODIGO_PAQUETE`);

--
-- Filtros para la tabla `servicioturistico_paqueteturistico`
--
ALTER TABLE `servicioturistico_paqueteturistico`
  ADD CONSTRAINT `SRVCTRISTICOPAQUETETURISTICOlstPqetesCODIGOPAQUETE` FOREIGN KEY (`listaPaquetes_CODIGO_PAQUETE`) REFERENCES `paqueteturistico` (`CODIGO_PAQUETE`),
  ADD CONSTRAINT `SRVCTRSTCOPAQUETETURISTICOSrvcTrstcoCODIGOSERVICIO` FOREIGN KEY (`ServicioTuristico_CODIGO_SERVICIO`) REFERENCES `servicioturistico` (`CODIGO_SERVICIO`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `FK_VENTA_UNCLIENTE_ID_CLIENTE` FOREIGN KEY (`UNCLIENTE_ID_CLIENTE`) REFERENCES `cliente` (`ID_CLIENTE`),
  ADD CONSTRAINT `FK_VENTA_UNEMPLEADO_ID_EMPLEADO` FOREIGN KEY (`UNEMPLEADO_ID_EMPLEADO`) REFERENCES `empleado` (`ID_EMPLEADO`),
  ADD CONSTRAINT `FK_VENTA_UNPAQUETE_CODIGO_PAQUETE` FOREIGN KEY (`UNPAQUETE_CODIGO_PAQUETE`) REFERENCES `paqueteturistico` (`CODIGO_PAQUETE`),
  ADD CONSTRAINT `FK_VENTA_UNSERVICIO_CODIGO_SERVICIO` FOREIGN KEY (`UNSERVICIO_CODIGO_SERVICIO`) REFERENCES `servicioturistico` (`CODIGO_SERVICIO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

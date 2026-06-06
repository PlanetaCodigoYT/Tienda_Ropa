-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-05-2026 a las 19:30:18
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `almacen_ropa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `id` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_ventas`
--

INSERT INTO `detalle_ventas` (`id`, `id_venta`, `id_producto`, `cantidad`, `precio_unitario`) VALUES
(1, 1, 1, 1, 140000.00),
(2, 1, 3, 1, 150000.00),
(3, 1, 4, 1, 165000.00),
(4, 1, 5, 1, 125000.00),
(5, 2, 6, 1, 65000.00),
(6, 2, 7, 1, 75000.00),
(7, 3, 1, 1, 140000.00),
(8, 3, 6, 1, 65000.00),
(9, 3, 10, 1, 195000.00),
(10, 3, 14, 1, 240000.00),
(11, 4, 3, 1, 150000.00),
(12, 4, 7, 1, 75000.00),
(13, 4, 11, 1, 205000.00),
(14, 4, 15, 1, 210000.00),
(15, 5, 13, 1, 265000.00),
(16, 6, 3, 1, 150000.00),
(17, 6, 4, 1, 165000.00),
(18, 7, 5, 1, 125000.00),
(19, 8, 5, 1, 125000.00),
(20, 9, 3, 1, 150000.00),
(21, 10, 5, 1, 125000.00),
(22, 10, 9, 1, 80000.00),
(23, 10, 13, 1, 265000.00),
(24, 10, 17, 1, 210000.00),
(25, 11, 5, 1, 125000.00),
(26, 11, 8, 1, 90000.00),
(27, 11, 11, 1, 205000.00),
(28, 11, 15, 1, 210000.00),
(29, 12, 4, 3, 165000.00),
(30, 13, 1, 1, 140000.00),
(31, 13, 3, 1, 150000.00),
(32, 13, 4, 1, 165000.00),
(33, 13, 5, 1, 125000.00),
(34, 14, 3, 1, 150000.00),
(35, 14, 5, 1, 125000.00),
(36, 15, 4, 1, 165000.00),
(37, 15, 3, 1, 150000.00),
(38, 16, 1, 1, 140000.00),
(39, 16, 3, 1, 150000.00),
(40, 16, 4, 1, 165000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `imagen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `precio`, `stock`, `imagen`) VALUES
(1, 'Jean REF 001', 140000.00, 32, 'jean4.jpg'),
(3, 'Jean REF 002', 150000.00, 7, 'jean1.jpg'),
(4, 'Jean REF 003', 165000.00, 0, 'jean2.jpg'),
(5, 'Jean REF 004', 125000.00, 2, 'jean3.jpg'),
(6, 'Camisa REF 001', 65000.00, 20, 'camisa1.jpg'),
(7, 'Camisa REF 002', 75000.00, 13, 'camisa2.jpg'),
(8, 'Camisa REF 003', 90000.00, 4, 'camisa3.jpg'),
(9, 'Camisa REF 004', 80000.00, 14, 'camisa4.jpg'),
(10, 'Vestido REF 001', 195000.00, 5, 'vestido1.jpg'),
(11, 'Vestido REF 002', 205000.00, 1, 'vestido2.jpg'),
(12, 'Vestido REF 003', 300000.00, 6, 'vestido3.jpg'),
(13, 'Vestido REF 004', 265000.00, 0, 'vestido4.jpg'),
(14, 'Sudadera REF 001', 240000.00, 15, 'sudadera1.jpg'),
(15, 'Sudadera REF 002', 210000.00, 1, 'sudadera2.jpg'),
(16, 'Sudadera REF 001', 210000.00, 5, 'sudadera3.jpg'),
(17, 'Sudadera REF 004', 210000.00, 5, 'sudadera4.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` enum('admin','empleado','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `usuario`, `password`, `rol`) VALUES
(5, 'Juanita Perez', 'VendedoraSN', '$2y$10$AIQml/rB6i8us/rJmEQA1el3K3iY2AImedKK9IIvFwo5iQ5xQjxAm', 'empleado'),
(6, 'Mauricio', 'AdminPC', '$2y$10$GBeBQZ.TxZJNW3Flk9P3.OF5ikrgUaLAQzLjejNus9UKUis5FlKnu', 'admin'),
(7, 'Jhon Doe', 'VendedorJD', '$2y$10$rXv.9wVOLxDxVuPlcSEkNe76GJuTl7WxbUDaG4VV2xt74xJBodpva', 'empleado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `total` decimal(10,2) NOT NULL,
  `id_vendedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `fecha`, `total`, `id_vendedor`) VALUES
(1, '2026-04-30 20:13:10', 580000.00, 5),
(2, '2026-04-30 20:18:22', 140000.00, 5),
(3, '2026-04-30 20:23:10', 640000.00, 5),
(4, '2026-04-30 20:24:22', 640000.00, 5),
(5, '2026-04-30 20:51:21', 265000.00, 5),
(6, '2026-04-30 21:04:00', 315000.00, 5),
(7, '2026-04-30 21:05:18', 125000.00, 5),
(8, '2026-04-30 21:08:01', 125000.00, 5),
(9, '2026-04-30 21:08:18', 150000.00, 5),
(10, '2026-04-30 21:10:06', 680000.00, 5),
(11, '2026-04-30 21:10:56', 630000.00, 5),
(12, '2026-04-30 21:41:02', 495000.00, 5),
(13, '2026-05-01 17:01:27', 580000.00, 5),
(14, '2026-05-01 17:12:08', 275000.00, 5),
(15, '2026-05-01 17:16:11', 315000.00, 5),
(16, '2026-05-01 17:22:30', 455000.00, 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_vendedor` (`id_vendedor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD CONSTRAINT `producto_productos` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `venta_ventas` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `vendedor_usuario` FOREIGN KEY (`id_vendedor`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

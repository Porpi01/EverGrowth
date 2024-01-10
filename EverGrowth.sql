-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: database:3306
-- Tiempo de generación: 08-01-2024 a las 16:47:42
-- Versión del servidor: 8.1.0
-- Versión de PHP: 8.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `EverGrowth`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` bigint NOT NULL,
  `cantidad` int NOT NULL,
  `id_usuario` bigint NOT NULL,
  `id_producto` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id`, `cantidad`, `id_usuario`, `id_producto`) VALUES
(1, 0, 1, 9),
(3, 0, 1, 9),
(4, 0, 1, 9),
(5, 0, 1, 9),
(6, 0, 1, 9),
(7, 0, 1, 9),
(8, 100, 1, 9),
(9, 100, 1, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` bigint NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`) VALUES
(9, 'Carnes'),
(10, 'Repostería'),
(11, 'Legumbres'),
(12, 'Conservas'),
(13, 'Pasta'),
(14, 'Frutas y Verduras'),
(15, 'Lácteos'),
(16, 'Panadería'),
(17, 'Cereales'),
(18, 'Arroz'),
(19, 'Enlatados'),
(20, 'Bebidas'),
(21, 'Pescado y Marisco'),
(22, 'Congelados');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle pedido`
--

CREATE TABLE `detalle pedido` (
  `id` bigint NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` float NOT NULL,
  `id_producto` bigint NOT NULL,
  `id_pedido` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `detalle pedido`
--

INSERT INTO `detalle pedido` (`id`, `cantidad`, `precio_unitario`, `id_producto`, `id_pedido`) VALUES
(1, 8, 2.3, 9, 1),
(2, 12, 0.45, 9, 1),
(3, 12, 0.45, 9, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id` bigint NOT NULL,
  `fecha_pedido` datetime NOT NULL,
  `fecha_entrega` datetime NOT NULL,
  `estado_pedido` tinyint(1) NOT NULL,
  `id_usuario` bigint NOT NULL,
  `id_factura` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id`, `fecha_pedido`, `fecha_entrega`, `estado_pedido`, `id_usuario`, `id_factura`) VALUES
(1, '2024-01-06 17:23:30', '2025-09-17 09:36:40', 0, 1, 0),
(2, '2024-01-06 17:23:30', '2026-05-17 21:05:14', 0, 1, 0),
(3, '2024-01-06 17:23:30', '2024-02-01 01:19:44', 0, 1, 0),
(4, '2024-01-06 17:23:30', '2026-01-31 08:40:22', 0, 1, 0),
(5, '2024-01-06 17:23:30', '2024-04-15 13:15:59', 0, 1, 0),
(6, '2024-01-06 17:23:30', '2024-05-09 15:46:51', 0, 1, 0),
(7, '2024-01-06 17:23:30', '2024-06-02 05:57:52', 0, 1, 0),
(8, '2024-01-06 17:23:30', '2024-09-08 14:04:04', 0, 1, 0),
(9, '2024-01-06 17:23:30', '2026-11-25 07:34:45', 0, 1, 0),
(10, '2024-01-06 17:23:30', '2026-11-25 04:17:31', 0, 1, 0),
(11, '2024-01-07 10:32:26', '2024-12-04 13:55:21', 0, 1, 0),
(12, '2024-01-07 10:32:26', '2025-06-21 21:52:59', 0, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` bigint NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `precio` float NOT NULL,
  `stock` int NOT NULL,
  `imagen` varchar(2048) NOT NULL,
  `id_categoria` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `precio`, `stock`, `imagen`, `id_categoria`) VALUES
(9, 'Aceitunas rellenas de anchoa', 28.0258, 23, 'aaaa', 12),
(10, 'Arroz redondo', 37.0245, 80, 'aaaa', 18),
(11, 'Coca cola', 71.24, 22, 'aaaa', 20),
(12, 'Chocolate puro Valor con almendras enteras', 43.6057, 89, 'aaaa', 10),
(13, 'Arroz basmati aromático', 57.1976, 86, 'aaaa', 18),
(14, 'Arroz integral redondo', 19.3914, 82, 'aaaa', 18),
(15, 'Aceitunas rellenas de anchoa', 48.2056, 56, 'aaaa', 12),
(16, 'Chocolate puro Valor con almendras enteras', 30.9327, 90, 'aaaa', 10),
(17, 'Aceitunas picadedos', 52.7501, 27, 'aaaa', 12),
(18, 'Aquarius', 51.5102, 13, 'aaaa', 20),
(19, 'Garbanzo cocido', 81.6395, 84, 'aaaa', 11),
(20, 'Tónica', 81.8108, 11, 'aaaa', 20),
(21, 'Macarrón fino', 72.274, 13, 'aaaa', 13),
(22, 'Fanta de naranja', 28.0282, 5, 'aaaa', 20),
(23, 'Chocolate negro 72% de cacao', 81.9515, 90, 'aaaa', 10),
(24, 'Fanta de naranja', 33.9994, 40, 'aaaa', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` bigint NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `apellido1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `apellido2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(512) NOT NULL,
  `rol` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellido1`, `apellido2`, `email`, `direccion`, `username`, `password`, `rol`) VALUES
(1, 'Santiago', 'Blanco', 'Sánchez', 'sanblabl0@gmail.com', 'Calle de la Paz,Albacete,02001', 'sanlaa0', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(2, 'Mateo', 'González', 'Castillo', 'matgongo1@gmail.com', 'Calle de la Princesa,Valencia,46001', 'matona1', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(3, 'Julián', 'Díaz', 'Suárez', 'juldíadí2@gmail.com', 'Paseo de la Independencia,Valladolid,47001', 'juliau2', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(4, 'Mateo', 'Ramos', 'Delgado', 'matramra3@gmail.com', 'Avenida Gran Vía de Colón,Lugo,27001', 'matame3', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(5, 'Gabriela', 'Castillo', 'Molina', 'gabcasca4@gmail.com', 'Calle de la Paz,Alicante,03001', 'gabaso4', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(6, 'María', 'Rodríguez', 'Suárez', 'marrodro5@gmail.com', 'Calle de la Princesa,Granada,18001', 'marodu5', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(7, 'Tomás', 'López', 'López', 'tomlópló6@gmail.com', 'Avenida de la Libertad,Castellón,12001', 'tomopo6', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(8, 'Diego', 'Ruiz', 'Castillo', 'dieruiru7@gmail.com', 'Calle de la Princesa,Coruña,15001', 'dieuia7', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(9, 'Javier', 'Suárez', 'Blanco', 'javsuásu8@gmail.com', 'Paseo de la Independencia,Asturias,33001', 'javual8', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(10, 'Catalina', 'Morales', 'Flores', 'catmormo9@gmail.com', 'Paseo de la Independencia,Lleida,25001', 'catorl9', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valoracion`
--

CREATE TABLE `valoracion` (
  `id` bigint NOT NULL,
  `fecha` datetime NOT NULL,
  `mensaje` varchar(2048) NOT NULL,
  `id_usuario` bigint NOT NULL,
  `id_producto` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `valoracion`
--

INSERT INTO `valoracion` (`id`, `fecha`, `mensaje`, `id_usuario`, `id_producto`) VALUES
(2, '2024-01-07 11:25:57', 'Me como un cono ', 1, 9),
(3, '2024-01-07 11:25:57', 'The friend run slowly or the house sleeps quickly. ', 1, 9),
(4, '2024-01-07 11:25:57', 'A sandwich fly. ', 1, 9);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle pedido`
--
ALTER TABLE `detalle pedido`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKbphsp3c2ybpud5hthw7u8t340` (`id_usuario`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `valoracion`
--
ALTER TABLE `valoracion`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `detalle pedido`
--
ALTER TABLE `detalle pedido`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `valoracion`
--
ALTER TABLE `valoracion`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `FKbphsp3c2ybpud5hthw7u8t340` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

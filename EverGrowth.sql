-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: database:3306
-- Tiempo de generación: 03-05-2024 a las 09:40:30
-- Versión del servidor: 8.3.0
-- Versión de PHP: 8.2.14

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
(220, 1, 5, 12),
(221, 1, 5, 14),
(222, 1, 4, 7),
(223, 1, 6, 13),
(224, 1, 4, 8),
(225, 1, 3, 39),
(226, 1, 7, 4),
(227, 1, 1, 30),
(228, 1, 5, 13),
(229, 1, 2, 38);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` bigint NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `imagen` varchar(2048) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`, `imagen`) VALUES
(1, 'Aceites, especias y salsas', 'http://localhost:8085/media/aceite-removebg-preview.png'),
(2, 'Arroz, legumbres y pasta', 'http://localhost:8085/media/legumbres.jpeg'),
(3, 'Aperitivos', 'http://localhost:8085/media/gusanito-rojo-pegui-caja-25-kg.jpg'),
(4, 'Dulces y repostería', 'http://localhost:8085/media/historia_reposteria_francesa-1-removebg-preview.png'),
(5, 'Bebidas alcohólicas', 'http://localhost:8085/media/bebidas.jpg'),
(6, 'Carnes', 'http://localhost:8085/media/carnes.jpg'),
(7, 'Cereales', 'http://localhost:8085/media/cereales.jpg'),
(8, 'Charcutería y quesos', 'http://localhost:8085/media/tabla1-1080x675-removebg-preview.png'),
(9, 'Congelados', 'http://localhost:8085/media/congelados.jpg'),
(10, 'Conservas, caldos y cremas', 'http://localhost:8085/media/vencerol-1-removebg-preview.png'),
(11, 'Frutas y verduras', 'http://localhost:8085/media/frutas%20y%20verduras.jpeg'),
(12, 'Huevos y lácteos', 'http://localhost:8085/media/descarga-removebg-preview.png'),
(13, 'Agua y refrescos', 'http://localhost:8085/media/refrescos-aguas-l-removebg-preview.png'),
(62, 'Bebidas', 'http://localhost:8085/media/default.jpg'),
(63, 'Pescado y Marisco', 'http://localhost:8085/media/default.jpg'),
(64, 'Enlatados', 'http://localhost:8085/media/default.jpg'),
(65, 'Pescado y Marisco', 'http://localhost:8085/media/default.jpg'),
(66, 'Arroz', 'http://localhost:8085/media/default.jpg'),
(67, 'Legumbres', 'http://localhost:8085/media/default.jpg'),
(68, 'Lácteos', 'http://localhost:8085/media/default.jpg'),
(69, 'Congelados', 'http://localhost:8085/media/default.jpg'),
(70, 'Pasta', 'http://localhost:8085/media/default.jpg'),
(71, 'Legumbres', 'http://localhost:8085/media/default.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id` bigint NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` float NOT NULL,
  `id_producto` bigint NOT NULL,
  `id_pedido` bigint NOT NULL,
  `iva` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id`, `cantidad`, `precio_unitario`, `id_producto`, `id_pedido`, `iva`) VALUES
(288, 1, 3.38, 23, 60, 0),
(289, 2, 2.54, 15, 60, 0),
(290, 13, 5.12, 2, 61, 0.24),
(291, 8, 5.12, 2, 62, 0.24),
(292, 8, 5.12, 2, 63, 0.24),
(293, 8, 5.12, 2, 64, 0.24),
(294, 3, 3.22, 1, 65, 0.2),
(295, 1, 5.12, 2, 65, 0.24),
(296, 1, 5.75, 3, 65, 0),
(297, 1, 1.59, 4, 65, 0),
(298, 1, 2.88, 6, 65, 0),
(299, 1, 2.83, 7, 65, 0),
(300, 2, 4.98, 8, 65, 0),
(301, 1, 50, 2, 66, 0.24),
(302, 3, 5.75, 3, 67, 0),
(303, 1, 1.59, 4, 67, 0),
(304, 1, 50, 2, 67, 0.24),
(305, 3, 5.75, 3, 68, 0),
(306, 1, 2.88, 6, 68, 0),
(307, 1, 50, 2, 69, 0.24),
(308, 1, 5.75, 3, 69, 0),
(309, 1, 1.59, 4, 69, 0),
(310, 1, 2.88, 6, 69, 0),
(311, 2, 2.83, 7, 69, 0),
(312, 1, 4.98, 8, 69, 0),
(313, 1, 3.4, 13, 69, 0),
(314, 1, 6.66, 14, 69, 0),
(315, 1, 2.54, 15, 69, 0),
(316, 1, 2.8, 16, 69, 0),
(317, 1, 50, 2, 70, 0.24),
(318, 1, 5.75, 3, 70, 0),
(319, 1, 1.59, 4, 70, 0),
(320, 1, 2.88, 6, 70, 0),
(321, 1, 2.83, 7, 70, 0),
(322, 1, 4.98, 8, 70, 0),
(323, 1, 3.4, 13, 70, 0),
(324, 1, 6.66, 14, 70, 0),
(325, 1, 2.54, 15, 70, 0),
(326, 1, 2.8, 16, 70, 0),
(327, 1, 50, 2, 71, 0.24),
(328, 1, 5.75, 3, 71, 0),
(329, 1, 1.59, 4, 71, 0),
(330, 1, 2.88, 6, 71, 0),
(331, 1, 2.83, 7, 71, 0),
(332, 1, 4.98, 8, 71, 0),
(333, 1, 3.4, 13, 71, 0),
(334, 1, 6.66, 14, 71, 0),
(335, 1, 2.54, 15, 71, 0),
(336, 1, 2.8, 16, 71, 0),
(337, 1, 50, 2, 72, 0.24),
(338, 1, 5.75, 3, 72, 0),
(339, 1, 1.59, 4, 72, 0),
(340, 1, 2.88, 6, 72, 0),
(341, 1, 2.83, 7, 72, 0),
(342, 1, 4.98, 8, 72, 0),
(343, 1, 3.4, 13, 72, 0),
(344, 1, 6.66, 14, 72, 0),
(345, 1, 2.54, 15, 72, 0),
(346, 1, 2.8, 16, 72, 0),
(347, 1, 5.53, 9, 72, 0),
(348, 1, 3.18, 11, 72, 0);

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
(60, '2024-04-27 14:25:39', '2026-03-31 13:59:45', 0, 3, 1),
(61, '2024-04-27 14:28:10', '2024-03-22 09:58:55', 0, 3, 2),
(62, '2024-04-27 14:28:46', '2025-07-13 17:08:17', 0, 3, 3),
(63, '2024-04-27 14:34:53', '2026-07-13 23:14:50', 0, 3, 4),
(64, '2024-04-27 14:36:49', '2025-09-21 19:50:21', 0, 3, 5),
(65, '2024-04-27 14:37:38', '2024-03-31 03:18:44', 0, 3, 6),
(66, '2024-04-27 14:38:59', '2025-12-14 07:22:42', 0, 2, 7),
(67, '2024-04-27 14:41:33', '2026-01-25 01:20:59', 0, 2, 8),
(68, '2024-04-27 14:42:26', '2026-05-24 17:25:48', 0, 2, 9),
(69, '2024-04-28 10:27:00', '2025-03-01 00:22:19', 0, 7, 10),
(70, '2024-04-28 10:57:01', '2024-03-08 17:11:38', 0, 7, 11),
(71, '2024-04-28 11:00:01', '2024-05-28 18:41:49', 0, 7, 12),
(72, '2024-04-28 11:08:53', '2025-12-03 08:20:30', 0, 7, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` bigint NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `precio` float NOT NULL,
  `descripcion` varchar(2048) NOT NULL,
  `stock` int NOT NULL,
  `imagen` varchar(2048) DEFAULT NULL,
  `id_categoria` bigint NOT NULL,
  `iva` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `precio`, `descripcion`, `stock`, `imagen`, `id_categoria`, `iva`) VALUES
(1, 'Naranja', 3.22, 'Nuevo producto creado por el sistema', 0, 'http://localhost:8085/media/24efe4cc90252e5781fc0cf6a46b263f.jpg', 4, 0.2),
(2, 'Plátano', 50, 'Nuevo producto creado por el sistema', 32, 'http://localhost:8085/media/images.jpg', 11, 0.24),
(3, 'Uva', 5.75, 'Nuevo producto creado por el sistema', 13, 'http://localhost:8085/media/bridgerton-302-unit-05870r-6617f4f0c2687.jpg', 11, 0),
(4, 'Melón', 1.59, 'Nuevo producto creado por el sistema', 46, 'http://localhost:8085/media/fc180137f5153af8c9e8982e9aa1d6f4.1500.0.0.0.wmark.386a5e66.jpg', 9, 0),
(5, 'Naranja', 6.28, 'Nuevo producto creado por el sistema', 0, 'http://localhost:8085/media/0849d1bc-bd3e-45f2-a15e-9f61c215c9ea_alta-aspect-ratio_default_0.jpg', 4, 0),
(6, 'Manzana', 2.88, 'Nuevo producto creado por el sistema', 3, 'http://localhost:8085/media/default.jpg', 8, 0),
(7, 'Naranja', 2.83, 'Nuevo producto creado por el sistema', 12, 'http://localhost:8085/media/default.jpg', 2, 0),
(8, 'Manzana', 4.98, 'Nuevo producto creado por el sistema', 68, 'http://localhost:8085/media/default.jpg', 10, 0),
(9, 'Naranja', 5.53, 'Nuevo producto creado por el sistema', 65, 'http://localhost:8085/media/default.jpg', 13, 0),
(10, 'Kiwi', 6.55, 'Nuevo producto creado por el sistema', 58, 'http://localhost:8085/media/default.jpg', 4, 0),
(11, 'Melón', 3.18, 'Nuevo producto creado por el sistema', 66, 'http://localhost:8085/media/default.jpg', 9, 0),
(12, 'Naranja', 3.45, 'Nuevo producto creado por el sistema', 33, 'http://localhost:8085/media/default.jpg', 2, 0),
(13, 'Fresa', 3.4, 'Nuevo producto creado por el sistema', 63, 'http://localhost:8085/media/default.jpg', 2, 0),
(14, 'Kiwi', 6.66, 'Nuevo producto creado por el sistema', 51, 'http://localhost:8085/media/default.jpg', 12, 0),
(15, 'Kiwi', 2.54, 'Nuevo producto creado por el sistema', 72, 'http://localhost:8085/media/default.jpg', 9, 0),
(16, 'Plátano', 2.8, 'Nuevo producto creado por el sistema', 24, 'http://localhost:8085/media/default.jpg', 7, 0),
(17, 'Pera', 1.76, 'Nuevo producto creado por el sistema', 78, 'http://localhost:8085/media/default.jpg', 7, 0),
(18, 'Uva', 2.27, 'Nuevo producto creado por el sistema', 96, 'http://localhost:8085/media/default.jpg', 12, 0),
(19, 'Fresa', 4.34, 'Nuevo producto creado por el sistema', 12, 'http://localhost:8085/media/default.jpg', 6, 0),
(20, 'Uva', 2, 'Nuevo producto creado por el sistema', 15, 'http://localhost:8085/media/default.jpg', 8, 0),
(21, 'Uva', 3.2, 'Nuevo producto creado por el sistema', 55, 'http://localhost:8085/media/default.jpg', 11, 0),
(22, 'Manzana', 5.93, 'Nuevo producto creado por el sistema', 62, 'http://localhost:8085/media/default.jpg', 3, 0),
(23, 'Melón', 3.38, 'Nuevo producto creado por el sistema', 79, 'http://localhost:8085/media/default.jpg', 4, 0),
(24, 'Papaya', 5.37, 'Nuevo producto creado por el sistema', 18, 'http://localhost:8085/media/default.jpg', 7, 0),
(25, 'Melón', 1.82, 'Nuevo producto creado por el sistema', 10, 'http://localhost:8085/media/default.jpg', 1, 0),
(26, 'Fresa', 4.55, 'Nuevo producto creado por el sistema', 23, 'http://localhost:8085/media/default.jpg', 12, 0),
(27, 'Uva', 3.97, 'Nuevo producto creado por el sistema', 25, 'http://localhost:8085/media/default.jpg', 6, 0),
(28, 'Uva', 6.8, 'Nuevo producto creado por el sistema', 25, 'http://localhost:8085/media/default.jpg', 4, 0),
(29, 'Plátano', 2.49, 'Nuevo producto creado por el sistema', 46, 'http://localhost:8085/media/default.jpg', 11, 0),
(30, 'Melón', 4.53, 'Nuevo producto creado por el sistema', 8, 'http://localhost:8085/media/default.jpg', 10, 0),
(31, 'Uva', 2.14, 'Nuevo producto creado por el sistema', 36, 'http://localhost:8085/media/default.jpg', 12, 0),
(32, 'Fresa', 3.71, 'Nuevo producto creado por el sistema', 41, 'http://localhost:8085/media/default.jpg', 8, 0),
(33, 'Melón', 2.46, 'Nuevo producto creado por el sistema', 89, 'http://localhost:8085/media/default.jpg', 11, 0),
(34, 'Sandía', 6.73, 'Nuevo producto creado por el sistema', 70, 'http://localhost:8085/media/default.jpg', 6, 0),
(35, 'Naranja', 4.12, 'Nuevo producto creado por el sistema', 21, 'http://localhost:8085/media/default.jpg', 1, 0),
(36, 'Plátano', 3.63, 'Nuevo producto creado por el sistema', 41, 'http://localhost:8085/media/default.jpg', 7, 0),
(37, 'Pera', 2.83, 'Nuevo producto creado por el sistema', 49, 'http://localhost:8085/media/default.jpg', 9, 0),
(38, 'Papaya', 5.01, 'Nuevo producto creado por el sistema', 5, 'http://localhost:8085/media/default.jpg', 13, 0),
(39, 'Sandía', 4.22, 'Nuevo producto creado por el sistema', 67, 'http://localhost:8085/media/default.jpg', 1, 0),
(40, 'Kiwi', 1.77, 'Nuevo producto creado por el sistema', 44, 'http://localhost:8085/media/default.jpg', 11, 0),
(41, 'Manzana', 5.83, 'Nuevo producto creado por el sistema', 71, 'http://localhost:8085/media/default.jpg', 7, 0),
(42, 'Melón', 2.68, 'Nuevo producto creado por el sistema', 71, 'http://localhost:8085/media/default.jpg', 1, 0),
(43, 'Papaya', 3.51, 'Nuevo producto creado por el sistema', 40, 'http://localhost:8085/media/default.jpg', 6, 0),
(44, 'Naranja', 2.01, 'Nuevo producto creado por el sistema', 42, 'http://localhost:8085/media/default.jpg', 10, 0),
(45, 'Sandía', 3.98, 'Nuevo producto creado por el sistema', 39, 'http://localhost:8085/media/default.jpg', 10, 0),
(46, 'Manzana', 5.04, 'Nuevo producto creado por el sistema', 69, 'http://localhost:8085/media/default.jpg', 8, 0),
(47, 'Uva', 6.06, 'Nuevo producto creado por el sistema', 97, 'http://localhost:8085/media/default.jpg', 12, 0),
(48, 'Papaya', 6.34, 'Nuevo producto creado por el sistema', 43, 'http://localhost:8085/media/default.jpg', 7, 0),
(49, 'Papaya', 3, 'Nuevo producto creado por el sistema', 77, 'http://localhost:8085/media/default.jpg', 5, 0),
(50, 'Melón', 2.05, 'Nuevo producto creado por el sistema', 13, 'http://localhost:8085/media/default.jpg', 2, 0);

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
  `telefono` varchar(10) NOT NULL,
  `direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(512) NOT NULL,
  `rol` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellido1`, `apellido2`, `email`, `telefono`, `direccion`, `username`, `password`, `rol`) VALUES
(1, 'Ana ', 'Pérez', 'Roca', 'anita@gmail.com', '632156987', 'Calle del Cerezo Nº 17', 'anita17', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 0),
(2, 'Monica', 'Alcañiz', 'Puig', 'monica@gmail.com', '642156657', 'Alameda', 'moni01', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(3, 'pepita', 'clarin', NULL, 'lampra@gmail.com', '911911911', 'Santa Justa Klan', 'Porpi01', 'f33f7760404f6a4ef107b443d4c594c5fcf1f1cd20a790beb96863813ae42ca1', 1),
(4, 'María', 'Vazquez', NULL, 'mari@gmail.com', '345543345', 'En la casa de al lado', 'mariBarrio', 'd9da79041c5e680c86e5c3955ac8ca74bb066dcdc86c2a566bfb2dbef04bb915', 1),
(5, 'Fantwasma', 'Fantasma', NULL, 'fanti@gamil.com', '234234234', 'Calle del fantasma', 'fantasmita', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(6, 'Salsa', 'salsita', NULL, 'salsita@gmail.com', '675675675', 'salsa', 'salsita33', '9787606084625294a2a50c0e2c4ae25f4d25deaccb911382b87941dc8d163b8d', 1),
(7, 'Fernando', 'Callejas', 'SAurio', 'fer@gmail.com', '555555555', 'Plaza de la Reina', 'ferdinando', 'bf94713a6b473d19ac3dcac2dc0f5b097509550b7fa44b3d723050d5db30b26a', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valoracion`
--

CREATE TABLE `valoracion` (
  `id` bigint NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `fecha` datetime NOT NULL,
  `mensaje` varchar(2048) NOT NULL,
  `id_usuario` bigint NOT NULL,
  `id_producto` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
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
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=349;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `valoracion`
--
ALTER TABLE `valoracion`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

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

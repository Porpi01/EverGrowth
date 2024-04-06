-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: database:3306
-- Tiempo de generación: 31-03-2024 a las 14:55:13
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
(97, 1, 61, 8),
(98, 1, 4, 4),
(99, 1, 17, 16),
(100, 1, 19, 12),
(101, 1, 24, 19),
(102, 1, 20, 21),
(103, 1, 13, 12),
(104, 1, 22, 12),
(106, 1, 28, 3);

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
(13, 'Agua y refrescos', 'http://localhost:8085/media/refrescos-aguas-l-removebg-preview.png');

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
(107, 8, 2.3, 9, 1, 0.21),
(108, 12, 0.45, 11, 39, 0),
(109, 12, 0.45, 8, 32, 0),
(110, 12, 0.45, 1, 43, 0),
(111, 12, 0.45, 9, 79, 0),
(112, 12, 0.45, 11, 86, 0.5),
(113, 12, 0.45, 5, 34, 0),
(114, 12, 0.45, 6, 15, 0),
(115, 12, 0.45, 1, 40, 0),
(116, 12, 0.45, 3, 4, 0),
(117, 8, 0.03, 2, 1, 0.15),
(118, 12, 0.45, 19, 13, 0),
(119, 12, 0.45, 13, 22, 0),
(120, 12, 0.45, 12, 94, 0),
(121, 12, 0.45, 2, 56, 0),
(122, 12, 0.45, 22, 93, 0),
(123, 12, 0.45, 19, 77, 0),
(124, 12, 0.45, 7, 57, 0),
(125, 12, 0.45, 10, 56, 0),
(126, 12, 0.45, 15, 22, 0),
(127, 12, 0.45, 3, 44, 0),
(128, 1, 2.8, 13, 101, 0),
(129, 3, 12.3, 1, 101, 0.1),
(130, 2, 12.3, 1, 102, 0.1),
(131, 4, 6.14, 3, 102, 0.04),
(132, 3, 4.36, 7, 102, 0),
(133, 2, 8.34, 4, 102, 0.21),
(134, 2, 12.3, 1, 103, 0.1),
(135, 4, 6.14, 3, 103, 0.04),
(136, 1, 8.34, 4, 103, 0.21),
(137, 3, 4.36, 7, 103, 0),
(138, 2, 12.3, 1, 104, 0.1),
(139, 9, 5.52, 5, 105, 0.1),
(140, 10, 5.52, 5, 106, 0.1),
(141, 2, 6.14, 3, 107, 0.04),
(142, 3, 12.3, 1, 107, 0.1);

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
(1, '2024-02-15 19:46:39', '2024-12-07 19:13:04', 0, 15, 0),
(2, '2024-02-15 19:46:39', '2024-02-16 22:00:00', 0, 6, 0),
(3, '2024-02-15 19:46:39', '2025-01-09 04:42:04', 0, 18, 0),
(4, '2024-02-15 19:46:39', '2026-08-04 07:18:42', 0, 25, 0),
(5, '2024-02-15 19:46:39', '2026-02-28 13:17:01', 0, 8, 0),
(6, '2024-02-15 19:46:40', '2025-08-01 18:06:17', 0, 16, 0),
(7, '2024-02-15 19:46:40', '2025-12-22 12:35:22', 0, 46, 0),
(8, '2024-02-15 19:46:40', '2024-08-15 23:57:42', 0, 8, 0),
(9, '2024-02-15 19:46:40', '2026-04-15 14:03:09', 0, 43, 0),
(10, '2024-02-15 19:46:40', '2024-08-12 17:45:07', 0, 22, 0),
(11, '2024-02-15 19:46:40', '2024-09-25 11:35:38', 0, 15, 0),
(12, '2024-02-15 19:46:40', '2025-10-07 08:34:20', 0, 14, 0),
(13, '2024-02-15 19:46:40', '2024-07-25 04:49:29', 0, 17, 0),
(14, '2024-02-15 19:46:40', '2026-03-03 18:09:41', 0, 52, 0),
(15, '2024-02-15 19:46:40', '2026-10-23 15:39:37', 0, 4, 0),
(16, '2024-02-15 19:46:40', '2025-08-24 19:22:49', 0, 12, 0),
(17, '2024-02-15 19:46:40', '2025-03-26 12:33:27', 0, 38, 0),
(18, '2024-02-15 19:46:40', '2025-12-08 20:51:29', 0, 35, 0),
(19, '2024-02-15 19:46:40', '2026-06-16 16:43:47', 0, 45, 0),
(20, '2024-02-15 19:46:40', '2025-06-16 12:31:53', 0, 52, 0),
(21, '2024-02-15 19:46:40', '2024-01-26 08:36:32', 0, 38, 0),
(22, '2024-02-15 19:46:40', '2026-10-22 11:22:49', 0, 29, 0),
(23, '2024-02-15 19:46:40', '2025-02-26 09:51:06', 0, 44, 0),
(24, '2024-02-15 19:46:40', '2025-03-25 09:20:44', 0, 4, 0),
(25, '2024-02-15 19:46:40', '2024-03-26 03:42:50', 0, 22, 0),
(26, '2024-02-15 19:46:40', '2025-04-19 13:07:52', 0, 28, 0),
(27, '2024-02-15 19:46:40', '2025-02-07 18:40:14', 0, 37, 0),
(28, '2024-02-15 19:46:40', '2025-05-02 09:56:39', 0, 26, 0),
(29, '2024-02-15 19:46:40', '2025-10-21 08:40:36', 0, 29, 0),
(30, '2024-02-15 19:46:40', '2024-01-07 04:27:55', 0, 32, 0),
(31, '2024-02-15 19:46:40', '2024-07-20 06:38:36', 0, 12, 0),
(32, '2024-02-15 19:46:40', '2026-02-01 11:14:47', 0, 11, 0),
(33, '2024-02-15 19:46:40', '2025-10-05 05:10:10', 0, 8, 0),
(34, '2024-02-15 19:46:40', '2026-08-06 01:54:32', 0, 17, 0),
(35, '2024-02-15 19:46:40', '2024-03-21 23:30:52', 0, 13, 0),
(36, '2024-02-15 19:46:41', '2024-11-26 22:06:23', 0, 29, 0),
(37, '2024-02-15 19:46:41', '2026-04-10 18:19:12', 0, 15, 0),
(38, '2024-02-15 19:46:41', '2026-12-17 20:45:43', 0, 28, 0),
(39, '2024-02-15 19:46:41', '2026-08-13 11:21:55', 0, 3, 0),
(40, '2024-02-15 19:46:41', '2025-11-21 15:08:38', 0, 9, 0),
(41, '2024-02-15 19:46:41', '2026-03-04 05:34:53', 0, 8, 0),
(42, '2024-02-15 19:46:41', '2024-11-02 11:16:41', 0, 27, 0),
(43, '2024-02-15 19:46:41', '2026-02-28 14:56:29', 0, 2, 0),
(44, '2024-02-15 19:46:41', '2026-03-25 06:01:12', 0, 43, 0),
(45, '2024-02-15 19:46:41', '2025-11-30 15:20:52', 0, 48, 0),
(46, '2024-02-15 19:46:41', '2025-06-06 21:51:27', 0, 47, 0),
(47, '2024-02-15 19:46:41', '2025-01-10 10:16:31', 0, 45, 0),
(48, '2024-02-15 19:46:41', '2024-04-21 01:57:53', 0, 30, 0),
(49, '2024-02-15 19:46:41', '2026-12-22 13:39:03', 0, 22, 0),
(50, '2024-02-15 19:46:41', '2025-01-03 11:19:02', 0, 27, 0),
(51, '2024-02-16 22:00:00', '2024-02-18 22:00:00', 0, 4, 0),
(52, '2024-02-15 20:11:40', '2026-03-22 05:09:09', 0, 2, 0),
(53, '2024-02-21 12:32:42', '2024-07-30 12:46:00', 0, 2, 0),
(54, '2024-02-21 18:11:57', '2026-02-27 13:38:50', 0, 2, 0),
(55, '2024-02-21 18:12:40', '2024-05-27 12:53:57', 0, 2, 0),
(56, '2024-02-21 18:34:44', '2025-05-16 08:06:16', 0, 2, 0),
(57, '2024-02-21 18:42:37', '2026-06-24 02:33:26', 0, 2, 0),
(58, '2024-02-21 18:43:57', '2025-05-13 22:25:28', 0, 2, 0),
(59, '2024-02-23 08:57:07', '2026-04-16 11:36:49', 0, 2, 0),
(60, '2024-02-23 08:35:40', '2024-02-23 08:35:40', 0, 1, 0),
(61, '2024-03-26 14:55:48', '2024-02-16 22:55:24', 0, 2, 0),
(62, '2024-03-26 14:55:49', '2025-07-04 13:18:16', 0, 42, 0),
(63, '2024-03-26 14:55:49', '2024-05-15 19:49:45', 0, 52, 0),
(64, '2024-03-26 14:55:49', '2024-07-06 21:29:01', 0, 34, 0),
(65, '2024-03-26 14:55:49', '2024-05-27 01:46:42', 0, 59, 0),
(66, '2024-03-26 14:55:49', '2024-09-25 22:11:46', 0, 43, 0),
(67, '2024-03-26 14:55:49', '2025-05-07 19:28:32', 0, 32, 0),
(68, '2024-03-26 14:55:49', '2024-06-26 12:44:30', 0, 45, 0),
(69, '2024-03-26 14:55:49', '2026-08-08 05:52:29', 0, 59, 0),
(70, '2024-03-26 14:55:49', '2026-12-10 05:07:22', 0, 15, 0),
(71, '2024-03-26 15:20:17', '2026-11-07 14:17:03', 0, 2, 0),
(72, '2024-03-26 15:22:48', '2026-11-30 01:58:21', 0, 2, 0),
(73, '2024-03-26 16:13:00', '2025-05-29 13:14:53', 0, 2, 0),
(74, '2024-03-26 16:21:50', '2026-11-27 10:12:51', 0, 2, 0),
(75, '2024-03-26 16:37:08', '2025-09-20 17:48:13', 0, 2, 0),
(76, '2024-03-26 16:37:54', '2024-11-30 03:36:46', 0, 2, 0),
(77, '2024-03-26 16:40:02', '2025-03-04 12:21:58', 0, 2, 0),
(78, '2024-03-26 16:40:24', '2026-07-04 02:54:55', 0, 2, 0),
(79, '2024-03-27 08:38:34', '2024-06-06 20:51:28', 0, 2, 0),
(80, '2024-03-27 08:48:21', '2025-06-19 18:38:27', 0, 2, 0),
(81, '2024-03-27 08:54:29', '2024-07-29 09:38:58', 0, 2, 0),
(82, '2024-03-27 09:24:57', '2026-08-31 06:43:41', 0, 2, 0),
(83, '2024-03-27 09:25:50', '2025-09-16 12:03:58', 0, 2, 0),
(84, '2024-03-27 09:30:20', '2024-10-17 11:07:36', 0, 2, 0),
(85, '2024-03-27 09:32:07', '2024-08-20 02:53:46', 0, 2, 0),
(86, '2024-03-27 09:35:32', '2024-06-28 14:35:27', 0, 2, 0),
(87, '2024-03-27 09:35:54', '2026-08-20 17:11:49', 0, 2, 0),
(88, '2024-03-27 09:37:00', '2024-05-21 14:01:01', 0, 2, 0),
(89, '2024-03-27 09:41:05', '2024-08-08 22:04:51', 0, 2, 0),
(90, '2024-03-27 09:45:30', '2026-08-08 07:20:40', 0, 2, 0),
(91, '2024-03-27 10:04:29', '2024-08-21 18:38:19', 0, 2, 0),
(92, '2024-03-27 10:04:56', '2024-07-05 01:40:25', 0, 2, 0),
(93, '2024-03-27 13:21:40', '2024-02-17 10:26:16', 0, 2, 0),
(94, '2024-03-27 13:34:55', '2025-03-06 23:11:30', 0, 2, 0),
(95, '2024-03-27 13:47:01', '2025-12-27 21:29:30', 0, 2, 0),
(96, '2024-03-31 09:11:22', '2026-08-13 01:08:37', 0, 2, 0),
(97, '2024-03-31 09:14:25', '2025-01-04 06:51:55', 0, 2, 0),
(98, '2024-03-31 10:20:51', '2025-05-23 09:15:43', 0, 2, 0),
(99, '2024-03-31 10:54:31', '2025-12-08 15:55:14', 0, 2, 0),
(100, '2024-03-31 11:34:39', '2026-02-06 23:17:29', 0, 2, 0),
(101, '2024-03-31 12:27:49', '2024-02-22 13:15:43', 0, 2, 0),
(102, '2024-03-31 12:56:41', '2025-04-19 11:06:54', 0, 2, 0),
(103, '2024-03-31 12:57:48', '2026-12-19 05:58:10', 0, 2, 0),
(104, '2024-03-31 13:02:45', '2024-07-01 05:11:43', 0, 2, 0),
(105, '2024-03-31 13:05:53', '2024-12-09 01:04:37', 0, 2, 0),
(106, '2024-03-31 13:06:34', '2026-04-16 17:19:58', 0, 2, 0),
(107, '2024-03-31 13:13:49', '2024-03-12 09:44:26', 0, 2, 0);

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
(1, 'Carne de vacuno', 12.3, 'Gran producto cárnico', 21, 'http://localhost:8085/media/0a71aa37bf8f2c71a5ab7dbc5965e6f6.1500.0.0.0.wmark.2373f2d9.jpg', 6, 0.1),
(2, 'Kiwi', 3.76, 'Nuevo producto creado por el sistema', 26, 'http://localhost:8085/media/default.jpg', 2, 0.04),
(3, 'Uva', 6.14, 'Nuevo producto creado por el sistema', 75, 'http://localhost:8085/media/default.jpg', 13, 0.04),
(4, 'Cazaya', 8.34, 'Nuevo producto creado por el sistema', 17, 'http://localhost:8085/media/default.jpg', 2, 0.21),
(5, 'Aceite de oliva', 5.52, 'Nuevo producto creado por el sistema', 77, 'http://localhost:8085/media/default.jpg', 7, 0.1),
(6, 'Melón', 3.24, 'Nuevo producto creado por el sistema', 28, 'http://localhost:8085/media/default.jpg', 8, 0),
(7, 'Sandía', 4.36, 'Nuevo producto creado por el sistema', 5, 'http://localhost:8085/media/default.jpg', 13, 0),
(8, 'Manzana', 3.62, 'Nuevo producto creado por el sistema', 99, 'http://localhost:8085/media/default.jpg', 11, 0),
(9, 'Plátano', 6.28, 'Nuevo producto creado por el sistema', 81, 'http://localhost:8085/media/default.jpg', 4, 0),
(10, 'Naranja', 3.77, 'Nuevo producto creado por el sistema', 53, 'http://localhost:8085/media/default.jpg', 3, 0),
(11, 'Melón', 1.64, 'Nuevo producto creado por el sistema', 90, 'http://localhost:8085/media/default.jpg', 1, 0),
(12, 'Sandía entera', 6.43, 'Pieza 7,72 kg aprox. | 2,19 €/kg', 66, 'http://localhost:8085/media/sandia.jpg', 11, 0.4),
(13, 'Kiwi', 2.8, 'Nuevo producto creado por el sistema', 80, 'http://localhost:8085/media/default.jpg', 7, 0),
(14, 'Uva', 1.53, 'Nuevo producto creado por el sistema', 92, 'http://localhost:8085/media/default.jpg', 8, 0),
(15, 'Manzana', 5.19, 'Nuevo producto creado por el sistema', 46, 'http://localhost:8085/media/default.jpg', 6, 0),
(16, 'Fresa', 4.78, 'Nuevo producto creado por el sistema', 59, 'http://localhost:8085/media/default.jpg', 11, 0),
(17, 'Kiwi', 3.59, 'Nuevo producto creado por el sistema', 35, 'http://localhost:8085/media/default.jpg', 11, 0),
(18, 'Kiwi', 6.02, 'Nuevo producto creado por el sistema', 2, 'http://localhost:8085/media/default.jpg', 11, 0),
(19, 'Plátano', 4.27, 'Nuevo producto creado por el sistema', 76, 'http://localhost:8085/media/default.jpg', 8, 0),
(20, 'Kiwi', 3.19, 'Nuevo producto creado por el sistema', 32, 'http://localhost:8085/media/default.jpg', 8, 0),
(21, 'Kiwi', 1.84, 'Nuevo producto creado por el sistema', 57, 'http://localhost:8085/media/default.jpg', 6, 0),
(22, 'Pera', 4.62, 'Nuevo producto creado por el sistema', 90, 'http://localhost:8085/media/default.jpg', 3, 0);

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
(3, 'Gabriela', 'García', 'Ramos', 'gabgarra0@gmail.com', '660175939', 'Avenida de la Libertad,Cantabria,39001', 'gabara0', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(4, 'María', 'Delgado', 'Cruz', 'mardelcr1@gmail.com', '664586043', 'Calle de la Princesa,Álava,01001', 'marelr1', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(5, 'María', 'Delgado', 'Santos', 'mardelsa2@gmail.com', '611606844', 'Avenida Menéndez Pelayo,S.C.Tenerife,38001', 'marela2', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(6, 'Camila', 'López', 'Díaz', 'camlopdi3@gmail.com', '690010512', 'Calle Fuencarral,Castellón,12001', 'camopi3', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(8, 'Tomás', 'Ramírez', 'Díaz', 'tomramdi5@gmail.com', '609041859', 'Paseo de la Estación,Navarra,31001', 'tomami5', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(9, 'Julián', 'Ruiz', 'Hernández', 'julruihe6@gmail.com', '601586149', 'Calle del Arenal,Cuenca,16001', 'juluie6', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(10, 'Isabella', 'Suárez', 'Rodríguez', 'isasuaro7@gmail.com', '675375942', 'Calle del Arenal,Guadalajara,19001', 'isauao7', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(11, 'Valentina', 'García', 'Díaz', 'valgardi8@gmail.com', '610480122', 'Calle del Prado,Toledo,45001', 'valari8', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(12, 'Gabriela', 'Vázquez', 'Pérez', 'gabvazpe9@gmail.com', '663282988', 'Carrera de San Jerónimo,Bizkaia,48001', 'gabaze9', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(13, 'Javier', 'Delgado', 'Torres', 'javdelto10@gmail.com', '654878665', 'Carrera de San Jerónimo,Teruel,44001', 'javelo10', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(14, 'Santiago', 'Santos', 'Blanco', 'sansanbl11@gmail.com', '678007148', 'Calle Real,Teruel,44001', 'sananl11', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(15, 'Clara', 'Ramírez', 'Serrano', 'claramse12@gmail.com', '695628526', 'Calle Fuencarral,Cádiz,11001', 'claame12', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(16, 'Luis', 'Vázquez', 'Castillo', 'luivazca13@gmail.com', '688880029', 'Avenida de la Victoria,Sevilla,41001', 'luiaza13', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(17, 'Catalina', 'Hernández', 'Delgado', 'catherde14@gmail.com', '655141310', 'Calle del Marqués de Larios,Teruel,44001', 'catere14', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(18, 'Santiago', 'Blanco', 'Díaz', 'sanbladi15@gmail.com', '664889820', 'Avenida Gran Vía de Colón,Ciudad Real,13001', 'sanlai15', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(19, 'Diego', 'García', 'Alvarez', 'diegaral16@gmail.com', '628864769', 'Calle del Príncipe,Cantabria,39001', 'diearl16', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(20, 'Valeria', 'Hernández', 'Martínez', 'valherma17@gmail.com', '643124781', 'Paseo de la Explanada de España,Gipuzkoa,20001', 'valera17', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(21, 'Gabriela', 'Rodríguez', 'Delgado', 'gabrodde18@gmail.com', '651384840', 'Paseo de la Alameda,Tarragona,43001', 'gabode18', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(22, 'Catalina', 'Ruiz', 'Morales', 'catruimo19@gmail.com', '602972815', 'Calle del Arenal,La Rioja,26001', 'catuio19', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(23, 'Emilio', 'Ramos', 'Delgado', 'emiramde20@gmail.com', '615666412', 'Carrera de San Jerónimo,Asturias,33001', 'emiame20', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(24, 'Sofía', 'Torres', 'Reyes', 'softorre21@gmail.com', '624687425', 'Calle Fuencarral,Navarra,31001', 'sofore21', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(25, 'Catalina', 'Jiménez', 'Sánchez', 'catjimsa22@gmail.com', '643618741', 'Avenida Gran Vía de Colón,Madrid,28001', 'catima22', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(26, 'Elena', 'Alvarez', 'Morales', 'elealvmo23@gmail.com', '624106850', 'Avenida de la Victoria,Ceuta,51001', 'elelvo23', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(27, 'Sofía', 'García', 'Morales', 'sofgarmo24@gmail.com', '676705965', 'Avenida de la Victoria,Granada,18001', 'sofaro24', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(28, 'Emma', 'Delgado', 'Jiménez', 'emmdelji25@gmail.com', '690695720', 'Calle del Prado,Zamora,49001', 'emmeli25', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(29, 'Isabella', 'García', 'López', 'isagarlo26@gmail.com', '679037169', 'Avenida de la Constitución,Zamora,49001', 'isaaro26', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(30, 'Camila', 'Ruiz', 'Ruiz', 'camruiru27@gmail.com', '658287684', 'Avenida de la Libertad,Palencia,34001', 'camuiu27', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(31, 'Pablo', 'González', 'Torres', 'pabgonto28@gmail.com', '696002813', 'Calle Fuencarral,Las Palmas,35001', 'pabono28', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(32, 'Javier', 'Serrano', 'Ramos', 'javserra29@gmail.com', '657661283', 'Paseo de la Habana,Zamora,49001', 'javera29', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(33, 'Pablo', 'Blanco', 'Reyes', 'pabblare30@gmail.com', '647042398', 'Calle del Príncipe,Castellón,12001', 'pablae30', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(34, 'Julián', 'Martínez', 'Sánchez', 'julmarsa31@gmail.com', '602999362', 'Calle del Prado,Alicante,03001', 'julara31', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(35, 'Javier', 'Flores', 'Pérez', 'javflope32@gmail.com', '615051600', 'Avenida de la Libertad,Lleida,25001', 'javloe32', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(36, 'Lucía', 'Ramírez', 'Molina', 'lucrammo33@gmail.com', '686607184', 'Paseo de Recoletos,Bizkaia,48001', 'lucamo33', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(37, 'Emma', 'González', 'Torres', 'emmgonto34@gmail.com', '607125352', 'Calle del Prado,Barcelona,08001', 'emmono34', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(38, 'Clara', 'Jiménez', 'Suárez', 'clajimsu35@gmail.com', '616077849', 'Paseo de la Explanada de España,Girona,17001', 'claimu35', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(39, 'Lucía', 'Rodríguez', 'Ramírez', 'lucrodra36@gmail.com', '635147416', 'Calle de la Paz,Asturias,33001', 'lucoda36', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(40, 'Martín', 'Jiménez', 'Molina', 'marjimmo37@gmail.com', '677125307', 'Calle Real,Almería,04001', 'marimo37', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(41, 'Tomás', 'López', 'Alvarez', 'tomlopal38@gmail.com', '621689941', 'Paseo de la Estación,Navarra,31001', 'tomopl38', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(42, 'Andrés', 'Gómez', 'Ramos', 'andgomra39@gmail.com', '624125992', 'Paseo de Recoletos,Castellón,12001', 'andoma39', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(43, 'Julián', 'Rojas', 'Serrano', 'julrojse40@gmail.com', '611641532', 'Paseo de Recoletos,Segovia,40001', 'juloje40', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(44, 'Lucía', 'Ramos', 'Suárez', 'lucramsu41@gmail.com', '690093556', 'Paseo de la Independencia,Badajoz,06001', 'lucamu41', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(45, 'María', 'Blanco', 'Serrano', 'marblase42@gmail.com', '641321693', 'Paseo de Recoletos,Zaragoza,50001', 'marlae42', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(46, 'Camila', 'Morales', 'Ramos', 'cammorra43@gmail.com', '677196418', 'Calle Fuencarral,Segovia,40001', 'camora43', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(47, 'Emma', 'González', 'López', 'emmgonlo44@gmail.com', '636642849', 'Paseo de la Alameda,Navarra,31001', 'emmono44', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(48, 'Diego', 'Reyes', 'Alvarez', 'diereyal45@gmail.com', '635247019', 'Calle del Marqués de Larios,Navarra,31001', 'dieeyl45', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(49, 'Isabella', 'Suárez', 'Suárez', 'isasuasu46@gmail.com', '628202728', 'Avenida de la Victoria,Cuenca,16001', 'isauau46', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(50, 'Emilio', 'Gómez', 'Alvarez', 'emigomal47@gmail.com', '669291828', 'Calle del Prado,La Rioja,26001', 'emioml47', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(51, 'Carlos', 'Díaz', 'Suárez', 'cardiasu48@gmail.com', '608771211', 'Calle de la Princesa,Melilla,52001', 'cariau48', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(52, 'Pablo', 'López', 'Blanco', 'pablopbl49@gmail.com', '640101476', 'Paseo de la Explanada de España,Lleida,25001', 'pabopl49', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(53, 'Camila', 'Reyes', 'Gómez', 'camreygo0@gmail.com', '649599715', 'Avenida de la Constitución,Melilla,52001', 'cameyo0', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(54, 'Emilio', 'Castillo', 'Morales', 'emicasmo1@gmail.com', '655072538', 'Calle de la Paz,Tarragona,43001', 'emiaso1', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(55, 'Lucía', 'Reyes', 'Sánchez', 'lucreysa2@gmail.com', '636928642', 'Calle Real,Valencia,46001', 'luceya2', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(56, 'Emilio', 'Ramírez', 'Sánchez', 'emiramsa3@gmail.com', '679502165', 'Paseo de la Independencia,Albacete,02001', 'emiama3', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(57, 'Clara', 'Rojas', 'Torres', 'clarojto4@gmail.com', '699175569', 'Calle de la Princesa,Bizkaia,48001', 'claojo4', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(58, 'Juan', 'Santos', 'Flores', 'juasanfl5@gmail.com', '652363566', 'Carrera de San Jerónimo,Ciudad Real,13001', 'juaanl5', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(59, 'Valentina', 'Blanco', 'Torres', 'valblato6@gmail.com', '617872999', 'Avenida Gran Vía de Colón,Huesca,22001', 'vallao6', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(60, 'Ana', 'Ramos', 'Vázquez', 'anaramva7@gmail.com', '622719786', 'Paseo de la Explanada de España,Salamanca,37001', 'anaama7', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(61, 'Martín', 'Morales', 'Rojas', 'marmorro8@gmail.com', '653187148', 'Calle Real,Badajoz,06001', 'maroro8', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(62, 'Juan', 'Vázquez', 'Reyes', 'juavazre9@gmail.com', '650224801', 'Avenida Menéndez Pelayo,Asturias,33001', 'juaaze9', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1);

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
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `valoracion`
--
ALTER TABLE `valoracion`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

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

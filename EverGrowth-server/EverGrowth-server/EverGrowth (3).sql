-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: database:3306
-- Tiempo de generación: 11-02-2024 a las 08:48:40
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
(1, 1, 2, 3),
(2, 1, 2, 5);

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
(1, 'Cereales', 'http://localhost:8085/media/cereales.jpg'),
(2, 'Pescado y Marisco', 'http://localhost:8085/media/pescado%20y%20marisco.jpg'),
(3, 'Frutas y Verduras', 'http://localhost:8085/media/frutas%20y%20verduras.jpeg'),
(4, 'Bebidas', 'http://localhost:8085/media/bebidas.jpg'),
(5, 'Pescado y Marisco', 'http://localhost:8085/media/pescado%20y%20marisco.jpg'),
(6, 'Lácteos', 'http://localhost:8085/media/productos-lacteos.jpg'),
(7, 'Legumbres', 'http://localhost:8085/media/legumbres.jpeg'),
(8, 'Congelados', 'http://localhost:8085/media/congelados.jpg'),
(9, 'Enlatados', 'http://localhost:8085/media/f.elconfidencial.com_original_3ee_e4e_b79_3eee4eb79d4831de5176388da703d4d9.jpg'),
(10, 'Enlatados', 'http://localhost:8085/media/f.elconfidencial.com_original_3ee_e4e_b79_3eee4eb79d4831de5176388da703d4d9.jpg'),
(11, 'Cereales', 'http://localhost:8085/media/default.jpg'),
(12, 'Repostería', 'http://localhost:8085/media/default.jpg'),
(13, 'Panadería', 'http://localhost:8085/media/default.jpg'),
(14, 'Legumbres', 'http://localhost:8085/media/default.jpg'),
(15, 'Pasta', 'http://localhost:8085/media/default.jpg'),
(16, 'Arroz', 'http://localhost:8085/media/default.jpg'),
(17, 'Carnes', 'http://localhost:8085/media/default.jpg'),
(18, 'Carnes', 'http://localhost:8085/media/default.jpg'),
(19, 'Carnes', 'http://localhost:8085/media/default.jpg'),
(20, 'Cereales', 'http://localhost:8085/media/default.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id` bigint NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` float NOT NULL,
  `id_producto` bigint NOT NULL,
  `id_pedido` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id`, `cantidad`, `precio_unitario`, `id_producto`, `id_pedido`) VALUES
(1, 5, 32.39, 2, 33),
(2, 1, 29.66, 1, 44),
(3, 1, 29.66, 1, 45),
(4, 1, 29.66, 1, 46),
(5, 1, 29.66, 1, 47),
(6, 1, 38.84, 3, 48),
(7, 1, 29.66, 1, 49),
(8, 1, 29.66, 1, 50);

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
(11, '2024-01-31 15:30:33', '2024-12-17 06:15:21', 0, 11, 0),
(12, '2024-01-31 15:30:33', '2026-10-21 16:03:19', 0, 19, 0),
(13, '2024-01-31 15:30:33', '2025-04-15 13:23:23', 0, 12, 0),
(14, '2024-01-31 15:30:33', '2026-07-18 18:14:17', 0, 13, 0),
(15, '2024-01-31 15:30:33', '2026-09-09 19:16:15', 0, 12, 0),
(16, '2024-01-31 15:30:33', '2026-08-09 13:47:39', 0, 18, 0),
(17, '2024-01-31 15:30:33', '2025-02-16 20:38:20', 0, 19, 0),
(18, '2024-01-31 15:30:33', '2025-05-12 21:01:07', 0, 2, 0),
(19, '2024-01-31 15:30:33', '2025-08-31 06:54:43', 0, 6, 0),
(20, '2024-01-31 15:30:33', '2026-09-20 05:54:26', 0, 6, 0),
(21, '2024-02-12 22:00:00', '2024-02-19 22:00:00', 0, 9, 0),
(22, '2024-02-06 08:31:47', '2026-08-27 03:31:39', 0, 89, 0),
(23, '2024-02-06 08:31:47', '2025-10-09 08:01:58', 0, 88, 0),
(24, '2024-02-06 08:31:47', '2024-04-17 22:59:51', 0, 13, 0),
(25, '2024-02-06 08:31:47', '2025-01-08 20:41:01', 0, 100, 0),
(26, '2024-02-06 08:31:47', '2024-07-15 21:01:03', 0, 71, 0),
(27, '2024-02-06 08:31:47', '2025-10-17 05:56:33', 0, 19, 0),
(28, '2024-02-06 08:31:47', '2026-11-07 10:43:57', 0, 48, 0),
(29, '2024-02-06 08:31:47', '2026-09-25 18:27:46', 0, 99, 0),
(30, '2024-02-06 08:31:47', '2024-03-28 01:35:31', 0, 46, 0),
(31, '2024-02-06 08:31:47', '2026-05-22 20:51:27', 0, 94, 0),
(32, '2024-02-06 11:34:19', '2024-02-06 11:34:19', 0, 1, 0),
(33, '2024-02-09 16:48:55', '2024-02-09 16:48:45', 0, 3, 0),
(34, '2024-02-09 16:53:40', '2026-09-28 23:19:29', 0, 30, 0),
(35, '2024-02-09 16:53:40', '2024-06-20 10:15:35', 0, 108, 0),
(36, '2024-02-09 16:53:40', '2025-11-01 06:41:31', 0, 16, 0),
(37, '2024-02-09 16:53:40', '2025-09-06 23:08:59', 0, 34, 0),
(38, '2024-02-09 16:53:40', '2026-08-19 04:31:07', 0, 66, 0),
(39, '2024-02-09 16:53:40', '2026-06-05 16:27:34', 0, 65, 0),
(40, '2024-02-09 16:53:40', '2024-10-29 04:17:44', 0, 99, 0),
(41, '2024-02-09 16:53:40', '2024-08-25 04:01:48', 0, 75, 0),
(42, '2024-02-09 16:53:40', '2025-01-30 03:00:22', 0, 10, 0),
(43, '2024-02-09 16:53:40', '2026-04-16 10:11:40', 0, 64, 0),
(44, '2024-02-09 17:02:18', '2024-08-28 10:33:09', 0, 2, 0),
(45, '2024-02-09 17:10:15', '2026-06-27 22:30:34', 0, 2, 0),
(46, '2024-02-09 17:11:45', '2025-12-05 04:48:22', 0, 2, 0),
(47, '2024-02-10 18:39:16', '2024-02-24 16:21:33', 0, 2, 0),
(48, '2024-02-10 19:03:09', '2025-09-15 10:41:11', 0, 2, 0),
(49, '2024-02-10 19:03:58', '2026-02-07 00:54:36', 0, 2, 0),
(50, '2024-02-10 19:04:29', '2026-05-31 06:53:06', 0, 2, 0);

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
  `id_categoria` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `precio`, `descripcion`, `stock`, `imagen`, `id_categoria`) VALUES
(1, 'Kiwi', 29.66, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 66, 'http://localhost:8085/media/default.jpg', 4),
(2, 'Naranja', 32.39, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 45, 'http://localhost:8085/media/default.jpg', 3),
(3, 'Melón', 38.84, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 63, 'http://localhost:8085/media/default.jpg', 10),
(4, 'Sandía', 47.91, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 90, 'http://localhost:8085/media/default.jpg', 3),
(5, 'Fresa', 5.28, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 37, 'http://localhost:8085/media/default.jpg', 3),
(6, 'Melón', 7.35, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 90, 'http://localhost:8085/media/default.jpg', 7),
(7, 'Fresa', 73.37, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 4, 'http://localhost:8085/media/default.jpg', 8),
(8, 'Manzana', 88.62, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 78, 'http://localhost:8085/media/default.jpg', 10),
(9, 'Kiwi', 23.25, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 59, 'http://localhost:8085/media/default.jpg', 3),
(10, 'Fresa', 8.07, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 8, 'http://localhost:8085/media/default.jpg', 1),
(11, 'Manzana', 85, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 15, 'http://localhost:8085/media/default.jpg', 6),
(12, 'Fresa', 5.26, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 73, 'http://localhost:8085/media/default.jpg', 10),
(13, 'Melón', 11.71, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 11, 'http://localhost:8085/media/default.jpg', 6),
(14, 'Melón', 99.16, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 89, 'http://localhost:8085/media/default.jpg', 9),
(15, 'Papaya', 12.2, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 5, 'http://localhost:8085/media/default.jpg', 4),
(16, 'Plátano', 54.19, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 64, 'http://localhost:8085/media/default.jpg', 5),
(17, 'Pera', 80.35, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 21, 'http://localhost:8085/media/default.jpg', 3),
(18, 'Pera', 33.55, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 75, 'http://localhost:8085/media/default.jpg', 10),
(19, 'Plátano', 61.22, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 90, 'http://localhost:8085/media/default.jpg', 8),
(20, 'Fresa', 89.16, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 3, 'http://localhost:8085/media/default.jpg', 1),
(21, 'Manzana', 80.38, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 57, 'http://localhost:8085/media/default.jpg', 6),
(22, 'Manzana', 35.98, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 10, 'http://localhost:8085/media/default.jpg', 1),
(23, 'Plátano', 97.33, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 85, 'http://localhost:8085/media/default.jpg', 4),
(24, 'Manzana', 67.99, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 82, 'http://localhost:8085/media/default.jpg', 5),
(25, 'Fresa', 89.44, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 84, 'http://localhost:8085/media/default.jpg', 1),
(26, 'Fresa', 42.36, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 14, 'http://localhost:8085/media/default.jpg', 8),
(27, 'Pera', 14.94, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 25, 'http://localhost:8085/media/default.jpg', 2),
(28, 'Fresa', 55.59, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 81, 'http://localhost:8085/media/default.jpg', 2),
(29, 'Sandía', 96.97, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 91, 'http://localhost:8085/media/default.jpg', 7),
(30, 'Sandía', 56.04, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 11, 'http://localhost:8085/media/default.jpg', 5),
(31, 'Pera', 30.95, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 11, 'http://localhost:8085/media/default.jpg', 3),
(32, 'Manzana', 67.22, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 73, 'http://localhost:8085/media/default.jpg', 8),
(33, 'Pera', 27.25, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 95, 'http://localhost:8085/media/default.jpg', 4),
(34, 'Manzana', 37.57, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 92, 'http://localhost:8085/media/default.jpg', 10),
(35, 'Papaya', 19.43, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 73, 'http://localhost:8085/media/default.jpg', 2),
(36, 'Uva', 15.03, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 92, 'http://localhost:8085/media/default.jpg', 7),
(37, 'Uva', 76.49, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 94, 'http://localhost:8085/media/default.jpg', 3),
(38, 'Uva', 45.47, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 15, 'http://localhost:8085/media/default.jpg', 3),
(39, 'Manzana', 43.89, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 44, 'http://localhost:8085/media/default.jpg', 6),
(40, 'Kiwi', 72.85, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 20, 'http://localhost:8085/media/default.jpg', 4),
(41, 'Fresa', 51.08, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 96, 'http://localhost:8085/media/default.jpg', 8),
(42, 'Kiwi', 28, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 43, 'http://localhost:8085/media/default.jpg', 9),
(43, 'Naranja', 76.26, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 2, 'http://localhost:8085/media/default.jpg', 1),
(44, 'Kiwi', 60.64, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 4, 'http://localhost:8085/media/default.jpg', 1),
(45, 'Melón', 13.45, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 23, 'http://localhost:8085/media/default.jpg', 3),
(46, 'Kiwi', 94.47, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 4, 'http://localhost:8085/media/default.jpg', 7),
(47, 'Plátano', 54.88, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 45, 'http://localhost:8085/media/default.jpg', 8),
(48, 'Fresa', 94.46, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 41, 'http://localhost:8085/media/default.jpg', 3),
(49, 'Fresa', 52.28, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 69, 'http://localhost:8085/media/default.jpg', 1),
(50, 'Uva', 93.82, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 61, 'http://localhost:8085/media/default.jpg', 10);

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
(1, 'Ana ', 'Pérez', 'Roca', 'anita@gmail.com', '632156987', 'Calle del Cerezo Nº 17', 'anita17', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(2, 'Monica', 'Alcañiz', 'Puig', 'monica@gmail.com', '642156657', 'Alameda', 'moni01', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 1),
(3, 'Tomás', 'Sánchez', 'Torres', 'tomsanto0@gmail.com', '630144946', 'Calle de la Paz,Lleida,25001', 'tomano0', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(4, 'Lucía', 'Ramírez', 'Ramos', 'lucramra1@gmail.com', '634824497', 'Avenida Menéndez Pelayo,Granada,18001', 'lucama1', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(5, 'Gabriela', 'Delgado', 'Ortega', 'gabdelor2@gmail.com', '661689347', 'Avenida de la Victoria,Castellón,12001', 'gabelr2', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(6, 'Elena', 'Ortega', 'Torres', 'eleortto3@gmail.com', '685906387', 'Paseo de la Alameda,Albacete,02001', 'elerto3', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(7, 'Adrián', 'Reyes', 'Santos', 'adrreysa4@gmail.com', '670197750', 'Calle de la Paz,Ávila,05001', 'adreya4', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(8, 'Mateo', 'González', 'Sánchez', 'matgonsa5@gmail.com', '686543867', 'Avenida Gran Vía de Colón,Sevilla,41001', 'matona5', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(9, 'Santiago', 'Reyes', 'López', 'sanreylo6@gmail.com', '605643856', 'Paseo de la Explanada de España,Melilla,52001', 'saneyo6', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(10, 'Ana', 'Rodríguez', 'Delgado', 'anarodde7@gmail.com', '693088108', 'Paseo de la Estación,Teruel,44001', 'anaode7', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(11, 'Catalina', 'Torres', 'Suárez', 'cattorsu8@gmail.com', '642271174', 'Paseo de la Independencia,Ourense,32001', 'catoru8', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(12, 'Laura', 'Santos', 'Hernández', 'lausanhe9@gmail.com', '677793155', 'Avenida Menéndez Pelayo,Almería,04001', 'lauane9', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(13, 'Clara', 'Delgado', 'Delgado', 'cladelde0@gmail.com', '658427711', 'Paseo de la Habana,Castellón,12001', 'claele0', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(14, 'Alejandro', 'Ramírez', 'Ramírez', 'aleramra1@gmail.com', '610034139', 'Calle del Prado,Lugo,27001', 'aleama1', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(15, 'Adrián', 'Sánchez', 'Pérez', 'adrsanpe2@gmail.com', '663627930', 'Avenida Menéndez Pelayo,Alicante,03001', 'adrane2', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(16, 'Juan', 'Blanco', 'Serrano', 'juablase3@gmail.com', '604357888', 'Avenida de la Constitución,Segovia,40001', 'jualae3', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(17, 'Camila', 'Morales', 'Ramírez', 'cammorra4@gmail.com', '621412623', 'Avenida Gran Vía de Colón,Pontevedra,36001', 'camora4', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(18, 'Gabriela', 'Martínez', 'Delgado', 'gabmarde5@gmail.com', '604836053', 'Avenida de la Victoria,Zaragoza,50001', 'gabare5', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(19, 'Lucía', 'Alvarez', 'González', 'lucalvgo6@gmail.com', '626033843', 'Paseo de la Habana,Cuenca,16001', 'luclvo6', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(20, 'Emma', 'Pérez', 'Suárez', 'emmpersu7@gmail.com', '676766432', 'Paseo de la Estación,Lleida,25001', 'emmeru7', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(21, 'Camila', 'Santos', 'Pérez', 'camsanpe8@gmail.com', '646087809', 'Paseo de la Estación,Cáceres,10001', 'camane8', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(22, 'Catalina', 'Morales', 'Flores', 'catmorfl9@gmail.com', '655153155', 'Paseo de Recoletos,Soria,42001', 'catorl9', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(23, 'Valeria', 'García', 'González', 'valgargo0@gmail.com', '661085070', 'Avenida Menéndez Pelayo,Almería,04001', 'valaro0', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(24, 'Elena', 'Ramírez', 'Delgado', 'eleramde1@gmail.com', '623696156', 'Calle de la Paz,Salamanca,37001', 'eleame1', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(25, 'Adrián', 'Ramírez', 'Reyes', 'adrramre2@gmail.com', '613900388', 'Calle del Príncipe,Navarra,31001', 'adrame2', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(26, 'Carlos', 'Delgado', 'Rodríguez', 'cardelro3@gmail.com', '664283332', 'Paseo de la Explanada de España,Salamanca,37001', 'carelo3', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(27, 'Tomás', 'Gómez', 'Hernández', 'tomgomhe4@gmail.com', '603361265', 'Paseo de la Alameda,Pontevedra,36001', 'tomome4', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(28, 'Carlos', 'Hernández', 'Cruz', 'carhercr5@gmail.com', '640574893', 'Paseo de la Alameda,Sevilla,41001', 'carerr5', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(29, 'Tomás', 'Blanco', 'Torres', 'tomblato6@gmail.com', '684211192', 'Calle Real,León,24001', 'tomlao6', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(30, 'Carlos', 'Gómez', 'Ramos', 'cargomra7@gmail.com', '637708200', 'Paseo de la Explanada de España,Cuenca,16001', 'caroma7', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(31, 'Pablo', 'Sánchez', 'García', 'pabsanga8@gmail.com', '648381844', 'Paseo de la Explanada de España,Granada,18001', 'pabana8', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(32, 'Clara', 'Ruiz', 'Ramírez', 'claruira9@gmail.com', '606028106', 'Calle del Marqués de Larios,Soria,42001', 'clauia9', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(33, 'Luis', 'Molina', 'Sánchez', 'luimolsa0@gmail.com', '613670060', 'Avenida de la Constitución,Córdoba,14001', 'luiola0', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(34, 'Carlos', 'Díaz', 'Jiménez', 'cardiaji1@gmail.com', '698353169', 'Calle de la Princesa,Bizkaia,48001', 'cariai1', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(35, 'Luis', 'Castillo', 'Torres', 'luicasto2@gmail.com', '628990564', 'Calle Fuencarral,Segovia,40001', 'luiaso2', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(36, 'Elena', 'Ramírez', 'Molina', 'elerammo3@gmail.com', '638906319', 'Paseo de la Habana,Córdoba,14001', 'eleamo3', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(37, 'Luis', 'Serrano', 'Ortega', 'luiseror4@gmail.com', '676138710', 'Avenida de la Constitución,Sevilla,41001', 'luierr4', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(38, 'Isabella', 'García', 'Vázquez', 'isagarva5@gmail.com', '686123109', 'Calle del Marqués de Larios,Cuenca,16001', 'isaara5', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(39, 'Juan', 'Cruz', 'López', 'juacrulo6@gmail.com', '694350623', 'Paseo de la Independencia,Sevilla,41001', 'juaruo6', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(40, 'Pablo', 'Molina', 'Delgado', 'pabmolde7@gmail.com', '616265715', 'Calle del Prado,Girona,17001', 'pabole7', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(41, 'Tomás', 'Díaz', 'Delgado', 'tomdiade8@gmail.com', '636837351', 'Calle del Prado,Bizkaia,48001', 'tomiae8', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(42, 'Catalina', 'Gómez', 'Gómez', 'catgomgo9@gmail.com', '640284899', 'Avenida Gran Vía de Colón,Valencia,46001', 'catomo9', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(43, 'Andrés', 'Ramos', 'Gómez', 'andramgo0@gmail.com', '674455664', 'Calle Real,Guadalajara,19001', 'andamo0', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(44, 'Diego', 'Rodríguez', 'Pérez', 'dierodpe0@gmail.com', '638290266', 'Calle de la Paz,Murcia,30001', 'dieode0', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(45, 'Andrés', 'Ortega', 'Ortega', 'andortor1@gmail.com', '626739992', 'Avenida de la Constitución,León,24001', 'andrtr1', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(46, 'Clara', 'Alvarez', 'Santos', 'claalvsa2@gmail.com', '636326017', 'Paseo de Recoletos,Lleida,25001', 'clalva2', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(47, 'Laura', 'Jiménez', 'Molina', 'laujimmo3@gmail.com', '603863244', 'Calle del Prado,Salamanca,37001', 'lauimo3', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(48, 'Valentina', 'Morales', 'Delgado', 'valmorde4@gmail.com', '653711245', 'Avenida Menéndez Pelayo,Palencia,34001', 'valore4', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(49, 'Camila', 'Morales', 'Delgado', 'cammorde5@gmail.com', '619652923', 'Avenida de la Constitución,Badajoz,06001', 'camore5', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(50, 'Carlos', 'Pérez', 'González', 'carpergo6@gmail.com', '688207470', 'Calle del Príncipe,Gipuzkoa,20001', 'carero6', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(51, 'Julián', 'Sánchez', 'Suárez', 'julsansu7@gmail.com', '641544385', 'Carrera de San Jerónimo,Badajoz,06001', 'julanu7', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(52, 'Pablo', 'Gómez', 'Ortega', 'pabgomor8@gmail.com', '670064041', 'Calle del Arenal,La Rioja,26001', 'pabomr8', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(53, 'Clara', 'Rodríguez', 'Flores', 'clarodfl9@gmail.com', '633786720', 'Paseo de la Habana,Álava,01001', 'claodl9', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(54, 'Luis', 'Molina', 'López', 'luimollo0@gmail.com', '677229513', 'Paseo de la Alameda,Cádiz,11001', 'luiolo0', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(55, 'Martín', 'Alvarez', 'Santos', 'maralvsa0@gmail.com', '624572506', 'Paseo de la Alameda,Palencia,34001', 'marlva0', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(56, 'Clara', 'Ramos', 'Jiménez', 'claramji0@gmail.com', '666025255', 'Paseo de la Estación,Málaga,29001', 'claami0', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(57, 'Camila', 'Blanco', 'Gómez', 'camblago1@gmail.com', '640962283', 'Paseo de la Estación,Valencia,46001', 'camlao1', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(58, 'María', 'Vázquez', 'Ortega', 'marvazor2@gmail.com', '679652274', 'Calle Real,Murcia,30001', 'marazr2', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(59, 'Emilio', 'Suárez', 'López', 'emisualo3@gmail.com', '610617269', 'Paseo de la Habana,Tarragona,43001', 'emiuao3', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(60, 'Santiago', 'Reyes', 'Suárez', 'sanreysu4@gmail.com', '617672583', 'Calle del Arenal,Navarra,31001', 'saneyu4', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(61, 'Sofía', 'Gómez', 'Cruz', 'sofgomcr5@gmail.com', '628732390', 'Avenida de la Libertad,Málaga,29001', 'sofomr5', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(62, 'María', 'Vázquez', 'Suárez', 'marvazsu6@gmail.com', '600130086', 'Calle del Arenal,Burgos,09001', 'marazu6', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(63, 'Elena', 'Blanco', 'González', 'eleblago7@gmail.com', '636791525', 'Avenida Menéndez Pelayo,Soria,42001', 'elelao7', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(64, 'Emma', 'Suárez', 'Ortega', 'emmsuaor8@gmail.com', '653165360', 'Avenida de la Libertad,Tarragona,43001', 'emmuar8', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(65, 'Catalina', 'Serrano', 'Cruz', 'catsercr9@gmail.com', '659649187', 'Calle Fuencarral,Segovia,40001', 'caterr9', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(66, 'Andrés', 'Ortega', 'Santos', 'andortsa0@gmail.com', '660726217', 'Calle de la Paz,Sevilla,41001', 'andrta0', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(67, 'Emma', 'Gómez', 'Vázquez', 'emmgomva1@gmail.com', '608153316', 'Avenida Menéndez Pelayo,Navarra,31001', 'emmoma1', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(68, 'Santiago', 'Ramírez', 'Serrano', 'sanramse2@gmail.com', '656299332', 'Calle de la Paz,Córdoba,14001', 'saname2', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(69, 'Javier', 'Hernández', 'Blanco', 'javherbl3@gmail.com', '629716883', 'Paseo de la Estación,Cuenca,16001', 'javerl3', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(70, 'Paula', 'Molina', 'Pérez', 'paumolpe4@gmail.com', '691417776', 'Paseo de la Estación,Zaragoza,50001', 'pauole4', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(71, 'Julián', 'Cruz', 'García', 'julcruga5@gmail.com', '642778242', 'Paseo de la Estación,Ciudad Real,13001', 'julrua5', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(72, 'Clara', 'Flores', 'Jiménez', 'clafloji6@gmail.com', '615249319', 'Paseo de la Explanada de España,Toledo,45001', 'claloi6', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(73, 'Gabriela', 'Díaz', 'Díaz', 'gabdiadi7@gmail.com', '631713207', 'Paseo de la Explanada de España,Zamora,49001', 'gabiai7', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(74, 'Carlos', 'Ramírez', 'Jiménez', 'carramji8@gmail.com', '695335198', 'Calle de la Princesa,Cádiz,11001', 'carami8', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(75, 'Ana', 'Molina', 'Flores', 'anamolfl9@gmail.com', '662839648', 'Avenida de la Victoria,Granada,18001', 'anaoll9', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(76, 'Tomás', 'González', 'Martínez', 'tomgonma0@gmail.com', '655639267', 'Calle de la Paz,Las Palmas,35001', 'tomona0', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(77, 'Catalina', 'Sánchez', 'Blanco', 'catsanbl1@gmail.com', '607411136', 'Avenida Gran Vía de Colón,Huelva,21001', 'catanl1', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(78, 'Tomás', 'Rojas', 'Alvarez', 'tomrojal2@gmail.com', '648925040', 'Calle del Prado,Granada,18001', 'tomojl2', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(79, 'Ana', 'Torres', 'Flores', 'anatorfl3@gmail.com', '663793010', 'Avenida de la Libertad,Salamanca,37001', 'anaorl3', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(80, 'Valeria', 'Rojas', 'Sánchez', 'valrojsa4@gmail.com', '652390442', 'Avenida Gran Vía de Colón,La Rioja,26001', 'valoja4', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(81, 'Ana', 'Cruz', 'Ortega', 'anacruor5@gmail.com', '677098163', 'Avenida Gran Vía de Colón,Ávila,05001', 'anarur5', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(82, 'Julián', 'García', 'García', 'julgarga6@gmail.com', '689826681', 'Paseo de la Alameda,Cantabria,39001', 'julara6', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(83, 'Emilio', 'Rodríguez', 'González', 'emirodgo7@gmail.com', '618539110', 'Avenida de la Libertad,Valencia,46001', 'emiodo7', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(84, 'Diego', 'González', 'Reyes', 'diegonre8@gmail.com', '679423909', 'Carrera de San Jerónimo,Málaga,29001', 'dieone8', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(85, 'Elena', 'Martínez', 'Suárez', 'elemarsu9@gmail.com', '612490804', 'Calle de la Paz,Lugo,27001', 'elearu9', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(86, 'Ana', 'Blanco', 'Cruz', 'anablacr0@gmail.com', '600112511', 'Paseo de la Independencia,Girona,17001', 'analar0', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(87, 'Pablo', 'Vázquez', 'Torres', 'pabvazto0@gmail.com', '648431348', 'Calle de la Paz,Valencia,46001', 'pabazo0', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(88, 'María', 'Morales', 'Serrano', 'marmorse1@gmail.com', '622263704', 'Paseo de la Independencia,Pontevedra,36001', 'marore1', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(89, 'Sofía', 'Torres', 'Suárez', 'softorsu2@gmail.com', '671499348', 'Calle Fuencarral,Asturias,33001', 'soforu2', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(90, 'Emma', 'Delgado', 'Santos', 'emmdelsa3@gmail.com', '646850665', 'Calle del Príncipe,Granada,18001', 'emmela3', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(91, 'Elena', 'Blanco', 'Ruiz', 'eleblaru4@gmail.com', '655358303', 'Avenida Menéndez Pelayo,Córdoba,14001', 'elelau4', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(92, 'María', 'Alvarez', 'Cruz', 'maralvcr5@gmail.com', '661686911', 'Avenida Gran Vía de Colón,Soria,42001', 'marlvr5', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(93, 'Catalina', 'Rodríguez', 'Delgado', 'catrodde6@gmail.com', '604331579', 'Avenida Gran Vía de Colón,Sevilla,41001', 'catode6', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(94, 'Emilio', 'Martínez', 'Rodríguez', 'emimarro7@gmail.com', '661194891', 'Calle de la Paz,Badajoz,06001', 'emiaro7', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(95, 'Javier', 'Serrano', 'Díaz', 'javserdi8@gmail.com', '634697200', 'Calle del Arenal,Pontevedra,36001', 'javeri8', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(96, 'Lucía', 'Castillo', 'Ruiz', 'luccasru9@gmail.com', '641700070', 'Avenida de la Constitución,Salamanca,37001', 'lucasu9', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(97, 'Lucía', 'Suárez', 'Cruz', 'lucsuacr0@gmail.com', '605066397', 'Calle de la Paz,Coruña,15001', 'lucuar0', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(98, 'Emma', 'Rodríguez', 'Ruiz', 'emmrodru1@gmail.com', '665344624', 'Paseo de la Estación,Valladolid,47001', 'emmodu1', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(99, 'Elena', 'Ramírez', 'Flores', 'eleramfl2@gmail.com', '668938187', 'Paseo de Recoletos,Barcelona,08001', 'eleaml2', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(100, 'Lucía', 'Hernández', 'Blanco', 'lucherbl3@gmail.com', '636857566', 'Calle del Príncipe,Castellón,12001', 'lucerl3', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(101, 'Catalina', 'Molina', 'Serrano', 'catmolse4@gmail.com', '666535399', 'Avenida Menéndez Pelayo,S.C.Tenerife,38001', 'catole4', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(102, 'Santiago', 'Ortega', 'Castillo', 'sanortca5@gmail.com', '699149740', 'Avenida Gran Vía de Colón,Salamanca,37001', 'sanrta5', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(103, 'Alejandro', 'Hernández', 'Jiménez', 'aleherji6@gmail.com', '672343463', 'Calle Fuencarral,Málaga,29001', 'aleeri6', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(104, 'Emilio', 'Ortega', 'Alvarez', 'emiortal7@gmail.com', '635601596', 'Paseo de la Alameda,Cádiz,11001', 'emirtl7', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(105, 'Emma', 'Alvarez', 'López', 'emmalvlo8@gmail.com', '694095407', 'Calle de la Princesa,Girona,17001', 'emmlvo8', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(106, 'Andrés', 'Reyes', 'Hernández', 'andreyhe9@gmail.com', '669936943', 'Calle de la Princesa,Tarragona,43001', 'andeye9', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(107, 'Pablo', 'Torres', 'Ramírez', 'pabtorra0@gmail.com', '602230534', 'Avenida de la Constitución,Valladolid,47001', 'pabora0', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(108, 'Andrés', 'Suárez', 'Vázquez', 'andsuava1@gmail.com', '687678455', 'Paseo de la Explanada de España,Álava,01001', 'anduaa1', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(109, 'Diego', 'Cruz', 'Rojas', 'diecruro2@gmail.com', '617705573', 'Calle del Arenal,Palencia,34001', 'dieruo2', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(110, 'María', 'Ruiz', 'García', 'marruiga3@gmail.com', '609651535', 'Avenida de la Libertad,Zamora,49001', 'maruia3', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(111, 'Lucía', 'Rojas', 'Jiménez', 'lucrojji4@gmail.com', '622501166', 'Calle del Prado,Gipuzkoa,20001', 'lucoji4', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(112, 'Alejandro', 'Molina', 'Sánchez', 'alemolsa5@gmail.com', '652468027', 'Avenida Gran Vía de Colón,Las Palmas,35001', 'aleola5', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(113, 'Emma', 'Delgado', 'Molina', 'emmdelmo6@gmail.com', '618301517', 'Calle del Arenal,Ciudad Real,13001', 'emmelo6', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(114, 'Emma', 'González', 'Santos', 'emmgonsa7@gmail.com', '625220014', 'Calle del Prado,Alicante,03001', 'emmona7', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(115, 'Adrián', 'Santos', 'González', 'adrsango8@gmail.com', '670323987', 'Avenida Menéndez Pelayo,Badajoz,06001', 'adrano8', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(116, 'Camila', 'Rojas', 'Ortega', 'camrojor9@gmail.com', '665364039', 'Calle del Arenal,León,24001', 'camojr9', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(117, 'Juan', 'Vázquez', 'Alvarez', 'juavazal0@gmail.com', '657700076', 'Paseo de la Alameda,Málaga,29001', 'juaazl0', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(118, 'Isabella', 'Santos', 'Vázquez', 'isasanva1@gmail.com', '655434032', 'Paseo de la Habana,Salamanca,37001', 'isaana1', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(119, 'Ana', 'Rojas', 'Martínez', 'anarojma2@gmail.com', '666667740', 'Avenida de la Libertad,Teruel,44001', 'anaoja2', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(120, 'Isabella', 'Santos', 'López', 'isasanlo3@gmail.com', '615109792', 'Paseo de la Explanada de España,Ávila,05001', 'isaano3', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(121, 'Andrés', 'Delgado', 'Gómez', 'anddelgo4@gmail.com', '675021703', 'Paseo de Recoletos,Melilla,52001', 'andelo4', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(122, 'Julián', 'Vázquez', 'Díaz', 'julvazdi5@gmail.com', '647125634', 'Calle del Arenal,Madrid,28001', 'julazi5', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(123, 'Emma', 'Díaz', 'Pérez', 'emmdiape6@gmail.com', '658106068', 'Paseo de Recoletos,Granada,18001', 'emmiae6', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(124, 'Valeria', 'López', 'Santos', 'vallopsa7@gmail.com', '650015100', 'Calle del Marqués de Larios,Barcelona,08001', 'valopa7', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(125, 'Isabella', 'Jiménez', 'López', 'isajimlo8@gmail.com', '628899350', 'Avenida de la Constitución,Huesca,22001', 'isaimo8', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(126, 'Paula', 'Reyes', 'Flores', 'paureyfl9@gmail.com', '617734631', 'Carrera de San Jerónimo,Sevilla,41001', 'paueyl9', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
(127, 'Gabriela', 'Ortega', 'Rodríguez', 'gabortro0@gmail.com', '633467047', 'Calle Fuencarral,Islas Baleares,07001', 'gabrto0', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 1),
(128, 'Laura', 'Ruiz', 'Suárez', 'lauruisu1@gmail.com', '679412710', 'Calle de la Princesa,Melilla,52001', 'lauuiu1', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 1),
(129, 'Andrés', 'Morales', 'Rojas', 'andmorro2@gmail.com', '644744503', 'Calle del Prado,Barcelona,08001', 'andoro2', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 1),
(130, 'Ana', 'Jiménez', 'Hernández', 'anajimhe3@gmail.com', '696999785', 'Paseo de la Habana,Sevilla,41001', 'anaime3', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 1),
(131, 'Martín', 'Ramírez', 'Gómez', 'marramgo4@gmail.com', '695148641', 'Avenida de la Constitución,Burgos,09001', 'maramo4', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 1),
(132, 'Paula', 'Suárez', 'García', 'pausuaga5@gmail.com', '643277950', 'Paseo de la Alameda,Sevilla,41001', 'pauuaa5', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 1),
(133, 'Carlos', 'Sánchez', 'Blanco', 'carsanbl6@gmail.com', '633708590', 'Avenida Menéndez Pelayo,León,24001', 'caranl6', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 1),
(134, 'Isabella', 'Torres', 'Martínez', 'isatorma7@gmail.com', '650430868', 'Paseo de la Explanada de España,Las Palmas,35001', 'isaora7', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 1),
(135, 'Clara', 'Suárez', 'Sánchez', 'clasuasa8@gmail.com', '679188259', 'Avenida de la Libertad,Bizkaia,48001', 'clauaa8', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 1),
(136, 'Isabella', 'Gómez', 'López', 'isagomlo9@gmail.com', '669933799', 'Calle del Arenal,Ciudad Real,13001', 'isaomo9', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 1);

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
-- Volcado de datos para la tabla `valoracion`
--

INSERT INTO `valoracion` (`id`, `titulo`, `fecha`, `mensaje`, `id_usuario`, `id_producto`) VALUES
(1, 'When the book barks softly one car reads. ', '2024-02-08 16:22:51', 'The dog is and one friend sleeps slowly. ', 2, 8),
(2, 'Although the sandwich sleeps quickly a sun shines. ', '2024-02-08 16:22:51', 'Whether one book is quickly a sun reads loudly. ', 62, 16),
(3, 'The house fly. ', '2024-02-08 16:22:51', 'A cat ate quickly or the sun sleeps slowly. ', 28, 2),
(4, 'One sun reads. ', '2024-02-08 16:22:51', 'One birds barks and one cat reads brightly. ', 86, 3),
(5, 'One friend sleeps slowly or one cat ate softly. ', '2024-02-08 16:22:51', 'So that the car is the book run loudly. ', 80, 29),
(6, 'While a book ate a dog ate and one book sleeps. ', '2024-02-08 16:22:52', 'The dog barks and one house run brightly. ', 37, 6),
(7, 'A house shines loudly but the book ate softly. ', '2024-02-08 16:22:52', 'One sandwich run but the sun sleeps. ', 110, 14),
(8, 'Before the house reads quickly the birds shines slowly. ', '2024-02-08 16:22:52', 'One dog sleeps quickly or one sun barks brightly. ', 20, 19),
(9, 'The car is softly and a birds run. ', '2024-02-08 16:22:52', 'Wherever one dog shines slowly the book shines softly. ', 4, 17),
(10, 'A house sleeps softly and the house shines brightly. ', '2024-02-08 16:22:52', 'The car is slowly. ', 45, 28),
(11, 'A friend shines softly. ', '2024-02-08 16:22:52', 'One sun fly brightly and one house ate. ', 80, 32),
(12, 'Whether a birds sleeps quickly one birds shines quickly or one dog run. ', '2024-02-08 16:22:52', 'A car sleeps or a cat reads. ', 102, 30),
(13, 'One book is and one house run softly. ', '2024-02-08 16:22:52', 'A sun is softly. ', 14, 29),
(14, 'Unless the car run the cat run softly but the birds is. ', '2024-02-08 16:22:52', 'Once one house sleeps slowly the friend reads. ', 83, 28),
(15, 'The friend barks quickly and one cat sleeps softly. ', '2024-02-08 16:22:52', 'One birds is or a sun sleeps. ', 9, 12),
(16, 'A dog sleeps. ', '2024-02-08 16:22:52', 'The car fly or a friend reads slowly. ', 75, 12),
(17, 'The car run slowly. ', '2024-02-08 16:22:52', 'One book shines. ', 94, 9),
(18, 'A book is and one sandwich shines loudly. ', '2024-02-08 16:22:52', 'A sun ate. ', 114, 43),
(19, 'One birds fly but the dog fly. ', '2024-02-08 16:22:52', 'The book sleeps. ', 86, 21),
(20, 'A dog is but a book sleeps loudly. ', '2024-02-08 16:22:52', 'As a book ate slowly one book run but a dog shines brightly. ', 29, 34),
(21, 'One dog fly but the car barks. ', '2024-02-08 16:22:52', 'One sun fly brightly and the car barks. ', 77, 27),
(22, 'So that one dog shines loudly one sandwich shines loudly. ', '2024-02-08 16:22:53', 'A car run softly but the house barks slowly. ', 29, 6),
(23, 'One house is. ', '2024-02-08 16:22:53', 'A dog barks slowly. ', 49, 18),
(24, 'Provided that one dog shines brightly one sandwich sleeps brightly but a sun shines brightly. ', '2024-02-08 16:22:53', 'One dog barks loudly. ', 101, 40),
(25, 'So that a car fly quickly a car sleeps quickly. ', '2024-02-08 16:22:53', 'When a dog is softly one sun shines loudly and one sun barks. ', 45, 20),
(26, 'So that a house fly softly the dog reads and one dog barks slowly. ', '2024-02-08 16:22:53', 'A sandwich run brightly. ', 107, 38),
(27, 'A birds shines or one sun ate. ', '2024-02-08 16:22:53', 'Wherever the book barks the cat run loudly and one house is quickly. ', 73, 16),
(28, 'A house ate. ', '2024-02-08 16:22:53', 'The dog reads quickly. ', 51, 6),
(29, 'A sandwich run but a house sleeps. ', '2024-02-08 16:22:53', 'One book barks loudly. ', 114, 36),
(30, 'One cat is. ', '2024-02-08 16:22:53', 'One house is brightly or one sandwich fly loudly. ', 45, 27),
(31, 'A house is or one dog barks. ', '2024-02-08 16:22:53', 'The friend barks. ', 109, 42),
(32, 'Because one car barks a house shines. ', '2024-02-08 16:22:53', 'The cat reads softly and the dog barks. ', 57, 17),
(33, 'A car reads. ', '2024-02-08 16:22:53', 'Whether the sun reads loudly one sun shines loudly and a sandwich reads brightly. ', 54, 35),
(34, 'When the sandwich shines one car barks loudly. ', '2024-02-08 16:22:53', 'One book sleeps loudly. ', 112, 6),
(35, 'One birds ate but one birds shines. ', '2024-02-08 16:22:53', 'Until a birds is quickly the house sleeps but one sun ate slowly. ', 2, 10),
(36, 'A house is slowly. ', '2024-02-08 16:22:53', 'The sandwich reads. ', 24, 6),
(37, 'The book sleeps quickly and a cat reads loudly. ', '2024-02-08 16:22:53', 'One friend ate. ', 72, 35),
(38, 'A sandwich barks brightly and one sandwich ate brightly. ', '2024-02-08 16:22:53', 'A cat sleeps slowly or the friend is. ', 17, 16),
(39, 'A cat run and the sun ate. ', '2024-02-08 16:22:53', 'One car fly or one sandwich shines. ', 113, 28),
(40, 'Because the dog run the house reads. ', '2024-02-08 16:22:53', 'One friend shines slowly or a sandwich shines. ', 100, 26),
(41, 'When a friend is brightly a car sleeps. ', '2024-02-08 16:22:53', 'The sun reads. ', 38, 31),
(42, 'One cat is. ', '2024-02-08 16:22:53', 'A house barks but one book sleeps slowly. ', 27, 39),
(43, 'One sun fly. ', '2024-02-08 16:22:53', 'A house barks softly. ', 79, 1),
(44, 'A house reads quickly but the book sleeps. ', '2024-02-08 16:22:53', 'After one sandwich reads the sun ate but a cat fly. ', 91, 3),
(45, 'One dog is. ', '2024-02-08 16:22:53', 'Unless the sandwich run brightly the birds run brightly and a friend reads. ', 41, 34),
(46, 'In order to a car run slowly one house is brightly. ', '2024-02-08 16:22:54', 'Though one car shines brightly one car ate softly but one friend shines. ', 92, 6),
(47, 'A sandwich barks softly. ', '2024-02-08 16:22:54', 'Since one birds reads quickly one sandwich run loudly or the book run slowly. ', 5, 23),
(48, 'One cat reads loudly and the friend sleeps brightly. ', '2024-02-08 16:22:54', 'One house sleeps brightly and the birds barks brightly. ', 55, 43),
(49, 'One book reads. ', '2024-02-08 16:22:54', 'One sandwich sleeps and the sandwich reads. ', 83, 13),
(50, 'A sun sleeps slowly. ', '2024-02-08 16:22:54', 'When the sandwich reads loudly the car ate. ', 73, 46),
(51, 'The friend run loudly and the cat shines. ', '2024-02-09 17:44:25', 'The car shines loudly but the sun shines slowly. ', 55, 8),
(52, 'A birds barks softly but one house ate. ', '2024-02-09 17:44:25', 'The friend reads softly or a sandwich fly softly. ', 11, 37),
(53, 'The birds run softly and a birds run quickly. ', '2024-02-09 17:44:25', 'One cat is or one book run loudly. ', 113, 47),
(54, 'When a sandwich is one car barks. ', '2024-02-09 17:44:26', 'One dog ate. ', 110, 11),
(55, 'One dog sleeps but a sun shines slowly. ', '2024-02-09 17:44:26', 'While the house shines quickly the dog ate softly. ', 71, 22),
(56, 'One cat fly slowly or a dog barks slowly. ', '2024-02-09 17:44:26', 'Where one sandwich is quickly a cat barks. ', 27, 42),
(57, 'The sandwich reads. ', '2024-02-09 17:44:26', 'A book shines brightly but the book ate. ', 100, 34),
(58, 'Where a birds ate brightly a friend sleeps quickly. ', '2024-02-09 17:44:26', 'One sandwich ate quickly but a birds reads. ', 93, 45),
(59, 'Where a sandwich shines one sandwich shines quickly. ', '2024-02-09 17:44:26', 'Whether the dog fly the book shines loudly but one house fly. ', 19, 2),
(60, 'The dog fly slowly or a house run. ', '2024-02-09 17:44:26', 'Whether the friend reads a house shines but one birds fly. ', 91, 28),
(61, 'A sun shines and the friend fly. ', '2024-02-09 17:44:26', 'A car sleeps slowly. ', 88, 4),
(62, 'The friend fly loudly. ', '2024-02-09 17:44:26', 'A book shines. ', 31, 46),
(63, 'One sun run. ', '2024-02-09 17:44:26', 'The sandwich ate softly and a dog is slowly. ', 9, 30),
(64, 'So that one house shines one book run brightly or one car barks. ', '2024-02-09 17:44:26', 'A friend ate quickly but a friend barks. ', 81, 16),
(65, 'One friend fly quickly. ', '2024-02-09 17:44:26', 'Even though a cat barks one house is softly. ', 28, 22),
(66, 'One sandwich reads quickly. ', '2024-02-09 17:44:26', 'The friend is slowly or one friend fly brightly. ', 2, 24),
(67, 'A book run softly and the book barks quickly. ', '2024-02-09 17:44:26', 'Until a dog fly a sun reads softly but a car is loudly. ', 18, 28),
(68, 'One friend fly softly and a sun fly brightly. ', '2024-02-09 17:44:26', 'The friend sleeps and a sun is. ', 61, 41),
(69, 'One house sleeps. ', '2024-02-09 17:44:26', 'One sun barks quickly or one friend reads quickly. ', 10, 33),
(70, 'The sun barks and the cat ate. ', '2024-02-09 17:44:26', 'After one cat barks a house sleeps loudly and a sun sleeps. ', 108, 8),
(71, 'A friend is or the dog barks. ', '2024-02-09 17:44:26', 'Than one dog barks loudly one cat shines. ', 30, 7),
(72, 'A book run slowly or one friend run loudly. ', '2024-02-09 17:44:27', 'A sun run. ', 91, 1),
(73, 'The dog is. ', '2024-02-09 17:44:27', 'The sandwich barks. ', 16, 3),
(74, 'One sun fly loudly. ', '2024-02-09 17:44:27', 'Until one house is the house is. ', 28, 15),
(75, 'The dog ate brightly. ', '2024-02-09 17:44:27', 'Even though the house fly a sandwich reads brightly. ', 95, 42),
(76, 'That the friend ate the house shines. ', '2024-02-09 17:44:27', 'Whenever one book sleeps a house shines. ', 72, 45),
(77, 'Though one book is softly a house is. ', '2024-02-09 17:44:27', 'One friend sleeps or the car fly. ', 11, 44),
(78, 'Where the sun barks one sandwich reads brightly. ', '2024-02-09 17:44:27', 'A dog run slowly and the cat ate slowly. ', 46, 24),
(79, 'In order to one book run softly one dog reads or a car reads softly. ', '2024-02-09 17:44:27', 'Unless a sandwich is a dog ate. ', 106, 19),
(80, 'One birds fly brightly or a car ate brightly. ', '2024-02-09 17:44:27', 'One sandwich sleeps quickly or a book sleeps loudly. ', 53, 17),
(81, 'One sandwich run loudly but a dog fly. ', '2024-02-09 17:44:27', 'A book sleeps. ', 54, 37),
(82, 'The sun fly softly. ', '2024-02-09 17:44:27', 'A cat sleeps slowly. ', 18, 28),
(83, 'Because a sandwich barks the book run softly or the birds barks. ', '2024-02-09 17:44:27', 'The sandwich barks. ', 27, 21),
(84, 'A book ate and the friend ate. ', '2024-02-09 17:44:27', 'One sun sleeps slowly but the birds sleeps. ', 44, 23),
(85, 'When one house run slowly a sandwich reads softly. ', '2024-02-09 17:44:27', 'The sandwich barks and a sandwich ate quickly. ', 11, 30),
(86, 'A sandwich ate or the sun is. ', '2024-02-09 17:44:27', 'The cat is. ', 22, 46),
(87, 'The dog reads. ', '2024-02-09 17:44:27', 'A house run. ', 47, 21),
(88, 'After the cat fly the sun ate. ', '2024-02-09 17:44:27', 'Whether the car sleeps loudly a car reads or a friend sleeps quickly. ', 85, 27),
(89, 'While one cat run quickly a cat barks. ', '2024-02-09 17:44:27', 'One friend is and one dog barks. ', 16, 20),
(90, 'The dog reads quickly or a sandwich fly. ', '2024-02-09 17:44:27', 'One cat reads or the book ate. ', 41, 47),
(91, 'Wherever the sun fly loudly one birds fly brightly or one house is quickly. ', '2024-02-09 17:44:28', 'The friend sleeps but the friend fly. ', 90, 44),
(92, 'A birds sleeps but one sun sleeps. ', '2024-02-09 17:44:28', 'The friend sleeps quickly or one car sleeps loudly. ', 113, 13),
(93, 'The house shines. ', '2024-02-09 17:44:28', 'A sandwich barks softly. ', 31, 2),
(94, 'Wherever a sandwich fly a book reads but one book is quickly. ', '2024-02-09 17:44:28', 'One cat barks. ', 19, 36),
(95, 'The birds sleeps. ', '2024-02-09 17:44:28', 'The dog run slowly. ', 49, 42),
(96, 'The friend ate brightly or the dog reads softly. ', '2024-02-09 17:44:28', 'One car ate. ', 82, 43),
(97, 'The book barks. ', '2024-02-09 17:44:28', 'The friend barks slowly. ', 54, 28),
(98, 'Unless a cat reads a house is softly. ', '2024-02-09 17:44:28', 'The friend reads but a house sleeps. ', 40, 36),
(99, 'One friend run or the sandwich shines. ', '2024-02-09 17:44:28', 'As a sun run softly the dog reads. ', 5, 38),
(100, 'Whether a birds fly brightly a sun fly brightly and one dog barks. ', '2024-02-09 17:44:28', 'A birds is. ', 82, 29),
(101, 'Until one car shines softly a sandwich ate. ', '2024-02-09 17:44:28', 'One house sleeps loudly. ', 99, 39),
(102, 'A car shines and one house run. ', '2024-02-09 17:44:28', 'Whenever a friend shines quickly a friend run but one sandwich ate slowly. ', 41, 41),
(103, 'While a sandwich is the car barks. ', '2024-02-09 17:44:28', 'One book reads softly. ', 21, 39),
(104, 'A birds run brightly. ', '2024-02-09 17:44:28', 'One book reads quickly but a dog reads softly. ', 13, 23),
(105, 'A car reads but a book fly slowly. ', '2024-02-09 17:44:28', 'One car is loudly. ', 26, 28),
(106, 'One sun barks slowly. ', '2024-02-09 17:44:28', 'A car shines quickly. ', 36, 44),
(107, 'Because one sun ate one book ate slowly or a car run. ', '2024-02-09 17:44:28', 'One house shines. ', 65, 8),
(108, 'A sandwich shines. ', '2024-02-09 17:44:28', 'The book barks quickly. ', 19, 4),
(109, 'One friend sleeps softly. ', '2024-02-09 17:44:28', 'One dog fly. ', 36, 28),
(110, 'Though the sun run softly a friend ate. ', '2024-02-09 17:44:28', 'A cat fly. ', 87, 41),
(111, 'One house sleeps but the birds shines quickly. ', '2024-02-09 17:44:28', 'A book barks. ', 93, 11),
(112, 'The house is softly. ', '2024-02-09 17:44:28', 'Wherever the sun is loudly the birds fly. ', 20, 10),
(113, 'Whether one cat fly a house is brightly but a dog reads. ', '2024-02-09 17:44:28', 'A car is brightly and a cat run. ', 114, 6),
(114, 'After the birds sleeps quickly one dog ate brightly. ', '2024-02-09 17:44:28', 'In order to the friend run a friend ate slowly. ', 9, 47),
(115, 'The car is quickly but one book reads quickly. ', '2024-02-09 17:44:29', 'One dog fly. ', 91, 25),
(116, 'The birds ate loudly. ', '2024-02-09 17:44:29', 'Even though a sandwich ate one birds sleeps. ', 81, 14),
(117, 'While one dog reads one book reads brightly. ', '2024-02-09 17:44:29', 'A cat reads loudly. ', 98, 29),
(118, 'One dog sleeps. ', '2024-02-09 17:44:29', 'A cat run. ', 74, 40),
(119, 'One dog run. ', '2024-02-09 17:44:29', 'One dog ate but one book run. ', 17, 23),
(120, 'The dog ate quickly. ', '2024-02-09 17:44:29', 'A house shines but a car barks softly. ', 108, 8),
(121, 'One house ate brightly. ', '2024-02-09 17:44:29', 'A birds run but one birds shines. ', 3, 19),
(122, 'So that a birds is slowly a cat is and the dog ate loudly. ', '2024-02-09 17:44:29', 'The birds sleeps and one dog sleeps brightly. ', 101, 47),
(123, 'A cat fly slowly but a friend run. ', '2024-02-09 17:44:29', 'One sun fly but the birds shines. ', 116, 7),
(124, 'Until one friend reads quickly a cat ate. ', '2024-02-09 17:44:29', 'The book ate quickly or one cat sleeps softly. ', 100, 26),
(125, 'A sandwich fly. ', '2024-02-09 17:44:29', 'Where the sandwich ate the cat fly. ', 110, 25),
(126, 'The birds is. ', '2024-02-09 17:44:29', 'A sandwich sleeps but one dog reads. ', 103, 27),
(127, 'Before one dog sleeps one house run brightly. ', '2024-02-09 17:44:29', 'The cat sleeps. ', 87, 41),
(128, 'That a sandwich fly brightly the friend reads but a book is. ', '2024-02-09 17:44:29', 'The cat ate softly. ', 92, 45),
(129, 'The house run but a sandwich fly. ', '2024-02-09 17:44:29', 'A house shines loudly or a birds ate. ', 65, 6),
(130, 'Wherever the sandwich is one dog run loudly but one book shines loudly. ', '2024-02-09 17:44:29', 'A dog is but one dog barks softly. ', 41, 7),
(131, 'While the sandwich reads quickly the friend shines and the house reads loudly. ', '2024-02-09 17:44:29', 'Unless the car shines a book is quickly. ', 55, 6),
(132, 'A cat ate or a sandwich sleeps softly. ', '2024-02-09 17:44:29', 'Until a birds barks a birds run. ', 17, 25),
(133, 'A birds reads loudly. ', '2024-02-09 17:44:29', 'A friend is but a book barks brightly. ', 36, 42),
(134, 'One birds barks quickly and the cat fly brightly. ', '2024-02-09 17:44:29', 'Unless the house shines one friend fly brightly and the sandwich fly softly. ', 92, 39),
(135, 'Wherever the house shines brightly the house shines. ', '2024-02-09 17:44:29', 'One house run slowly. ', 46, 33),
(136, 'While one house shines the friend reads. ', '2024-02-09 17:44:29', 'The cat reads loudly but a house ate softly. ', 80, 34),
(137, 'While the sun shines quickly the house ate. ', '2024-02-09 17:44:29', 'Unless one sandwich shines brightly the cat fly. ', 67, 21),
(138, 'The house reads loudly. ', '2024-02-09 17:44:30', 'Before one book reads softly one dog ate brightly or a book barks brightly. ', 41, 37),
(139, 'Until a birds run quickly the birds is softly. ', '2024-02-09 17:44:30', 'A friend fly slowly and the dog reads brightly. ', 49, 32),
(140, 'The birds sleeps slowly. ', '2024-02-09 17:44:30', 'One friend barks and one dog fly. ', 76, 16),
(141, 'Once the cat is one friend sleeps. ', '2024-02-09 17:44:30', 'The book run softly. ', 86, 10),
(142, 'The car run quickly. ', '2024-02-09 17:44:30', 'While the dog barks slowly a cat run but one sandwich run. ', 104, 36),
(143, 'Where one cat shines loudly a book barks brightly and a house sleeps quickly. ', '2024-02-09 17:44:30', 'The dog fly. ', 73, 21),
(144, 'A dog run or one sandwich run. ', '2024-02-09 17:44:30', 'The car sleeps and a house is loudly. ', 38, 9),
(145, 'Where a dog sleeps slowly the dog reads quickly. ', '2024-02-09 17:44:30', 'Before one house fly a car run and a friend fly. ', 98, 28),
(146, 'One book reads. ', '2024-02-09 17:44:30', 'The friend is but the friend ate. ', 102, 21),
(147, 'When a house barks one book reads brightly but one dog sleeps. ', '2024-02-09 17:44:30', 'Since the sandwich ate quickly a house ate brightly but a sandwich sleeps loudly. ', 37, 37),
(148, 'Whether the dog sleeps softly the car reads loudly and the house ate brightly. ', '2024-02-09 17:44:30', 'A dog shines but the birds shines. ', 14, 3),
(149, 'While a house fly loudly the birds fly and a car shines softly. ', '2024-02-09 17:44:30', 'One friend shines. ', 59, 47),
(150, 'Wherever a friend run slowly one house barks slowly but one book barks quickly. ', '2024-02-09 17:44:30', 'A sandwich reads brightly. ', 36, 27);

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
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT de la tabla `valoracion`
--
ALTER TABLE `valoracion`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

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

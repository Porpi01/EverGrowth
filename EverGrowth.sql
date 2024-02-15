-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: database:3306
-- Tiempo de generación: 15-02-2024 a las 10:20:34
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
(1, 1, 5, 34),
(2, 1, 7, 32),
(3, 1, 16, 33),
(4, 1, 19, 24),
(5, 1, 20, 43),
(6, 1, 10, 39),
(7, 1, 8, 38),
(9, 1, 20, 4),
(10, 1, 22, 4),
(11, 3, 2, 1);

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
(20, 'Cereales', 'http://localhost:8085/media/default.jpg'),
(21, 'Repostería', 'http://localhost:8085/media/default.jpg'),
(22, 'Congelados', 'http://localhost:8085/media/default.jpg'),
(23, 'Cereales', 'http://localhost:8085/media/default.jpg'),
(24, 'Lácteos', 'http://localhost:8085/media/default.jpg'),
(25, 'Repostería', 'http://localhost:8085/media/default.jpg'),
(26, 'Panadería', 'http://localhost:8085/media/default.jpg'),
(27, 'Legumbres', 'http://localhost:8085/media/default.jpg'),
(28, 'Legumbres', 'http://localhost:8085/media/default.jpg'),
(29, 'Frutas y Verduras', 'http://localhost:8085/media/default.jpg'),
(30, 'Carnes', 'http://localhost:8085/media/default.jpg'),
(31, 'Pescado y Marisco', 'http://localhost:8085/media/default.jpg'),
(32, 'Repostería', 'http://localhost:8085/media/default.jpg'),
(33, 'Enlatados', 'http://localhost:8085/media/default.jpg'),
(34, 'Cereales', 'http://localhost:8085/media/default.jpg'),
(35, 'Pasta', 'http://localhost:8085/media/default.jpg'),
(36, 'Conservas', 'http://localhost:8085/media/default.jpg'),
(37, 'Frutas y Verduras', 'http://localhost:8085/media/default.jpg'),
(38, 'Frutas y Verduras', 'http://localhost:8085/media/default.jpg'),
(39, 'Pescado y Marisco', 'http://localhost:8085/media/default.jpg'),
(40, 'Frutas y Verduras', 'http://localhost:8085/media/default.jpg'),
(41, 'Arroz', 'http://localhost:8085/media/default.jpg'),
(42, 'Bebidas', 'http://localhost:8085/media/default.jpg'),
(43, 'Arroz', 'http://localhost:8085/media/default.jpg'),
(44, 'Conservas', 'http://localhost:8085/media/default.jpg'),
(45, 'Pasta', 'http://localhost:8085/media/default.jpg'),
(46, 'Pescado y Marisco', 'http://localhost:8085/media/default.jpg'),
(47, 'Enlatados', 'http://localhost:8085/media/default.jpg'),
(48, 'Legumbres', 'http://localhost:8085/media/default.jpg'),
(49, 'Arroz', 'http://localhost:8085/media/default.jpg'),
(50, 'Bebidas', 'http://localhost:8085/media/default.jpg'),
(51, 'Conservas', 'http://localhost:8085/media/default.jpg'),
(52, 'Arroz', 'http://localhost:8085/media/default.jpg'),
(53, 'Enlatados', 'http://localhost:8085/media/default.jpg'),
(54, 'Frutas y Verduras', 'http://localhost:8085/media/default.jpg'),
(55, 'Enlatados', 'http://localhost:8085/media/default.jpg'),
(56, 'Legumbres', 'http://localhost:8085/media/default.jpg'),
(57, 'Congelados', 'http://localhost:8085/media/default.jpg'),
(58, 'Legumbres', 'http://localhost:8085/media/default.jpg'),
(59, 'Lácteos', 'http://localhost:8085/media/default.jpg'),
(60, 'Lácteos', 'http://localhost:8085/media/default.jpg'),
(61, 'Frutas y Verduras', 'http://localhost:8085/media/default.jpg'),
(62, 'Lácteos', 'http://localhost:8085/media/default.jpg'),
(63, 'Lácteos', 'http://localhost:8085/media/default.jpg'),
(64, 'Arroz', 'http://localhost:8085/media/default.jpg'),
(65, 'Congelados', 'http://localhost:8085/media/default.jpg'),
(66, 'Pescado y Marisco', 'http://localhost:8085/media/default.jpg'),
(67, 'Carnes', 'http://localhost:8085/media/default.jpg'),
(68, 'Carnes', 'http://localhost:8085/media/default.jpg'),
(69, 'Enlatados', 'http://localhost:8085/media/default.jpg'),
(70, 'Enlatados', 'http://localhost:8085/media/default.jpg');

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
(24, 1, 2.07, 1, 22),
(25, 1, 2.07, 1, 33),
(26, 10, 0.25, 9, 1);

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
(1, '2024-02-13 17:09:38', '2025-05-22 21:27:43', 0, 2, 0),
(2, '2024-02-13 17:17:03', '2026-01-10 15:36:22', 0, 2, 0),
(5, '2024-02-13 19:44:43', '2026-02-22 08:40:31', 0, 2, 0),
(6, '2024-02-13 19:53:21', '2024-02-15 23:10:34', 0, 2, 0),
(7, '2024-02-13 19:54:22', '2024-05-15 23:12:58', 0, 2, 0),
(8, '2024-02-13 19:54:37', '2026-12-18 21:13:06', 0, 3, 0),
(9, '2024-02-14 11:34:53', '2024-04-01 21:12:21', 0, 2, 0),
(10, '2024-02-14 11:35:03', '2025-12-25 08:37:42', 0, 2, 0),
(11, '2024-02-14 11:50:08', '2026-10-05 03:04:39', 0, 2, 0),
(12, '2024-02-14 11:55:31', '2026-01-26 07:43:04', 0, 2, 0),
(13, '2024-02-14 12:15:59', '2025-12-28 18:10:47', 0, 2, 0),
(14, '2024-02-14 12:16:12', '2026-08-26 15:32:38', 0, 2, 0),
(15, '2024-02-14 12:17:50', '2025-07-05 20:57:49', 0, 2, 0),
(16, '2024-02-14 12:28:57', '2025-11-01 13:08:21', 0, 2, 0),
(17, '2024-02-14 12:29:33', '2025-12-29 13:28:49', 0, 2, 0),
(18, '2024-02-14 12:33:27', '2025-10-17 13:10:44', 0, 2, 0),
(19, '2024-02-14 12:36:57', '2025-11-30 13:38:43', 0, 2, 0),
(20, '2024-02-14 13:58:07', '2026-07-09 08:55:37', 0, 2, 0),
(21, '2024-02-14 14:02:17', '2025-10-30 11:29:32', 0, 2, 0),
(22, '2024-02-14 18:20:22', '2026-10-15 09:40:45', 0, 2, 0),
(23, '2024-02-14 18:26:05', '2025-08-23 22:26:01', 0, 21, 0),
(24, '2024-02-14 18:26:05', '2024-02-02 08:51:08', 0, 14, 0),
(25, '2024-02-14 18:26:05', '2025-01-12 10:59:54', 0, 16, 0),
(26, '2024-02-14 18:26:05', '2026-10-20 22:49:22', 0, 9, 0),
(27, '2024-02-14 18:26:05', '2026-01-06 23:17:59', 0, 14, 0),
(28, '2024-02-14 18:26:05', '2026-10-08 02:37:15', 0, 22, 0),
(29, '2024-02-14 18:26:05', '2024-05-21 11:04:42', 0, 21, 0),
(30, '2024-02-14 18:26:05', '2025-12-07 14:38:59', 0, 8, 0),
(31, '2024-02-14 18:26:05', '2026-07-26 00:12:03', 0, 17, 0),
(32, '2024-02-14 18:26:05', '2026-07-28 23:51:07', 0, 1, 0),
(33, '2024-02-14 18:30:11', '2025-05-02 23:42:59', 0, 2, 0);

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
(1, 'Manzana', 2.07, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 0, 'http://localhost:8085/media/manzana.jpg', 3),
(2, 'Kiwi', 6.87, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 65, 'http://localhost:8085/media/default.jpg', 26),
(3, 'Melón', 4.92, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 48, 'http://localhost:8085/media/default.jpg', 65),
(4, 'Papaya', 5.35, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 29, 'http://localhost:8085/media/default.jpg', 69),
(5, 'Kiwi', 1.85, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 81, 'http://localhost:8085/media/default.jpg', 33),
(6, 'Fresa', 5.97, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 7, 'http://localhost:8085/media/default.jpg', 17),
(7, 'Kiwi', 4.79, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 0, 'http://localhost:8085/media/default.jpg', 43),
(8, 'Naranja', 4.06, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 48, 'http://localhost:8085/media/default.jpg', 17),
(9, 'Plátano', 6.51, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 0, 'http://localhost:8085/media/default.jpg', 4),
(10, 'Plátano', 3.31, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 17, 'http://localhost:8085/media/default.jpg', 37),
(11, 'Manzana', 5.61, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 87, 'http://localhost:8085/media/default.jpg', 64),
(12, 'Manzana', 6.64, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 48, 'http://localhost:8085/media/default.jpg', 63),
(13, 'Melón', 2.78, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 43, 'http://localhost:8085/media/default.jpg', 55),
(14, 'Uva', 5.07, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 29, 'http://localhost:8085/media/default.jpg', 29),
(15, 'Melón', 2.91, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 31, 'http://localhost:8085/media/default.jpg', 52),
(16, 'Melón', 4.92, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 20, 'http://localhost:8085/media/default.jpg', 1),
(17, 'Melón', 2.49, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 31, 'http://localhost:8085/media/default.jpg', 9),
(18, 'Pera', 4.06, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 81, 'http://localhost:8085/media/default.jpg', 18),
(19, 'Naranja', 6.46, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 79, 'http://localhost:8085/media/default.jpg', 33),
(20, 'Kiwi', 2.63, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 18, 'http://localhost:8085/media/default.jpg', 26),
(21, 'Uva', 5.39, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 61, 'http://localhost:8085/media/default.jpg', 20),
(22, 'Melón', 4.7, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 85, 'http://localhost:8085/media/default.jpg', 17),
(23, 'Plátano', 6.58, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 37, 'http://localhost:8085/media/default.jpg', 35),
(24, 'Uva', 5.05, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 36, 'http://localhost:8085/media/default.jpg', 35),
(25, 'Melón', 2.26, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 77, 'http://localhost:8085/media/default.jpg', 65),
(26, 'Melón', 3.29, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 66, 'http://localhost:8085/media/default.jpg', 1),
(27, 'Manzana', 4.57, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 75, 'http://localhost:8085/media/default.jpg', 35),
(28, 'Fresa', 6.06, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 0, 'http://localhost:8085/media/default.jpg', 5),
(29, 'Papaya', 4.81, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 95, 'http://localhost:8085/media/default.jpg', 46),
(30, 'Manzana', 2.34, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 81, 'http://localhost:8085/media/default.jpg', 45),
(31, 'Kiwi', 6.25, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 37, 'http://localhost:8085/media/default.jpg', 24),
(32, 'Sandía', 4.26, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 85, 'http://localhost:8085/media/default.jpg', 62),
(33, 'Kiwi', 6.01, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 93, 'http://localhost:8085/media/default.jpg', 5),
(34, 'Uva', 5.23, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 28, 'http://localhost:8085/media/default.jpg', 32),
(35, 'Uva', 5.8, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 7, 'http://localhost:8085/media/default.jpg', 52),
(36, 'Naranja', 6.12, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 83, 'http://localhost:8085/media/default.jpg', 16),
(37, 'Pera', 6.58, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 86, 'http://localhost:8085/media/default.jpg', 67),
(38, 'Melón', 1.63, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 96, 'http://localhost:8085/media/default.jpg', 67),
(39, 'Manzana', 6.34, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 57, 'http://localhost:8085/media/default.jpg', 3),
(40, 'Kiwi', 2.06, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 6, 'http://localhost:8085/media/default.jpg', 39),
(41, 'Kiwi', 1.75, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 16, 'http://localhost:8085/media/default.jpg', 16),
(42, 'Sandía', 1.65, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 37, 'http://localhost:8085/media/default.jpg', 51),
(43, 'Naranja', 6.04, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 69, 'http://localhost:8085/media/default.jpg', 24),
(44, 'Sandía', 2.76, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 55, 'http://localhost:8085/media/default.jpg', 2),
(45, 'Kiwi', 6.28, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 6, 'http://localhost:8085/media/default.jpg', 59),
(46, 'Sandía', 3.73, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 81, 'http://localhost:8085/media/default.jpg', 33),
(47, 'Papaya', 4.07, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 52, 'http://localhost:8085/media/default.jpg', 15),
(48, 'Naranja', 2.5, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 81, 'http://localhost:8085/media/default.jpg', 44),
(49, 'Plátano', 5.35, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 27, 'http://localhost:8085/media/default.jpg', 55),
(50, 'Melón', 3.54, 'Disfruta de la frescura y el sabor incomparables de nuestros productos. Una experiencia gastronómica que no olvidarás.', 28, 'http://localhost:8085/media/default.jpg', 18);

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
(3, 'Elena', 'Ortega', 'Gosling', 'elana@gamil.com', '322323112', 'Calle MAyor de mi casa', 'elenanito', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(4, 'Pablo', 'Jiménez', 'Ramos', 'pabjimra0@gmail.com', '643761610', 'Avenida Gran Vía de Colón,Ciudad Real,13001', 'pabima0', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(5, 'Lucía', 'Serrano', 'Flores', 'lucserfl1@gmail.com', '699143718', 'Paseo de la Independencia,Ourense,32001', 'lucerl1', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(6, 'Catalina', 'Santos', 'Sánchez', 'catsansa2@gmail.com', '626905038', 'Paseo de la Alameda,Barcelona,08001', 'catana2', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(7, 'Tomás', 'Torres', 'García', 'tomtorga3@gmail.com', '664372285', 'Calle de la Princesa,Ávila,05001', 'tomora3', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(8, 'Paula', 'Hernández', 'Díaz', 'pauherdi4@gmail.com', '652921848', 'Calle Fuencarral,Castellón,12001', 'paueri4', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(9, 'Sofía', 'López', 'Delgado', 'soflopde5@gmail.com', '622973523', 'Paseo de la Independencia,Lugo,27001', 'sofope5', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(10, 'Emilio', 'Flores', 'Ramírez', 'emiflora6@gmail.com', '693794633', 'Avenida de la Victoria,Madrid,28001', 'emiloa6', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(11, 'Paula', 'Reyes', 'Delgado', 'paureyde7@gmail.com', '679454067', 'Calle del Príncipe,Huelva,21001', 'paueye7', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(12, 'Pablo', 'Flores', 'Cruz', 'pabflocr8@gmail.com', '607066029', 'Calle Fuencarral,Tarragona,43001', 'pablor8', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(13, 'Sofía', 'Flores', 'González', 'sofflogo9@gmail.com', '682390223', 'Calle del Prado,Toledo,45001', 'sofloo9', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(14, 'Elena', 'Ruiz', 'Gómez', 'eleruigo0@gmail.com', '697836999', 'Calle del Marqués de Larios,Alicante,03001', 'eleuio0', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(15, 'Julián', 'Ramos', 'Rojas', 'julramro1@gmail.com', '635132918', 'Paseo de la Estación,Navarra,31001', 'julamo1', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(16, 'Isabella', 'Santos', 'Flores', 'isasanfl2@gmail.com', '661701268', 'Paseo de Recoletos,León,24001', 'isaanl2', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(17, 'Javier', 'Sánchez', 'Ramírez', 'javsanra3@gmail.com', '616967606', 'Calle Real,Girona,17001', 'javana3', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(18, 'Adrián', 'Morales', 'López', 'adrmorlo4@gmail.com', '678441895', 'Calle del Arenal,Barcelona,08001', 'adroro4', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(19, 'María', 'Ortega', 'Serrano', 'marortse5@gmail.com', '622191574', 'Calle de la Paz,Burgos,09001', 'marrte5', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(20, 'Javier', 'Martínez', 'Santos', 'javmarsa6@gmail.com', '642396801', 'Paseo de Recoletos,Cádiz,11001', 'javara6', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(21, 'Julián', 'Alvarez', 'Blanco', 'julalvbl7@gmail.com', '672937346', 'Paseo de la Habana,Almería,04001', 'jullvl7', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(22, 'Paula', 'Santos', 'Ortega', 'pausanor8@gmail.com', '669159767', 'Avenida Gran Vía de Colón,S.C.Tenerife,38001', 'pauanr8', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1),
(23, 'Clara', 'Delgado', 'Gómez', 'cladelgo9@gmail.com', '619340309', 'Calle del Príncipe,Coruña,15001', 'claelo9', 'dedb63fbd1f3c4bce46a6e29be0700dda4fe2eec46c79b79fa0c5704d96e308d', 1);

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
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `valoracion`
--
ALTER TABLE `valoracion`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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

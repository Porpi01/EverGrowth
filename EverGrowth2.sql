-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: database:3306
-- Tiempo de generación: 22-02-2024 a las 08:22:28
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
(24, 1, 1, 4),
(25, 1, 24, 23),
(26, 1, 25, 25),
(27, 1, 22, 48),
(28, 1, 15, 48),
(29, 1, 31, 38),
(30, 1, 44, 34),
(31, 1, 18, 35),
(32, 1, 26, 42),
(33, 1, 49, 11),
(34, 12312, 1, 2),
(57, 1, 2, 1);

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
  `id_pedido` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id`, `cantidad`, `precio_unitario`, `id_producto`, `id_pedido`) VALUES
(51, 4, 5.95, 1, 52),
(52, 12, 0.45, 38, 44),
(53, 12, 0.45, 29, 41),
(54, 12, 0.45, 13, 6),
(55, 12, 0.45, 29, 7),
(56, 12, 0.45, 19, 10),
(57, 12, 0.45, 45, 35),
(58, 12, 0.45, 30, 44),
(59, 12, 0.45, 44, 18),
(60, 12, 0.45, 48, 47),
(61, 12, 0.45, 7, 50),
(62, 3, 6.55, 1, 53),
(63, 4, 9.25, 2, 54),
(64, 10, 6.55, 1, 55),
(65, 3, 1.65, 62, 56),
(66, 1, 3.8, 86, 57),
(67, 2, 6.55, 1, 58);

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
(1, '2024-02-15 19:46:39', '2024-12-07 19:13:04', 1, 15, 0),
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
(58, '2024-02-21 18:43:57', '2025-05-13 22:25:28', 0, 2, 0);

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
(1, 'Melón piel de sapo', 6.55, 'Pieza 3,29 kg aprox. | 1,99 €/kg\n', 59, 'http://localhost:8085/media/Melon-piel-de-sapo-scaled-removebg-preview.png', 11),
(2, 'Aceite de oliva ', 9.25, 'Botella 1 L | 9,25 €/L\n', 11, 'http://localhost:8085/media/aceite_de_oliva-removebg-preview.png', 1),
(3, 'Aceite de oliva virgen extra ', 30.05, 'Garrafa 3 L | 9,85 €/L\n', 67, 'http://localhost:8085/media/47462fdf4c69501eca44008787e692f1.1500.0.0.0.wmark.16a6be34-removebg-preview.png', 1),
(4, 'Aceite de coco Bio sin gluten', 1.85, '200 ml', 100, 'http://localhost:8085/media/fabecd59a0f4f5675a27c641ffcf0968-removebg-preview.png', 1),
(5, 'Sal marina fina Ecológica', 1.55, 'Paquete 1 kg \n', 93, 'http://localhost:8085/media/ef459cff083630ec6303fce7c8cfacbe-removebg-preview.png', 1),
(6, 'Ajo negro Bio', 14.49, '200 g\n', 96, 'http://localhost:8085/media/3f45ce5ee9912537734d2b4c34faed71-removebg-preview.png', 1),
(7, 'Kiwi', 4.55, '600 g\n', 90, 'http://localhost:8085/media/un-kiwi-entero-y-corte-transversal-de-un-kiwi-removebg-preview.png', 11),
(8, 'Kéfir de cabra', 0.9, '125 g\n', 62, 'http://localhost:8085/media/kefir.jpg', 12),
(9, 'Leche de vaca entera Bio', 4, '1 L\n', 53, 'http://localhost:8085/media/LECHE-DE-VACA-ENTERA-1-LITRO-BIO.jpg', 12),
(10, 'Uva', 2.55, 'Bandeja 500 g aprox. | 5,10 €/kg\n', 86, 'http://localhost:8085/media/34f97f866829fa8f999b91db806d2e59.1500.0.0.0.wmark.520d1022.jpg', 11),
(11, 'Mango', 2.66, 'Pieza 580 g aprox. | 4,59 €/kg\n', 72, 'http://localhost:8085/media/mango.jpg', 11),
(12, 'Piña', 3.38, 'Pieza 1,77 kg aprox. | 1,91 €/kg\n', 47, 'http://localhost:8085/media/pi%C3%B1a_g.jpg', 11),
(13, 'Fresa', 3.5, 'Bandeja 500 g aprox. | 6,50 €/kg\n', 28, 'http://localhost:8085/media/006_grufesa-scaled.jpg', 11),
(14, 'Limón', 0.41, 'Pieza 220 g aprox. | 1,85 €/kg\n', 54, 'http://localhost:8085/media/limon.jpg', 11),
(15, 'Kéfir natural', 1.4, 'Bote 500 g | 2,80 €/kg\n', 50, 'http://localhost:8085/media/f43bce8d2239178e647df38e73bba6d7.jpg', 12),
(16, 'Yogur griego natural', 1.6, '6 ud. x 125 g | 2,134 €/kg\n', 42, 'http://localhost:8085/media/1731845a4ad9c3f4ef1c9fe7ccdd2e78.1500.0.0.0.wmark.dda175fc.jpg', 12),
(17, 'Yogur griego ligero', 1.6, '6 ud. x 125 g | 2,134 €/kg\n', 40, 'http://localhost:8085/media/61a5b51a9ed495402f8c08319d52eb43.jpg', 12),
(18, 'Margarina Tulipán', 2.85, 'Tarrina 400 g | 7,125 €/kg\n', 50, 'http://localhost:8085/media/64c7c45cb7fa04615bc1b9307a2c2e61.jpg', 12),
(19, 'Mantequilla Tradicional Asturiana', 3.55, 'Tarrina 250 g | 14,20 €/kg\n', 50, 'http://localhost:8085/media/7864e402fc5ad9efefd6fa88fdcd5d06.jpg', 12),
(20, 'Leche semidesnatada Asturiana', 1.78, 'Botella 1,5 L | 1,187 €/L\n', 76, 'http://localhost:8085/media/3decd158f1621555b3437a6cfd957cd2%20(1).jpg', 12),
(21, 'Leche desnatada Hacendado', 5.1, '6 bricks x 1 L | 0,85 €/L\n', 22, 'http://localhost:8085/media/bcc466d81e86764089f614432848688c.jpg', 12),
(22, 'Huevos M', 2.2, 'Paquete 12 ud. | 2,00 €/dc\n', 22, 'http://localhost:8085/media/a0e27bd19713fda6b937a34e4220030c.jpg', 12),
(23, 'Jamón 5 jotas', 630.5, '7-8 kg (105,57 €/kg)', 12, 'http://localhost:8085/media/jamon-5j-sin-funda_1.png', 8),
(24, 'Tomate pera', 0.26, 'Pieza 130 g aprox. | 1,99 €/kg\n', 23, 'http://localhost:8085/media/4051b6d18af57694412b17590f539c83.jpg', 11),
(25, 'Tomate ensalada', 0.48, 'Pieza 210 g aprox. | 2,29 €/kg\n', 60, 'http://localhost:8085/media/ccb2b42ba2bb6a7b692dac6101074709.jpg', 11),
(26, 'Ajos morados', 1.55, 'Malla 250 g | 6,20 €/kg\n', 23, 'http://localhost:8085/media/6aef4488c873e4b8519b57151be424f3.jpg', 11),
(27, 'Cebollas', 2.39, 'Malla 1 kg | 2,39 €/kg\n', 20, 'http://localhost:8085/media/d950590e426dca5e9531e1ff2809edb4.jpg', 11),
(28, 'Patatas', 6.5, 'Malla 5 kg | 1,298 €/kg\n', 55, 'http://localhost:8085/media/70014f6f06e025d5483beba526dd3eca.1500.0.0.0.wmark.90fd9260.jpg', 11),
(29, 'Espinaca baby base ', 1.11, 'Paquete 100 g | 11,10 €/kg\n', 29, 'http://localhost:8085/media/b3f584e6738c26a262910ca00eec60cc.1500.0.0.0.wmark.d2f8fd3d.jpg', 11),
(30, 'Lechuga Iceberg', 0.99, 'Pieza 1 ud. | 0,99 €/ud\n', 81, 'http://localhost:8085/media/LECHUGA-ICEBERG-PREMIUM-WEB.jpg', 11),
(31, 'Aguacate', 0.91, 'Pieza 190 g aprox. | 4,79 €/kg\n', 98, 'http://localhost:8085/media/aguacate.jpg', 11),
(32, 'Peras Conferencia', 2.99, '1,5 kg aprox. | 1,99 €/kg\n', 33, 'http://localhost:8085/media/51032a014399414f057b3020a930bf6b.jpg', 11),
(33, 'Manzana Golden', 0.44, 'Pieza 210 g aprox. | 2,09 €/kg\n', 30, 'http://localhost:8085/media/MANZANA-GOLDEN-ECOLOGICO-COMEDELAHUERTA-1.jpg', 11),
(34, 'Banana', 0.32, 'Pieza 160 g aprox. | 1,99 €/kg\n', 49, 'http://localhost:8085/media/banane-large.jpg', 11),
(35, 'Tomate triturado ', 0.98, 'Bote 800 g | 1,225 €/kg\n', 42, 'http://localhost:8085/media/117a2a2230b103f17b50e07a73a8fc38.jpg', 10),
(36, 'Salmorejo al estilo cordobés', 2.7, '3 mini bricks x 330 ml | 2,728 €/L\n', 84, 'http://localhost:8085/media/45d29a820251b0fee87ea0dca426f56e.jpg', 10),
(37, 'Maíz dulce Hacendado', 1.7, '3 latas x 140 g | 4,048 €/kg\n', 92, 'http://localhost:8085/media/6dcc0658be139e0baa8d2ace004d0db9.1500.0.0.0.wmark.63124e93.jpg', 10),
(38, 'Atún en salsa de tomate', 2, '3 latas x 52 g | 12,821 €/kg\n', 80, 'http://localhost:8085/media/descarga%20(20).jpg', 10),
(39, 'Atún en aceite de girasol', 6.53, 'Lata 900 g (650 g escurrido) | 10,231 €/kg\n', 64, 'http://localhost:8085/media/descarga%20(19).jpg', 10),
(40, 'Salteado de setas', 1.65, 'Paquete 450 g | 3,667 €/kg\n', 20, 'http://localhost:8085/media/descarga%20(18).jpg', 9),
(41, 'Alcachofa troceada', 2.29, 'Paquete 400 g | 6,375 €/kg\n', 78, 'http://localhost:8085/media/descarga%20(17).jpg', 9),
(42, 'Verdura para paella', 0.91, 'Paquete 450 g | 2,023 €/kg\n', 61, 'http://localhost:8085/media/descarga%20(16).jpg', 9),
(43, 'Mix de frutos rojos ', 1.54, 'Paquete 300 g | 5,134 €/kg\n', 18, 'http://localhost:8085/media/descarga%20(15).jpg', 9),
(44, 'Tiras de potón ', 4.45, 'Paquete 400 g escurrido | 11,125 €/kg\n', 41, 'http://localhost:8085/media/4fdab476ef08c8dc8e5af196af075723.jpg', 9),
(45, 'Porciones de merluza', 4.6, 'Paquete 500 g | 9,20 €/kg\n', 26, 'http://localhost:8085/media/0973b5d35af7060489bc7b721c016859.1500.0.0.0.wmark.2deca110.jpg', 9),
(46, 'Calamar limpio troceado', 5.1, 'Paquete 475 g escurrido | 10,737 €/kg\n', 52, 'http://localhost:8085/media/2cc3e02c6e2005e3e6382faf4f166201.jpg', 9),
(47, 'Gambón grande ', 17.9, 'Caja 2 kg | 8,95 €/kg\n', 72, 'http://localhost:8085/media/4753fbb2fbe675c7e8dc349c5ecafcc5.jpg', 9),
(48, 'Preparado de paella y sopa', 3.95, 'Paquete 685 g escurrido | 5,767 €/kg\n', 99, 'http://localhost:8085/media/febeae95b5c6270d27c759b11d2b3d9d.jpg', 9),
(49, 'Gnocchi de pollo y verduras', 3.2, 'Paquete 600 g | 5,25 €/kg\n', 43, 'http://localhost:8085/media/6e25934ac65230dac50e5e895f5ef52d.jpg', 9),
(50, 'Arroz con pollo', 2.6, 'Paquete 600 g | 4,334 €/kg\n', 80, 'http://localhost:8085/media/57df1a959c4ce6a390383380ef0cdd62.jpg', 9),
(51, 'Queso untar light Philadelphia', 2.74, 'Tarrina 270 g | 10,149 €/kg\n', 57, 'http://localhost:8085/media/queso-de-untar-light-philadelphia-200-grs.jpg', 8),
(52, 'Queso untar suave', 1.29, 'Tarrina 300 g | 4,30 €/kg\n', 71, 'http://localhost:8085/media/18901ca537c8de2c4c77f69baf4ee430.jpg', 8),
(53, 'Queso lonchas havarti ', 1.76, 'Paquete 300 g | 9,334 €/kg\n', 32, 'http://localhost:8085/media/5ffe5f32e5ba97b48e07237242e7434f.jpg', 8),
(54, 'Queso viejo tostado', 21.16, 'Pieza 1,64 kg aprox. | 12,90 €/kg\n', 81, 'http://localhost:8085/media/32e869fe42d40bdd832b1892b9c6d634.1500.0.0.0.wmark.08ac22ed.jpg', 8),
(55, 'Paté de cerdo La Piara', 3.95, '3 latas x 87 g | 15,135 €/kg\n', 48, 'http://localhost:8085/media/descarga%20(14).jpg', 8),
(56, 'Jamón serrano', 4.06, 'Paquete 240 g | 17,084 €/kg\n', 64, 'http://localhost:8085/media/jamon-loncheado.jpg', 8),
(57, 'Pechuga de pollo braseada', 2.15, 'Paquete 200 g | 10,75 €/kg\n', 45, 'http://localhost:8085/media/b820db2d721ffe6c0b9f802964b5e534.jpg', 8),
(58, 'Longaniza de pavo extra ', 2.15, '4 paquetes x 31,25 g | 19,04 €/kg\n', 30, 'http://localhost:8085/media/4aa358adbefee358a6b0af97771c1f3b.jpg', 8),
(59, 'Salchichón de pavo', 2.38, '4 paquetes x 37,5 g | 15,867 €/kg\n', 64, 'http://localhost:8085/media/b98c684f52d2fef684676edd1ae0fd55.jpg', 8),
(60, 'Pechuga de pavo', 3.37, '2 paquetes x 200 g | 8,425 €/kg\n', 33, 'http://localhost:8085/media/74891ddb596961b20083d6aa350e4e3f.1500.0.0.0.wmark.cabb6808.jpg', 8),
(61, 'Cereales Cereal Mix', 2.4, 'Paquete 375 g | 6,40 €/kg\n', 79, 'http://localhost:8085/media/0d4421191a507c14b90aba79d36af817.jpg', 7),
(62, 'Salvado de avena', 1.65, 'Paquete 500 g | 3,30 €/kg\n', 73, 'http://localhost:8085/media/bbb42fa3fd5ef29145d65b3f77c455b0.jpg', 7),
(63, 'Cereales Chocapic', 3.95, 'Caja 625 g | 6,32 €/kg\n', 94, 'http://localhost:8085/media/3b3dbcdf058ee6c78ea289786f4a20c7.1500.0.0.0.wmark.498acc2d.jpg', 7),
(64, 'Lomo de vacuno ', 9.1, 'Bandeja 500 g aprox. | 18,20 €/kg\n', 35, 'http://localhost:8085/media/6e57aa4f455c93f71ccd9979665dc0a6.jpg', 6),
(65, 'Burger de pavo y espinacas', 2.37, 'Bandeja 2 ud. (240 g) | 9,875 €/kg\n', 82, 'http://localhost:8085/media/hamburguesa_de_pavo_y_espinacas_de_mercadona_1jpg.jpg', 6),
(66, 'Burger de vacuno y cerdo', 3.78, 'Bandeja 6 ud. (540 g) | 7,00 €/kg\n', 43, 'http://localhost:8085/media/0577c62326ff63a9640d76100b5205aa.jpg', 6),
(67, 'Embutido surtido ', 3.88, 'Bandeja 500 g aprox. | 7,75 €/kg\n', 30, 'http://localhost:8085/media/ed857272df34b6e7301ba2f1c0c1624c.1500.0.0.0.wmark.d402a70e.jpg', 6),
(68, 'Longaniza magro', 3.37, 'Bandeja 535 g aprox. | 6,30 €/kg\n', 29, 'http://localhost:8085/media/30002825e006dec2b6a4820d73b3ff44.1500.0.0.0.wmark.ba900b4b.jpg', 6),
(69, 'Filetes lomo', 2.84, 'Bandeja 400 g aprox. | 7,09 €/kg\n', 25, 'http://localhost:8085/media/0a71aa37bf8f2c71a5ab7dbc5965e6f6.1500.0.0.0.wmark.2373f2d9.jpg', 6),
(70, 'Trozo de vacuno', 3.84, 'Bandeja 300 g aprox. | 12,79 €/kg\n', 14, 'http://localhost:8085/media/23e5004af98d8c62a4a3b927e2144be9.jpg', 6),
(71, 'Arreglo para puchero', 5.51, 'Bandeja 1 kg aprox. | 5,40 €/kg\n', 17, 'http://localhost:8085/media/bc163ece659b8172611657c8dd05a9ca.jpg', 6),
(72, 'Vino tinto Masía de Altigón', 5.55, 'Garrafa 5 L | 1,11 €/L\n', 41, 'http://localhost:8085/media/f55a3ab59b12ce2360a34fde5fad524a.jpg', 5),
(73, 'Vino blanco D.O La Mancha Fidencio', 1.4, 'Botella 750 ml | 1,867 €/L\n', 87, 'http://localhost:8085/media/4b0c85794ac74c575f28478ec9bb9c15.jpg', 5),
(74, 'Vino blanco D.O Rioja El Coto', 4.15, 'Botella 750 ml | 5,534 €/L\n', 25, 'http://localhost:8085/media/48777.jpg', 5),
(75, 'Sidra asturiana El Mayu', 1.5, 'Botella 750 ml | 2,00 €/L\n', 46, 'http://localhost:8085/media/Sidra_asturiana_el_mayu-removebg-preview.png', 5),
(76, 'Ginebra London Dry Gin Beefeater', 13.95, 'Botella 700 ml | 19,929 €/L\n', 90, 'http://localhost:8085/media/beefeater-london-dry-gin.jpg', 5),
(77, 'Aperitivo de café Cerol', 5.9, 'Botella 1 L | 5,90 €/L\n', 73, 'http://localhost:8085/media/descarga%20(13).jpg', 5),
(78, 'Cerveza tostada Turia', 4.86, '6 latas x 330 ml | 2,455 €/L\n', 19, 'http://localhost:8085/media/81+CvhVt7mS._AC_UF894,1000_QL80_.jpg', 5),
(79, 'Mermelada de tomate', 1.7, 'Tarro 440 g | 3,864 €/kg\n', 95, 'http://localhost:8085/media/273d8973b6598b41ecf1706237844671.jpg', 4),
(80, 'Mermelada de fresa', 1.55, 'Tarro 400 g | 3,875 €/kg\n', 36, 'http://localhost:8085/media/14a0bc5a0acebe6eda1df1e36d914c27.jpg', 4),
(81, 'Nutella', 3.69, 'Tarro 350 g | 10,543 €/kg\n', 26, 'http://localhost:8085/media/descarga%20(14).jpg', 4),
(82, 'Chocolate con leche Fussion', 1.05, 'Tableta 110 g | 9,546 €/kg\n', 28, 'http://localhost:8085/media/6e4ccc56e05bd6ea02a31c55f109b993.jpg', 4),
(83, 'Chocolate con leche Valor almendras enteras', 3.9, 'Tableta 250 g | 15,60 €/kg\n', 56, 'http://localhost:8085/media/con-leche-almendras.png', 4),
(84, 'Chocolate con leche Oreo Milka', 1.55, 'Tableta 100 g | 15,50 €/kg\n', 19, 'http://localhost:8085/media/00120646700896____27__600x600.jpg', 4),
(85, 'Chocolate negro Fussion', 1.05, 'Tableta 95 g | 11,053 €/kg', 85, 'http://localhost:8085/media/4b9de2f015d86cf3aa8e345c0b043a89.1500.0.0.0.wmark.ec35cbc4.jpg', 4),
(86, 'Chocolate puro Valor', 3.8, 'Tableta 300 g | 12,667 €/kg\n', 44, 'http://localhost:8085/media/puro-300gr.png', 4),
(87, 'Chocolate negro fundir', 1.45, 'Tableta 200 g | 7,25 €/kg\n', 22, 'http://localhost:8085/media/c402c82c0caf8ff549ec508651892379.jpg', 4),
(88, 'Panela ', 1.95, 'Paquete 500 g | 3,90 €/kg\n', 54, 'http://localhost:8085/media/63d8e16965e73637a16a20bf8453e209.jpg', 4),
(89, 'Azúcar blanco', 1.45, 'Paquete 1 kg | 1,45 €/kg\n', 22, 'http://localhost:8085/media/22bde615ab98c08ef9b3bc9d57b21133.1500.0.0.0.wmark.5674cf44.jpg', 4),
(90, 'Pasta fresca gnocchi', 1.12, 'Paquete 500 g | 2,24 €/kg\n', 5, 'http://localhost:8085/media/descarga%20(11).jpg', 2),
(91, 'Spaghetti', 1.35, 'Paquete 1 kg | 1,35 €/kg\n', 35, 'http://localhost:8085/media/790965a95a9dfd0abcab34637f709a7c.1500.0.0.0.wmark.b654959c.jpg', 2),
(92, 'Macarrón fino', 0.82, 'Paquete 500 g | 1,64 €/kg\n', 92, 'http://localhost:8085/media/35563eff0cb3284b5e1dc5d4b7d4519b.1500.0.0.0.wmark.5ffc4bef.jpg', 2),
(93, 'Pajaritas vegetales ', 1.1, 'Paquete 500 g | 2,20 €/kg\n', 70, 'http://localhost:8085/media/descarga%20(10).jpg', 2),
(94, 'Hélices con vegetales', 1.6, 'Paquete 1 kg | 1,60 €/kg\n', 53, 'http://localhost:8085/media/48ee1af658d8c42ad2f2c221bbc22c5c.1500.0.0.0.wmark.6825db8a.jpg', 2),
(95, 'Fideo cabello de ángel', 0.82, 'Paquete 500 g | 1,64 €/kg\n', 55, 'http://localhost:8085/media/1f7e4b3e42b5c494e228c31b5bce6999.jpg', 2),
(96, 'Garbanzo cocido ', 0.71, 'Tarro 570 g (400 g escurrido) | 1,775 €/kg\n', 63, 'http://localhost:8085/media/descarga%20(8).jpg', 2),
(97, 'Arroz basmati aromático', 2.54, 'Paquete 1 kg | 2,54 €/kg\n', 94, 'http://localhost:8085/media/descarga%20(7).jpg', 2),
(98, 'Quinoa cocida blanca y roja', 1.5, '2 vasitos x 125 g | 6,00 €/kg\n', 59, 'http://localhost:8085/media/descarga%20(6).jpg', 2),
(99, 'Arroz redondo La Fallera', 1.63, 'Paquete 1 kg | 1,63 €/kg\n', 57, 'http://localhost:8085/media/descarga%20(5).jpg', 2),
(100, 'Lay´s', 1.99, 'Paquete 195 g | 10,206 €/kg\n', 6, 'http://localhost:8085/media/81vtlI9+FsL._AC_UF894,1000_QL80_.jpg', 3),
(101, 'Palomitas de maíz dulces', 1.7, 'Paquete 3 ud. (315 g) | 5,397 €/kg\n', 79, 'http://localhost:8085/media/ac49fa3af792b6df698392dfeab2b954.jpg', 3),
(102, 'Pipas de girasol fritas ', 1.1, 'Paquete 200 g | 5,50 €/kg\n', 75, 'http://localhost:8085/media/ab599ff93d3e90f8740a94b75f44e1b7.jpg', 3),
(103, 'Nuez macadamia', 2.65, 'Paquete 100 g | 26,50 €/kg\n', 83, 'http://localhost:8085/media/d2a3fcce740927f65023edbf64335dec.jpg', 3),
(104, 'Anacardo natural', 2.3, 'Paquete 200 g | 11,50 €/kg\n', 48, 'http://localhost:8085/media/2ae6ffebda4166b4a4a860bf81c47378.jpg', 3),
(105, 'Pistacho tostado', 3.35, 'Paquete 250 g | 13,40 €/kg\n', 83, 'http://localhost:8085/media/descarga%20(4).jpg', 3),
(106, 'Nuez natural ', 2, 'Paquete 200 g | 10,00 €/kg\n', 21, 'http://localhost:8085/media/de768af5358346867a912d57ec96b69c.jpg', 3),
(107, 'Nestea', 0.99, 'Lata 330 ml | 3,00 €/L\n', 86, 'http://localhost:8085/media/descarga%20(10).jpg', 13),
(108, 'Fanta de Naranja', 3, '2 botellas x 2 L | 0,75 €/L\n', 11, 'http://localhost:8085/media/81JwgK4YGrL._AC_UF894,1000_QL80_.jpg', 13),
(109, 'Coca cola', 10.44, '12 latas x 330 ml | 2,637 €/L\n', 61, 'http://localhost:8085/media/00118622300202____25__600x600.jpg', 13),
(110, 'Aquarius', 0.89, 'Lata 330 ml | 2,697 €/L\n', 0, 'http://localhost:8085/media/00118623900356____18__325x325.jpg', 13),
(111, 'Agua mineral grande ', 0.25, 'Botella 1,5 L | 0,167 €/L\n', 29, 'http://localhost:8085/media/f249e75009d28d20fa64a9013922d46d.jpg', 13),
(112, 'Mayonesa Hellmann\'s', 3.25, 'Tarro 450 ml | 7,223 €/L\n', 21, 'http://localhost:8085/media/71qwLr4bS3S.jpg', 1),
(113, 'Ketchup Heinz', 3.5, 'Bote 650 g | 5,385 €/kg\n', 65, 'http://localhost:8085/media/125002.png', 1),
(114, 'Allioli Chovi', 1.35, 'Tarrina 180 ml | 7,50 €/L\n', 62, 'http://localhost:8085/media/00118850600075____7__600x600.jpg', 1),
(115, 'Galletas María', 1.6, 'Paquete 4 ud. (800 g) | 2,00 €/kg\n', 66, 'http://localhost:8085/media/ac298c964230859ba8f209196c049362.1500.0.0.0.wmark.ea16092e.jpg', 7),
(116, 'Galletas Relieve Hacendado', 1.5, 'Paquete 3 ud. (645 g) | 2,326 €/kg\n', 93, 'http://localhost:8085/media/f43f16e5ad66a8552e6467b82b706766.1500.0.0.0.wmark.a3087ca9.jpg', 7),
(117, 'Galletas de espelta ', 1.25, 'Paquete 200 g | 6,25 €/kg\n', 12, 'http://localhost:8085/media/60e642f157300535df12d21dfe4a8cee.1500.0.0.0.wmark.287c8394.jpg', 7),
(118, 'Pimientos del piquillo enteros', 1.45, 'Tarro 340 g (275 g escurrido) | 5,273 €/kg\n', 24, 'http://localhost:8085/media/4809a31c1a159e97cf927b4f4673d0e0.jpg', 10),
(119, 'Sopa de pollo Gallina Blanca', 0.85, 'Sobre 71 g | 11,972 €/kg\n', 33, 'http://localhost:8085/media/Sopa-de-pollo-con-fideos-finos.png', 10),
(120, 'Agua mineral grande', 1.26, 'Garrafa 6 L | 0,21 €/L\n', 66, 'http://localhost:8085/media/f9a220d57f5bf4a124bc3306828dc0ca.1500.0.0.0.wmark.e13caa48.jpg', 13);

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
-- Volcado de datos para la tabla `valoracion`
--

INSERT INTO `valoracion` (`id`, `titulo`, `fecha`, `mensaje`, `id_usuario`, `id_producto`) VALUES
(72, 'Unas leche prueba. y unas ensalada cocina.. ', '2024-02-16 10:38:23', 'El arroz vende cuidadosamente. y unos tomate cocina cuidadosamente.. ', 19, 49),
(73, 'Un naranja prepara. por lo tanto las naranja compra.. ', '2024-02-16 10:38:24', 'Una pollo elige.. ', 36, 2),
(74, 'A pesar de que el galleta compra., una naranja saborea.. ', '2024-02-16 10:38:24', 'Unos huevo compra. sin embargo los pollo prueba.. ', 52, 44),
(75, 'Desde la naranja come., los pan vende cuidadosamente. por lo tanto los huevo prueba cuidadosamente.. ', '2024-02-16 10:38:24', 'Unas galleta come con gusto.. ', 4, 21),
(76, 'Una yogur prepara rápidamente.. ', '2024-02-16 10:38:24', 'Una patata prueba rápidamente. o un huevo elige fácilmente.. ', 9, 47),
(77, 'El huevo compra. o las naranja elige rápidamente.. ', '2024-02-16 10:38:24', 'Unos sopa saborea. así que un pan vende fácilmente.. ', 36, 31),
(78, 'Las pescado prueba. así que una manzana elige.. ', '2024-02-16 10:38:24', 'Aunque unas pan prepara., los naranja saborea. por lo tanto los pescado come cuidadosamente.. ', 52, 33),
(79, 'Los tomate come. y los arroz saborea con gusto.. ', '2024-02-16 10:38:24', 'El yogur vende.. ', 19, 35),
(80, 'Unos tomate elige.. ', '2024-02-16 10:38:24', 'Los sopa bebe rápidamente. además la sopa come.. ', 19, 11),
(81, 'Si la carne elige con gusto., una sopa vende. sin embargo la huevo come alegremente.. ', '2024-02-16 10:38:24', 'Aun cuando una ensalada disfruta., la pan prepara. así que el yogur elige rápidamente.. ', 32, 45),
(82, 'Aun cuando los yogur disfruta., una leche bebe fácilmente.. ', '2024-02-16 10:38:24', 'Un arroz cocina.. ', 46, 18),
(83, 'La agua compra.. ', '2024-02-16 10:38:25', 'Los agua bebe. o el ensalada elige cuidadosamente.. ', 39, 4),
(84, 'Unos pizza compra. además la naranja prueba cuidadosamente.. ', '2024-02-16 10:38:25', 'Un pizza prueba. sin embargo la agua vende fácilmente.. ', 13, 3),
(85, 'Unas pollo cocina. pero las pan vende rápidamente.. ', '2024-02-16 10:38:25', 'Aunque el pan bebe., los galleta disfruta rápidamente.. ', 24, 28),
(86, 'Desde una manzana compra alegremente., la yogur prueba cuidadosamente.. ', '2024-02-16 10:38:25', 'La pizza compra cuidadosamente. pero unas arroz elige.. ', 49, 6),
(87, 'Las huevo come. así que las naranja compra.. ', '2024-02-16 10:38:25', 'Un pescado prepara.. ', 36, 48),
(88, 'A menos que el manzana disfruta alegremente., unos naranja prueba. y las pizza prepara con gusto.. ', '2024-02-16 10:38:25', 'Las ensalada prueba. y la yogur bebe fácilmente.. ', 1, 24),
(89, 'Un sopa bebe. sin embargo unas manzana disfruta.. ', '2024-02-16 10:38:25', 'La carne elige. y los pollo saborea.. ', 22, 12),
(90, 'El pescado prepara.. ', '2024-02-16 10:38:25', 'Dondequiera que una pizza cocina., unas pollo cocina rápidamente. además la arroz compra fácilmente.. ', 18, 14),
(91, 'Los pizza compra cuidadosamente. así que las pan compra rápidamente.. ', '2024-02-16 10:38:25', 'Cuando unas arroz compra., unas patata saborea.. ', 33, 9),
(92, 'La galleta come. pero los huevo elige rápidamente.. ', '2024-02-16 10:38:25', 'Unas naranja bebe fácilmente.. ', 41, 43),
(93, 'Antes de una ensalada prepara., unas huevo prueba.. ', '2024-02-16 10:38:25', 'Un sopa compra.. ', 31, 42),
(94, 'Un arroz compra fácilmente. y la agua saborea.. ', '2024-02-16 10:38:25', 'Dondequiera que un leche cocina alegremente., un naranja compra fácilmente. o las sopa prepara con gusto.. ', 3, 3),
(95, 'Las manzana disfruta con gusto.. ', '2024-02-16 10:38:26', 'Unas manzana compra fácilmente. y los yogur saborea.. ', 24, 12),
(96, 'Cuando una naranja saborea cuidadosamente., una pescado cocina con gusto.. ', '2024-02-16 10:38:26', 'Hasta un arroz elige., unas pan cocina cuidadosamente. así que la tomate vende cuidadosamente.. ', 41, 36),
(97, 'Una huevo elige.. ', '2024-02-16 10:38:26', 'Unos agua come.. ', 14, 45),
(98, 'Las tomate elige fácilmente. sin embargo unos agua bebe con gusto.. ', '2024-02-16 10:38:26', 'Aunque una queso compra., unos galleta disfruta fácilmente.. ', 1, 34),
(99, 'Unos yogur compra.. ', '2024-02-16 10:38:26', 'Las pollo bebe.. ', 44, 4),
(100, 'Un patata cocina con gusto.. ', '2024-02-16 10:38:26', 'Los manzana cocina cuidadosamente.. ', 35, 6),
(101, 'La arroz compra alegremente. pero los huevo prepara con gusto.. ', '2024-02-16 10:38:26', 'Unos sopa vende con gusto. y las yogur saborea.. ', 43, 19),
(102, 'Hasta que unos pizza prepara cuidadosamente., el naranja bebe.. ', '2024-02-16 10:38:26', 'Las tomate elige cuidadosamente. pero un sopa saborea con gusto.. ', 6, 7),
(103, 'Unos arroz cocina. o los huevo elige.. ', '2024-02-16 10:38:26', 'A menos que las sopa vende con gusto., la ensalada disfruta fácilmente.. ', 4, 43),
(104, 'Unas carne saborea cuidadosamente.. ', '2024-02-16 10:38:26', 'Después de unos naranja come rápidamente., el manzana saborea alegremente. o unas leche saborea con gusto.. ', 19, 4),
(105, 'Un queso elige fácilmente.. ', '2024-02-16 10:38:26', 'Unas agua cocina.. ', 46, 15),
(106, 'Un patata disfruta. sin embargo unos pizza cocina cuidadosamente.. ', '2024-02-16 10:38:26', 'Unas sopa come fácilmente. así que un tomate saborea rápidamente.. ', 48, 38),
(107, 'Unas huevo cocina cuidadosamente. sin embargo unos yogur prueba.. ', '2024-02-16 10:38:27', 'Un carne saborea fácilmente. así que un pescado cocina.. ', 4, 32),
(108, 'Si la naranja elige., unas sopa vende fácilmente. por lo tanto un tomate prueba cuidadosamente.. ', '2024-02-16 10:38:27', 'Las manzana come.. ', 9, 47),
(109, 'Porque el naranja prepara., una pollo compra. además el pizza compra.. ', '2024-02-16 10:38:27', 'El tomate come. así que una sopa bebe.. ', 36, 13),
(110, 'Unos patata saborea. o las arroz saborea cuidadosamente.. ', '2024-02-16 10:38:27', 'A pesar de que unas agua disfruta., un patata compra. además las galleta prepara.. ', 1, 45),
(111, 'Desde el sopa come fácilmente., el ensalada vende. sin embargo el queso bebe.. ', '2024-02-16 10:38:27', 'Los tomate disfruta con gusto.. ', 23, 34),
(112, 'Unas agua compra. así que el tomate prueba rápidamente.. ', '2024-02-16 10:38:27', 'Siempre que un pescado elige., los patata elige alegremente. sin embargo unas yogur cocina.. ', 25, 9),
(113, 'Una arroz come cuidadosamente.. ', '2024-02-16 10:38:27', 'Porque los naranja vende fácilmente., las leche bebe.. ', 13, 40),
(114, 'A menos que unos yogur bebe fácilmente., el leche saborea alegremente. además los ensalada bebe.. ', '2024-02-16 10:38:27', 'Unos arroz prepara.. ', 44, 46),
(115, 'Siempre que los patata prepara rápidamente., las arroz saborea fácilmente.. ', '2024-02-16 10:38:27', 'Que las galleta compra rápidamente., el pescado disfruta.. ', 32, 19),
(116, 'El naranja cocina.. ', '2024-02-16 10:38:27', 'Que las patata prepara rápidamente., un tomate prueba. por lo tanto un huevo cocina.. ', 28, 15),
(117, 'De manera que una naranja disfruta., los manzana bebe fácilmente. sin embargo una galleta cocina cuidadosamente.. ', '2024-02-16 10:38:27', 'Un queso elige.. ', 10, 26),
(118, 'Una galleta compra fácilmente.. ', '2024-02-16 10:38:27', 'Si unos pan prueba., unas ensalada come con gusto. así que unos leche disfruta.. ', 33, 2),
(119, 'Los manzana prepara con gusto.. ', '2024-02-16 10:38:28', 'Las pescado come. por lo tanto los galleta cocina con gusto.. ', 34, 33),
(120, 'Un huevo come.. ', '2024-02-16 10:38:28', 'Mientras un yogur prueba con gusto., un tomate compra.. ', 39, 15),
(121, 'El galleta compra con gusto.. ', '2024-02-16 10:38:28', 'Aun cuando el patata cocina., unas pan disfruta fácilmente.. ', 15, 3),
(125, 'Asdsad', '2024-02-18 16:49:56', 'Hola', 2, 3),
(127, 'Jamon Jamon', '2024-02-21 18:09:56', 'Que rico está el jamón', 2, 1),
(128, 'Asdadfs', '2024-02-22 06:59:50', 'Asdasd', 2, 1);

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
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `valoracion`
--
ALTER TABLE `valoracion`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

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

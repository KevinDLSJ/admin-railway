-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-05-2023 a las 12:04:55
-- Versión del servidor: 5.6.21
-- Versión de PHP: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `sistema3`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE IF NOT EXISTS `articulo` (
`tipo_art` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articulo`
--

INSERT INTO `articulo` (`tipo_art`, `descripcion`) VALUES
(1, 'venta directa'),
(2, 'preparado'),
(3, 'insumo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE IF NOT EXISTS `carrito` (
  `id_usuario` varchar(220) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id_usuario`, `id_producto`, `cantidad`) VALUES
('21301061550104@cetis155.edu.mx', 17, 2),
('21301061550104@cetis155.edu.mx', 18, 2),
('21301061550127@cetis155.edu.mx', 11, 1),
('21301061550127@cetis155.edu.mx', 18, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle`
--

CREATE TABLE IF NOT EXISTS `detalle` (
  `folio` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle`
--

INSERT INTO `detalle` (`folio`, `id_producto`, `cantidad`, `precio`) VALUES
(8, 11, 1, 20),
(9, 11, 1, 20),
(9, 18, 1, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE IF NOT EXISTS `pedido` (
`folio` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `status` varchar(1) NOT NULL,
  `corre_emp` varchar(200) DEFAULT NULL,
  `correo_clie` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`folio`, `fecha`, `status`, `corre_emp`, `correo_clie`) VALUES
(8, '2023-05-25', 'U', 'nulo', '21301061550104@cetis155.edu.mx'),
(9, '2023-05-25', 'U', 'nulo', '21301061550104@cetis155.edu.mx'),
(10, '2023-05-25', 'U', 'nulo', '21301061550104@cetis155.edu.mx'),
(11, '2023-05-25', 'U', 'nulo', '21301061550104@cetis155.edu.mx'),
(12, '2023-05-25', 'U', 'nulo', '21301061550104@cetis155.edu.mx'),
(13, '2023-05-25', 'U', 'nulo', '21301061550104@cetis155.edu.mx'),
(14, '2023-05-25', 'U', 'nulo', '21301061550104@cetis155.edu.mx'),
(15, '2023-05-25', 'U', 'nulo', '21301061550127@cetis155.edu.mx'),
(16, '2023-05-25', 'U', 'nulo', '21301061550127@cetis155.edu.mx');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE IF NOT EXISTS `product` (
`id_producto` int(11) NOT NULL,
  `unidad` varchar(100) NOT NULL,
  `tipo_art` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `precio` float NOT NULL,
  `costo` float NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `presentacion` varchar(220) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`id_producto`, `unidad`, `tipo_art`, `name`, `precio`, `costo`, `imagen`, `presentacion`) VALUES
(3, '2', 3, 'Pan', 12, 8, 'https://quebuenasazon.com/wp-content/uploads/2022/04/pan-dulce-mexico.jpg', 'Pan dulce'),
(11, '3', 1, 'Arizon xd', 20, 12, 'https://http2.mlstatic.com/D_NQ_NP_2X_618506-MLM43910113825_102020-F.webp', 'Arizona es una marca de una bebida refrescante, hecha de té y jugo de frutas, que viene en botella de plástico de 500 ml y 1.24 litros, también la consigues en latas de 680 ml.'),
(12, '4', 3, 'Huevo', 0, 30, 'https://i.blogs.es/09c069/huevo/1366_2000.webp', ''),
(14, '5', 3, 'Santa Clara', 13, 15, 'https://www.cityclub.com.mx/dw/image/v2/BGBD_PRD/on/demandware.static/-/Sites-soriana-grocery-master-catalog/default/dw311c5fce/images/product/7501295600126_A.jpg?sw=1000&sh=1000&sm=fit', 'Leche Santa Clara aporta un sabor dulce a tus postres o desayunos, pruébala en sabor chocolate'),
(15, '2', 1, 'Agua', 12, 8, 'https://chedrauimx.vtexassets.com/arquivos/ids/14505506-1600-auto?v=638183315737270000&width=1600&height=auto&aspect=true', 'Agua purificada Ciel'),
(16, '2', 1, 'Yogurt', 12, 5, 'https://www.sellorojo.com.mx/assets/images/sheik-1200x800-800x533.png', ''),
(17, '2', 1, 'Frutsi', 10, 5, 'https://s.cornershopapp.com/product-images/374869.jpg?versionId=DpEmXCJY7IzW7Vcfm_6_eX2QINB0CKb8', 'Ideal para los almuerzos escolares\r\nBebida fortificada\r\nPráctica presentación portable\r\n'),
(18, '5', 2, 'Torta Adobada', 12, 35, 'https://i.ytimg.com/vi/_OzABgWcNE4/maxresdefault.jpg', ''),
(19, '4', 2, 'Hot Dog', 15, 30, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Hot_dog_on_a_plate_-_Evan_Swigart.jpg/245px-Hot_dog_on_a_plate_-_Evan_Swigart.jpg', ''),
(20, '2', 1, 'Coca Cola 3L', 45, 220, 'https://mrbrown.com.mx/products/refresco-coca-cola-3-l', ''),
(21, '4', 1, 'kikis', 5, 50, 'https://static.wixstatic.com/media/366236_f8b1791e265c4d97810c6414d1ce7f36~mv2.jpg/v1/crop/x_86,y_90,w_324,h_323/fill/w_190,h_190,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/GN22.jpg', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `units`
--

CREATE TABLE IF NOT EXISTS `units` (
`unidad` int(11) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `units`
--

INSERT INTO `units` (`unidad`, `description`) VALUES
(1, 'Gramos'),
(2, 'Litros'),
(3, 'Rebanada'),
(4, 'Piezas'),
(5, 'No contable');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id_usuario` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `ap_paterno` varchar(200) NOT NULL,
  `ap_materno` varchar(200) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `fecha_n` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_usuario`, `name`, `ap_paterno`, `ap_materno`, `telefono`, `fecha_n`, `email`, `password`) VALUES
(1, 'Erick', 'Chavez', 'Ponce', '4495882440', '1688-12-28', 'erick123@gmail.com', '$2b$12$6Qc8a93tW8Yhg8Jmf.D9PeXMJL.vw.bfP1xsF/IEnaQtQgQ9uLESy'),
(3, 'Kevin Raziel', 'De Los Santos', 'Jaramillo', '4493938732', '2006-08-16', '21301061550104@cetis155.edu.mx', '$2b$12$wVpqHzv11CgBLGPfMiqoo.we8UG.XO/nNXNRQFiq2aUljvaMRoC3C'),
(5, 'DanLolero', 'Martinez', '', '4493657845', '0000-00-00', 'newuser@gmail.com', '$2b$12$5Perg1TSbGXQhR.iDPXDPOmd.a6d7PFVKoo.59uzvxfXlWT3qsNue');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
 ADD PRIMARY KEY (`tipo_art`);

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
 ADD PRIMARY KEY (`id_usuario`,`id_producto`);

--
-- Indices de la tabla `detalle`
--
ALTER TABLE `detalle`
 ADD PRIMARY KEY (`folio`,`id_producto`), ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
 ADD PRIMARY KEY (`folio`);

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
 ADD PRIMARY KEY (`id_producto`), ADD KEY `tipo_art` (`tipo_art`);

--
-- Indices de la tabla `units`
--
ALTER TABLE `units`
 ADD PRIMARY KEY (`unidad`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulo`
--
ALTER TABLE `articulo`
MODIFY `tipo_art` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
MODIFY `folio` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `units`
--
ALTER TABLE `units`
MODIFY `unidad` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle`
--
ALTER TABLE `detalle`
ADD CONSTRAINT `detalle_ibfk_1` FOREIGN KEY (`folio`) REFERENCES `pedido` (`folio`),
ADD CONSTRAINT `detalle_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `product` (`id_producto`);

--
-- Filtros para la tabla `product`
--
ALTER TABLE `product`
ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`tipo_art`) REFERENCES `articulo` (`tipo_art`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

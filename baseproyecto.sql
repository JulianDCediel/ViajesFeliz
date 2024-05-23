-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2024 at 06:41 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `baseproyecto`
--

-- --------------------------------------------------------

--
-- Table structure for table `alojamiento`
--

CREATE TABLE `alojamiento` (
  `Direccion` varchar(100) NOT NULL,
  `Id_empleado` int(11) NOT NULL,
  `N_personas` int(11) NOT NULL,
  `N_banos` int(11) NOT NULL,
  `N_habitaciones` int(11) NOT NULL,
  `Id_tipo` int(11) NOT NULL,
  `P_min` int(11) NOT NULL,
  `Mascotas` char(2) NOT NULL,
  `Id_CAL_AIRE` int(11) NOT NULL,
  `Id_ciudad` int(11) NOT NULL,
  `Id_barrio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alojamiento`
--

INSERT INTO `alojamiento` (`Direccion`, `Id_empleado`, `N_personas`, `N_banos`, `N_habitaciones`, `Id_tipo`, `P_min`, `Mascotas`, `Id_CAL_AIRE`, `Id_ciudad`, `Id_barrio`) VALUES
('calle20norte', 1028, 8, 3, 4, 1, 30000, 'Si', 3, 1, 5),
('calle36Bsur#3A60', 1028, 6, 2, 4, 2, 25000, 'No', 2, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `barrio`
--

CREATE TABLE `barrio` (
  `Id` int(11) NOT NULL,
  `NombreBarrio` varchar(20) NOT NULL,
  `Id_Ciudad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barrio`
--

INSERT INTO `barrio` (`Id`, `NombreBarrio`, `Id_Ciudad`) VALUES
(1, 'El Prado', 1),
(2, 'Alto Prado', 1),
(3, 'Villa Country', 1),
(4, 'Riomar', 1),
(5, 'Bellavista', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cal_aire`
--

CREATE TABLE `cal_aire` (
  `Id` int(11) NOT NULL,
  `Opcion` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cal_aire`
--

INSERT INTO `cal_aire` (`Id`, `Opcion`) VALUES
(1, 'calefaccion'),
(2, 'Aire'),
(3, 'Ambos'),
(4, 'Ninguno');

-- --------------------------------------------------------

--
-- Table structure for table `ciudad`
--

CREATE TABLE `ciudad` (
  `Id` int(11) NOT NULL,
  `NombreCiudad` varchar(20) NOT NULL,
  `Id_region` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ciudad`
--

INSERT INTO `ciudad` (`Id`, `NombreCiudad`, `Id_region`) VALUES
(1, 'Barranquilla', 1),
(2, 'Cartagena', 1),
(3, 'Santa Marta', 1),
(4, 'Soledad', 1),
(5, 'Maicao', 1),
(6, 'Arjona', 1),
(7, 'Magangué', 1),
(8, 'Turbaco', 1),
(9, 'Sahagún', 1),
(10, 'Ciénaga', 1),
(11, 'Malambo', 1),
(12, 'Corozal', 1),
(13, 'Carmen de Bolívar', 1),
(14, 'Sabanalarga', 1),
(15, 'Sincelejo', 1),
(16, 'Medellín', 2),
(17, 'Tunja', 2),
(18, 'Manizales', 2),
(19, 'Bogotá', 2),
(20, 'Neiva', 2),
(21, 'Cúcuta', 2),
(22, 'Armenia', 2),
(23, 'Pereira', 2),
(24, 'Bucaramanga', 2),
(25, 'Ibagué', 2),
(26, 'Cali', 2),
(27, 'Popayán', 2),
(28, 'Pasto', 2),
(29, 'Villavicencio', 2),
(30, 'Santa Rosa de Cabal', 2),
(31, 'Buenaventura', 3),
(32, 'Tumaco', 3),
(33, 'Quibdó', 3),
(34, 'Istmina', 3),
(35, 'Barbacoas', 3),
(36, 'Nuquí', 3),
(37, 'Cali', 3),
(38, 'Popayán', 3),
(39, 'Pasto', 3),
(40, 'Guapi', 3),
(41, 'Timbiquí', 3),
(42, 'López de Micay', 3),
(43, 'El Charco', 3),
(44, 'La Tola', 3),
(45, 'Olaya Herrera', 3),
(46, 'Villavicencio', 4),
(47, 'Yopal', 4),
(48, 'Arauca', 4),
(49, 'Granada', 4),
(50, 'Tame', 4),
(51, 'Aguazul', 4),
(52, 'Orocue', 4),
(53, 'Puerto Carreño', 4),
(54, 'Acacias', 4),
(55, 'Puerto López', 4),
(56, 'Puerto Gaitán', 4),
(57, 'San Luis de Palenque', 4),
(58, 'Trinidad', 4),
(59, 'Maní', 4),
(60, 'Paz de Ariporo', 4),
(61, 'Leticia', 5),
(62, 'Puerto Nariño', 5),
(63, 'El Encanto', 5),
(64, 'La Pedrera', 5),
(65, 'La Chorrera', 5),
(66, 'Tarapacá', 5),
(67, 'Puerto Santander', 5),
(68, 'Mirití Paraná', 5),
(69, 'Puerto Alegría', 5),
(70, 'Puerto Arica', 5),
(71, 'La Victoria', 5),
(72, 'Florencia', 5),
(73, 'San José del Guaviar', 5),
(74, 'San Vicente del Cagu', 5),
(75, 'Puerto Asís', 5);

-- --------------------------------------------------------

--
-- Table structure for table `detalle`
--

CREATE TABLE `detalle` (
  `Id` int(11) NOT NULL,
  `Id_alojamiento` varchar(100) NOT NULL,
  `Id_Usuario` int(11) NOT NULL,
  `N_personas` int(11) NOT NULL,
  `Mascotas` char(2) NOT NULL,
  `F_entrada` date NOT NULL,
  `F_salida` date NOT NULL,
  `Id_reserva` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detalle`
--

INSERT INTO `detalle` (`Id`, `Id_alojamiento`, `Id_Usuario`, `N_personas`, `Mascotas`, `F_entrada`, `F_salida`, `Id_reserva`) VALUES
(1, 'calle20norte', 777, 4, 'No', '2024-05-24', '2024-05-31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `empleado`
--

CREATE TABLE `empleado` (
  `Id` int(11) NOT NULL,
  `Nombres` varchar(50) NOT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `Contraseña` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `empleado`
--

INSERT INTO `empleado` (`Id`, `Nombres`, `Apellidos`, `Correo`, `Contraseña`) VALUES
(1028, 'Julian David', 'Cediel Gomez', 'david123@hotmail.com', 'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM='),
(1029, 'Manuel Alejandro', 'Cediel Cruz', 'alejo123@hotmail.com', '1GcfUdZkpupfMFEuSHrwN4+Q8hAHPQfm7dyL3zUV/oc=');

-- --------------------------------------------------------

--
-- Table structure for table `encuesta`
--

CREATE TABLE `encuesta` (
  `Id` int(11) NOT NULL,
  `Clasificacion` int(11) NOT NULL,
  `Comentarios` text NOT NULL,
  `Id_reserva` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `estado`
--

CREATE TABLE `estado` (
  `Id` int(11) NOT NULL,
  `Estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `estado`
--

INSERT INTO `estado` (`Id`, `Estado`) VALUES
(1, 'En proceso'),
(2, 'Alquilado'),
(3, 'Libre');

-- --------------------------------------------------------

--
-- Table structure for table `fotos`
--

CREATE TABLE `fotos` (
  `Id_foto` int(11) NOT NULL,
  `Fotos` varchar(150) DEFAULT NULL,
  `Id_alojamiento` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fotos`
--

INSERT INTO `fotos` (`Id_foto`, `Fotos`, `Id_alojamiento`) VALUES
(1, 'ImagenesCasas\\\\c1_1.jpg', 'calle20norte'),
(1, 'ImagenesCasas\\\\c2_1.jpg', 'calle36Bsur#3A60'),
(2, 'ImagenesCasas\\\\c1_2.jpg', 'calle20norte');

-- --------------------------------------------------------

--
-- Table structure for table `nacionalidad`
--

CREATE TABLE `nacionalidad` (
  `Id` int(11) NOT NULL,
  `Nombre_pais` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nacionalidad`
--

INSERT INTO `nacionalidad` (`Id`, `Nombre_pais`) VALUES
(1, 'México'),
(2, 'España'),
(3, 'Argentina');

-- --------------------------------------------------------

--
-- Table structure for table `pago`
--

CREATE TABLE `pago` (
  `Id` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Id_reserva` int(11) NOT NULL,
  `Id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pago`
--

INSERT INTO `pago` (`Id`, `Fecha`, `Cantidad`, `Id_reserva`, `Id_usuario`) VALUES
(1, '2024-05-22', 52800, 1, 777);

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE `region` (
  `Id` int(11) NOT NULL,
  `NombreRegion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`Id`, `NombreRegion`) VALUES
(1, 'atlantico'),
(2, 'andina'),
(3, 'pacifico'),
(4, 'orinoquia'),
(5, 'amazonas');

-- --------------------------------------------------------

--
-- Table structure for table `reserva`
--

CREATE TABLE `reserva` (
  `Id` int(11) NOT NULL,
  `Id_estado` int(11) NOT NULL,
  `Total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reserva`
--

INSERT INTO `reserva` (`Id`, `Id_estado`, `Total`) VALUES
(1, 1, 264000);

-- --------------------------------------------------------

--
-- Table structure for table `tel_emp`
--

CREATE TABLE `tel_emp` (
  `Telefono` int(11) NOT NULL,
  `Id_emp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tel_usu`
--

CREATE TABLE `tel_usu` (
  `Telefono` int(11) NOT NULL,
  `Id_usu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tel_usu`
--

INSERT INTO `tel_usu` (`Telefono`, `Id_usu`) VALUES
(111, 777),
(4444, 51920116),
(31122, 1029140);

-- --------------------------------------------------------

--
-- Table structure for table `tipo`
--

CREATE TABLE `tipo` (
  `Id` int(11) NOT NULL,
  `Tipo` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tipo`
--

INSERT INTO `tipo` (`Id`, `Tipo`) VALUES
(1, 'Casa'),
(2, 'cabaña');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `Id` int(11) NOT NULL,
  `Nombres` varchar(50) NOT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `Id_Nac` int(11) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `Contraseña` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`Id`, `Nombres`, `Apellidos`, `Id_Nac`, `Direccion`, `Correo`, `Contraseña`) VALUES
(777, 'Juan Carlos', 'Cediel Lopez', 3, 'calle36Bsur#3a60', 'aaa123@hotmail.com', 'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM='),
(1029140, 'Marco', 'Rodriguez', 3, 'calle36Bsur#3a900', 'bbb@hotmail.com', 'jSPPbIboNKeqbt7VTCbOK7LnSQNTjGG91dIZeZerL3I='),
(51920116, 'Mario', 'Alfonso', 3, 'carrera4#8b-sur', 'bbb123@hotmail.com', 'jSPPbIboNKeqbt7VTCbOK7LnSQNTjGG91dIZeZerL3I=');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alojamiento`
--
ALTER TABLE `alojamiento`
  ADD PRIMARY KEY (`Direccion`),
  ADD KEY `Id_empleado` (`Id_empleado`),
  ADD KEY `Id_tipo` (`Id_tipo`),
  ADD KEY `Id_ciudad` (`Id_ciudad`),
  ADD KEY `Id_barrio` (`Id_barrio`),
  ADD KEY `Id_CAL_AIRE` (`Id_CAL_AIRE`);

--
-- Indexes for table `barrio`
--
ALTER TABLE `barrio`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_Ciudad` (`Id_Ciudad`);

--
-- Indexes for table `cal_aire`
--
ALTER TABLE `cal_aire`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_region` (`Id_region`);

--
-- Indexes for table `detalle`
--
ALTER TABLE `detalle`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_reserva` (`Id_reserva`),
  ADD KEY `Id_Usuario` (`Id_Usuario`),
  ADD KEY `Id_alojamiento` (`Id_alojamiento`);

--
-- Indexes for table `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `encuesta`
--
ALTER TABLE `encuesta`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_reserva` (`Id_reserva`);

--
-- Indexes for table `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `fotos`
--
ALTER TABLE `fotos`
  ADD PRIMARY KEY (`Id_foto`,`Id_alojamiento`),
  ADD KEY `Id_alojamiento` (`Id_alojamiento`);

--
-- Indexes for table `nacionalidad`
--
ALTER TABLE `nacionalidad`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_reserva` (`Id_reserva`),
  ADD KEY `Id_usuario` (`Id_usuario`);

--
-- Indexes for table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_estado` (`Id_estado`);

--
-- Indexes for table `tel_emp`
--
ALTER TABLE `tel_emp`
  ADD PRIMARY KEY (`Telefono`,`Id_emp`),
  ADD KEY `Id_emp` (`Id_emp`);

--
-- Indexes for table `tel_usu`
--
ALTER TABLE `tel_usu`
  ADD PRIMARY KEY (`Telefono`,`Id_usu`),
  ADD KEY `Id_usu` (`Id_usu`);

--
-- Indexes for table `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_Nac` (`Id_Nac`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detalle`
--
ALTER TABLE `detalle`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pago`
--
ALTER TABLE `pago`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reserva`
--
ALTER TABLE `reserva`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alojamiento`
--
ALTER TABLE `alojamiento`
  ADD CONSTRAINT `alojamiento_ibfk_1` FOREIGN KEY (`Id_empleado`) REFERENCES `empleado` (`Id`),
  ADD CONSTRAINT `alojamiento_ibfk_2` FOREIGN KEY (`Id_tipo`) REFERENCES `tipo` (`Id`),
  ADD CONSTRAINT `alojamiento_ibfk_3` FOREIGN KEY (`Id_ciudad`) REFERENCES `ciudad` (`Id`),
  ADD CONSTRAINT `alojamiento_ibfk_4` FOREIGN KEY (`Id_barrio`) REFERENCES `barrio` (`Id`),
  ADD CONSTRAINT `alojamiento_ibfk_5` FOREIGN KEY (`Id_CAL_AIRE`) REFERENCES `cal_aire` (`Id`);

--
-- Constraints for table `barrio`
--
ALTER TABLE `barrio`
  ADD CONSTRAINT `barrio_ibfk_1` FOREIGN KEY (`Id_Ciudad`) REFERENCES `ciudad` (`Id`);

--
-- Constraints for table `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `ciudad_ibfk_1` FOREIGN KEY (`Id_region`) REFERENCES `region` (`Id`);

--
-- Constraints for table `detalle`
--
ALTER TABLE `detalle`
  ADD CONSTRAINT `detalle_ibfk_1` FOREIGN KEY (`Id_reserva`) REFERENCES `reserva` (`Id`),
  ADD CONSTRAINT `detalle_ibfk_2` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id`),
  ADD CONSTRAINT `detalle_ibfk_3` FOREIGN KEY (`Id_alojamiento`) REFERENCES `alojamiento` (`Direccion`);

--
-- Constraints for table `encuesta`
--
ALTER TABLE `encuesta`
  ADD CONSTRAINT `encuesta_ibfk_1` FOREIGN KEY (`Id_reserva`) REFERENCES `reserva` (`Id`);

--
-- Constraints for table `fotos`
--
ALTER TABLE `fotos`
  ADD CONSTRAINT `fotos_ibfk_1` FOREIGN KEY (`Id_alojamiento`) REFERENCES `alojamiento` (`Direccion`);

--
-- Constraints for table `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`Id_reserva`) REFERENCES `reserva` (`Id`),
  ADD CONSTRAINT `pago_ibfk_2` FOREIGN KEY (`Id_usuario`) REFERENCES `usuario` (`Id`);

--
-- Constraints for table `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`Id_estado`) REFERENCES `estado` (`Id`);

--
-- Constraints for table `tel_emp`
--
ALTER TABLE `tel_emp`
  ADD CONSTRAINT `tel_emp_ibfk_1` FOREIGN KEY (`Id_emp`) REFERENCES `empleado` (`Id`);

--
-- Constraints for table `tel_usu`
--
ALTER TABLE `tel_usu`
  ADD CONSTRAINT `tel_usu_ibfk_1` FOREIGN KEY (`Id_usu`) REFERENCES `usuario` (`Id`);

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`Id_Nac`) REFERENCES `nacionalidad` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

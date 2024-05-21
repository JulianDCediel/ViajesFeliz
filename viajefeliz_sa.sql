-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2024 at 05:01 AM
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
-- Database: `viajefeliz_sa`
--

-- --------------------------------------------------------

--
-- Table structure for table `alojamiento`
--

CREATE TABLE `alojamiento` (
  `Direccion` varchar(100) NOT NULL,
  `Id_empleado` int(11) DEFAULT NULL,
  `N_personas` int(11) DEFAULT NULL,
  `N_banos` int(11) DEFAULT NULL,
  `N_habitaciones` int(11) DEFAULT NULL,
  `Id_tipo` int(11) DEFAULT NULL,
  `P_min` int(11) DEFAULT NULL,
  `Mascotas` char(2) DEFAULT NULL,
  `Id_cal_aire` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alojamiento`
--

INSERT INTO `alojamiento` (`Direccion`, `Id_empleado`, `N_personas`, `N_banos`, `N_habitaciones`, `Id_tipo`, `P_min`, `Mascotas`, `Id_cal_aire`) VALUES
('calle20norte', 1028, 7, 2, 2, 2, 40000, 'Si', 3),
('calle36bsur#3a-90', 1028, 4, 2, 4, 1, 50000, 'si', 3),
('calle36Bsur#3A69', 1028, 10, 3, 6, 1, 25000, 'Si', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cal_aire`
--

CREATE TABLE `cal_aire` (
  `Id` int(11) NOT NULL,
  `Opcion` varchar(11) DEFAULT NULL
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
-- Table structure for table `empleado`
--

CREATE TABLE `empleado` (
  `Id` int(11) NOT NULL,
  `Nombres` varchar(50) NOT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `Contraseña` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `empleado`
--

INSERT INTO `empleado` (`Id`, `Nombres`, `Apellidos`, `Correo`, `Contraseña`) VALUES
(1028, 'Julian David', 'Cediel Gomez', 'david123@hotmail.com', 'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM='),
(1029, 'Manuel Alejandro', 'Cediel Cruz', 'alejo123@hotmail.com', '1GcfUdZkpupfMFEuSHrwN4+Q8hAHPQfm7dyL3zUV/oc=');

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
(1, 'ImagenesCasas\\\\c2_1.jpg', 'calle36bsur#3a-90'),
(1, 'ImagenesCasas\\\\c3_1.jpg', 'calle36Bsur#3A69'),
(2, 'ImagenesCasas\\\\c2_2.jpg', 'calle36bsur#3a-90');

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
  `Telefono` bigint(11) NOT NULL,
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
  `Tipo` varchar(6) DEFAULT NULL
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
  `Contraseña` varchar(200) NOT NULL
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
  ADD KEY `Id_cal_aire` (`Id_cal_aire`);

--
-- Indexes for table `cal_aire`
--
ALTER TABLE `cal_aire`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `empleado`
--
ALTER TABLE `empleado`
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
-- Constraints for dumped tables
--

--
-- Constraints for table `alojamiento`
--
ALTER TABLE `alojamiento`
  ADD CONSTRAINT `alojamiento_ibfk_1` FOREIGN KEY (`Id_empleado`) REFERENCES `empleado` (`Id`),
  ADD CONSTRAINT `alojamiento_ibfk_2` FOREIGN KEY (`Id_tipo`) REFERENCES `tipo` (`Id`),
  ADD CONSTRAINT `alojamiento_ibfk_3` FOREIGN KEY (`Id_cal_aire`) REFERENCES `cal_aire` (`Id`);

--
-- Constraints for table `fotos`
--
ALTER TABLE `fotos`
  ADD CONSTRAINT `fotos_ibfk_1` FOREIGN KEY (`Id_alojamiento`) REFERENCES `alojamiento` (`Direccion`);

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

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2026 at 05:14 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `austral`
--

-- --------------------------------------------------------

--
-- Table structure for table `autores`
--

CREATE TABLE `autores` (
  `id_autor` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `pais` varchar(60) DEFAULT NULL,
  `genero` enum('Cómic','Ensayo','Infantil','Novela','Poesía') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `autores`
--

INSERT INTO `autores` (`id_autor`, `nombre`, `pais`, `genero`) VALUES
(1, 'Elena Pizarro', 'Chile', 'Novela'),
(2, 'Harold Finch', 'Inglaterra', 'Ensayo'),
(3, 'Rodrigo Bahamonde', 'Chile', 'Poesía'),
(4, 'Valentina Correa', 'Argentina', 'Infantil'),
(5, 'Nora Keller', 'Estados Unidos', 'Novela'),
(6, 'Kenji Arakawa', NULL, 'Cómic');

-- --------------------------------------------------------

--
-- Table structure for table `colecciones`
--

CREATE TABLE `colecciones` (
  `id_coleccion` int(11) NOT NULL,
  `titulo` varchar(120) NOT NULL,
  `fecha_publicacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `colecciones`
--

INSERT INTO `colecciones` (`id_coleccion`, `titulo`, `fecha_publicacion`) VALUES
(1, 'Narrativa Austral', '2022-03-15'),
(2, 'Pensamiento y Verso', '2021-08-20'),
(3, 'Pequeños Lectores', '2023-04-10');

-- --------------------------------------------------------

--
-- Table structure for table `libros`
--

CREATE TABLE `libros` (
  `id_libro` int(11) NOT NULL,
  `id_autor` int(11) DEFAULT NULL,
  `id_coleccion` int(11) DEFAULT NULL,
  `titulo` varchar(120) NOT NULL,
  `paginas` int(11) DEFAULT NULL,
  `ejemplares_vendidos` int(11) DEFAULT NULL,
  `anio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `libros`
--

INSERT INTO `libros` (`id_libro`, `id_autor`, `id_coleccion`, `titulo`, `paginas`, `ejemplares_vendidos`, `anio`) VALUES
(1, 1, 1, 'Cielo de Enero', 210, 1600, 2024),
(2, 1, 1, 'Marea Baja', 185, 800, 2023),
(3, 1, 1, 'El Norte', 200, 2200, 2024),
(4, 2, 2, 'Estrellas que Caen', 240, 3000, 2022),
(5, 2, 2, 'Máquinas', 215, 450, 2024),
(6, 3, 2, 'Luz Artificial', 300, 1200, 2024),
(7, 3, 2, 'Ruido Blanco', 280, 600, 2023),
(8, 4, 3, 'El Barrio de Lila', 190, 5000, 2024),
(9, 4, 3, 'Antes del Amanecer', 205, 2700, 2024),
(10, 4, 3, 'La Calle 8', 175, 900, 2023),
(11, 5, 1, 'Flor de Hierro', 195, 4100, 2024),
(12, 5, 1, 'Hora Dorada', 220, 1800, 2022);

-- --------------------------------------------------------

--
-- Table structure for table `pagos`
--

CREATE TABLE `pagos` (
  `id_pago` int(11) NOT NULL,
  `id_autor` int(11) NOT NULL,
  `fecha_pago` date NOT NULL,
  `monto` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pagos`
--

INSERT INTO `pagos` (`id_pago`, `id_autor`, `fecha_pago`, `monto`) VALUES
(1, 1, '2026-03-31', 350000.00),
(2, 4, '2026-06-30', 510000.00),
(3, 2, '2026-06-30', 180000.00),
(4, 1, '2026-09-30', 420000.50);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`id_autor`);

--
-- Indexes for table `colecciones`
--
ALTER TABLE `colecciones`
  ADD PRIMARY KEY (`id_coleccion`);

--
-- Indexes for table `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id_libro`),
  ADD KEY `id_autor` (`id_autor`),
  ADD KEY `id_coleccion` (`id_coleccion`);

--
-- Indexes for table `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `id_autor` (`id_autor`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `autores`
--
ALTER TABLE `autores`
  MODIFY `id_autor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `colecciones`
--
ALTER TABLE `colecciones`
  MODIFY `id_coleccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `libros`
--
ALTER TABLE `libros`
  MODIFY `id_libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`id_autor`) REFERENCES `autores` (`id_autor`),
  ADD CONSTRAINT `libros_ibfk_2` FOREIGN KEY (`id_coleccion`) REFERENCES `colecciones` (`id_coleccion`);

--
-- Constraints for table `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_autor`) REFERENCES `autores` (`id_autor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

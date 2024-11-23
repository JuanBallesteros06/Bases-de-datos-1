-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS eventoprogramaciondos;
USE eventoprogramaciondos;

-- Tabla de Universidades (en plural)
CREATE TABLE IF NOT EXISTS universidades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    pais VARCHAR(255) NOT NULL
);

-- Tabla de Equipos (en plural)
CREATE TABLE IF NOT EXISTS equipos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    universidad_id INT,
    clasificado BOOLEAN NOT NULL,
    ultimo_ano_clasificado YEAR,
    FOREIGN KEY (universidad_id) REFERENCES universidades(id)
);

-- Tabla de Eventos (en plural)
CREATE TABLE IF NOT EXISTS eventos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    pais VARCHAR(255) NOT NULL,
    universidad_id INT,
    ano INT,
    FOREIGN KEY (universidad_id) REFERENCES universidades(id)
);

-- Insertar datos en la tabla universidades
INSERT INTO universidades (nombre, pais) VALUES
('Universidad A', 'Colombia'),
('Universidad B', 'Colombia'),
('Universidad C', 'Colombia'),
('Universidad D', 'Colombia'),
('Universidad E', 'Colombia'),
('Universidad F', 'Colombia'),
('Universidad G', 'Colombia'),
('Universidad H', 'Colombia'),
('Universidad I', 'Colombia'),
('Universidad J', 'Colombia');

-- Insertar datos en la tabla eventos
INSERT INTO eventos (nombre, pais, universidad_id, ano) VALUES
('Evento A1', 'Colombia', 1, 2022),
('Evento B1', 'Colombia', 2, 2021),
('Evento C1', 'Colombia', 3, 2023),
('Evento D1', 'Colombia', 4, 2020),
('Evento E1', 'Colombia', 5, 2022),
('Evento F1', 'Colombia', 6, 2021),
('Evento G1', 'Colombia', 7, 2023),
('Evento H1', 'Colombia', 8, 2022),
('Evento I1', 'Colombia', 9, 2023),
('Evento J1', 'Colombia', 10, 2021);

-- Insertar datos en la tabla equipos
INSERT INTO equipos (nombre, universidad_id, clasificado, ultimo_ano_clasificado) VALUES
('Equipo A1', 1, TRUE, 2022),
('Equipo A2', 2, FALSE, 2021),
('Equipo B1', 3, TRUE, 2023),
('Equipo B2', 4, FALSE, 2020),
('Equipo C1', 5, TRUE, 2022),
('Equipo C2', 6, FALSE, 2019),
('Equipo D1', 7, TRUE, 2021),
('Equipo D2', 8, FALSE, 2022),
('Equipo E1', 9, TRUE, 2023),
('Equipo E2', 10, FALSE, 2018);

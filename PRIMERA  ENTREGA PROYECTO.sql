-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS Proyecto;
USE Proyecto;

-- Creación de la tabla Eventos
CREATE TABLE Eventos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    FechaHora DATETIME NOT NULL,
    Descripcion TEXT,
    Lugar VARCHAR(100)
);

-- Creación de la tabla Categoria
CREATE TABLE Categoria (
    Id_Categoria INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Dificultad VARCHAR(20)
);

-- Creación de la tabla Ejercicios
CREATE TABLE Ejercicios (
    Id_Ejercicio INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Nivel VARCHAR(20),
    Puntaje INT,
    Tiempo_Limite INT,
    Id_Categoria INT,
    FOREIGN KEY (Id_Categoria) REFERENCES Categoria(Id_Categoria)
);

-- Creación de la tabla Equipo
CREATE TABLE Equipo (
    Id_Equipo INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Numero_Participantes INT,
    Puntaje_Obtenido INT
);

-- Creación de la tabla Participantes
CREATE TABLE Participantes (
    Id_Participante INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Edad INT,
    Contacto VARCHAR(15),
    Puntaje_Obtenido INT,
    Id_Equipo INT,
    FOREIGN KEY (Id_Equipo) REFERENCES Equipo(Id_Equipo)
);

-- Relación entre Eventos y Equipos (muchos a muchos)
CREATE TABLE Evento_Equipo (
    Id_Evento INT,
    Id_Equipo INT,
    PRIMARY KEY (Id_Evento, Id_Equipo),
    FOREIGN KEY (Id_Evento) REFERENCES Eventos(id),
    FOREIGN KEY (Id_Equipo) REFERENCES Equipo(Id_Equipo)
);

-- Relación entre Ejercicios y Participantes (muchos a muchos)
CREATE TABLE Participante_Ejercicio (
    Id_Participante INT,
    Id_Ejercicio INT,
    PRIMARY KEY (Id_Participante, Id_Ejercicio),
    FOREIGN KEY (Id_Participante) REFERENCES Participantes(Id_Participante),
    FOREIGN KEY (Id_Ejercicio) REFERENCES Ejercicios(Id_Ejercicio)
);

-- Inserciones para la tabla Eventos
INSERT INTO Eventos (Nombre, FechaHora, Descripcion, Lugar) VALUES
('Evento 1', '2023-10-01 10:00:00', 'Competencia de programación', 'Ciudad A'),
('Evento 2', '2023-10-15 14:00:00', 'Hackathon', 'Ciudad B'),
('Evento 3', '2023-11-05 09:00:00', 'Maratón de algoritmos', 'Ciudad C'),
('Evento 4', '2023-11-20 12:00:00', 'Competencia regional', 'Ciudad D'),
('Evento 5', '2023-12-01 08:00:00', 'Final nacional', 'Ciudad E'),
('Evento 6', '2023-12-15 11:00:00', 'Hackathon universitario', 'Ciudad F'),
('Evento 7', '2023-12-20 10:00:00', 'Concurso de código abierto', 'Ciudad G'),
('Evento 8', '2024-01-10 15:00:00', 'Competencia internacional', 'Ciudad H'),
('Evento 9', '2024-01-25 09:30:00', 'Desafío de código', 'Ciudad I'),
('Evento 10', '2024-02-05 13:00:00', 'Maratón de programación', 'Ciudad J');

-- Inserciones para la tabla Categoria
INSERT INTO Categoria (Nombre, Dificultad) VALUES
('Algoritmos', 'Media'),
('Estructuras de Datos', 'Alta'),
('Matemáticas', 'Baja'),
('Grafos', 'Alta'),
('Programación Dinámica', 'Alta'),
('Teoría de números', 'Media'),
('Bases de datos', 'Baja'),
('Optimización', 'Alta'),
('Geometría Computacional', 'Alta'),
('Cadenas de texto', 'Media');

-- Inserciones para la tabla Ejercicios
INSERT INTO Ejercicios (Nombre, Nivel, Puntaje, Tiempo_Limite, Id_Categoria) VALUES
('Ejercicio 1', 'Media', 100, 60, 1),
('Ejercicio 2', 'Alta', 150, 90, 2),
('Ejercicio 3', 'Baja', 50, 45, 3),
('Ejercicio 4', 'Alta', 200, 120, 4),
('Ejercicio 5', 'Alta', 180, 110, 5),
('Ejercicio 6', 'Media', 120, 70, 6),
('Ejercicio 7', 'Baja', 60, 40, 7),
('Ejercicio 8', 'Alta', 190, 100, 8),
('Ejercicio 9', 'Alta', 170, 95, 9),
('Ejercicio 10', 'Media', 110, 55, 10);

-- Inserciones para la tabla Equipo
INSERT INTO Equipo (Nombre, Numero_Participantes, Puntaje_Obtenido) VALUES
('Equipo A', 5, 100),
('Equipo B', 4, 80),
('Equipo C', 6, 120),
('Equipo D', 3, 95),
('Equipo E', 5, 110),
('Equipo F', 4, 85),
('Equipo G', 6, 130),
('Equipo H', 5, 90),
('Equipo I', 3, 105),
('Equipo J', 4, 115);

-- Inserciones para la tabla Participantes
INSERT INTO Participantes (Nombre, Edad, Contacto, Puntaje_Obtenido, Id_Equipo) VALUES
('Juan', 20, '123456789', 100, 1),
('Pedro', 22, '234567891', 80, 2),
('Maria', 19, '345678912', 120, 3),
('Lucia', 21, '456789123', 95, 4),
('Carlos', 23, '567891234', 110, 5),
('Ana', 22, '678912345', 85, 6),
('Luis', 20, '789123456', 130, 7),
('Paula', 21, '891234567', 90, 8),
('Miguel', 22, '912345678', 105, 9),
('Sofia', 23, '101234567', 115, 10);

-- Inserciones en la tabla Evento_Equipo
INSERT INTO Evento_Equipo (Id_Evento, Id_Equipo) VALUES
(1, 1), -- Evento 1 con Equipo A
(1, 2), -- Evento 1 con Equipo B
(2, 1), -- Evento 2 con Equipo A
(2, 3), -- Evento 2 con Equipo C
(3, 4), -- Evento 3 con Equipo D
(3, 5), -- Evento 3 con Equipo E
(4, 6), -- Evento 4 con Equipo F
(5, 7), -- Evento 5 con Equipo G
(5, 8), -- Evento 5 con Equipo H
(6, 9), -- Evento 6 con Equipo I
(7, 10); -- Evento 7 con Equipo J

INSERT INTO Participante_Ejercicio (Id_Participante, Id_Ejercicio) VALUES
(1, 1),  -- Juan hace Ejercicio 1 (Puntaje 100)
(1, 2),  -- Juan hace Ejercicio 2 (Puntaje 150)
(2, 3),  -- Pedro hace Ejercicio 3 (Puntaje 50)
(3, 4),  -- Maria hace Ejercicio 4 (Puntaje 200)
(4, 5),  -- Lucia hace Ejercicio 5 (Puntaje 180)
(5, 6),  -- Carlos hace Ejercicio 6 (Puntaje 120)
(6, 7),  -- Ana hace Ejercicio 7 (Puntaje 60)
(7, 8),  -- Luis hace Ejercicio 8 (Puntaje 190)
(8, 9),  -- Paula hace Ejercicio 9 (Puntaje 170)
(9, 10); -- Miguel hace Ejercicio 10 (Puntaje 110)



-- Consulta 1: Sumar los puntajes obtenidos por cada equipo en un evento y mostrar solo los equipos con más de 175 puntos.
SELECT E.Nombre AS Evento, 
       EQ.Nombre AS Equipo, 
       SUM(EX.Puntaje) AS Total_Puntaje
FROM Evento_Equipo EE
JOIN Eventos E ON EE.Id_Evento = E.id
JOIN Equipo EQ ON EE.Id_Equipo = EQ.Id_Equipo
JOIN Participantes P ON EQ.Id_Equipo = P.Id_Equipo
JOIN Participante_Ejercicio PE ON P.Id_Participante = PE.Id_Participante
JOIN Ejercicios EX ON PE.Id_Ejercicio = EX.Id_Ejercicio
GROUP BY E.Nombre, EQ.Nombre
HAVING SUM(EX.Puntaje) > 175;


-- Consulta 2: Obtener la cantidad de ejercicios en cada categoría que tienen un puntaje mayor a 100.
SELECT C.Nombre AS Categoria, COUNT(E.Id_Ejercicio) AS Total_Ejercicios
FROM Ejercicios E
JOIN Categoria C ON E.Id_Categoria = C.Id_Categoria
WHERE E.Puntaje > 100
GROUP BY C.Nombre
HAVING COUNT(E.Id_Ejercicio) > 0;
-- Consulta 3: Obtener el nombre del equipo con más puntaje.
SELECT Nombre
FROM Equipo
WHERE Puntaje_Obtenido = (SELECT MAX(Puntaje_Obtenido) FROM Equipo);

-- Consulta 4: Listar los participantes cuyo puntaje es mayor que el puntaje promedio de todos los participantes.
SELECT Nombre, Puntaje_Obtenido
FROM Participantes
WHERE Puntaje_Obtenido > (SELECT AVG(Puntaje_Obtenido) FROM Participantes);
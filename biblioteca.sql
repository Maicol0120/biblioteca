-- Crear base de datos
CREATE DATABASE Biblioteca;
USE Biblioteca;

-- Tabla Ubicacion
CREATE TABLE Ubicacion (
    id_ubicacion INT PRIMARY KEY AUTO_INCREMENT,
    pais VARCHAR(100),
    ciudad VARCHAR(100),
    direccion VARCHAR(200)
);

-- Tabla Editorial
CREATE TABLE Editorial (
    id_editorial INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(150) NOT NULL,
    id_ubicacion INT,
    FOREIGN KEY (id_ubicacion) REFERENCES Ubicacion(id_ubicacion)
);

-- Tabla Tipo_Publicacion
CREATE TABLE Tipo_Publicacion (
    id_tipo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla Publicacion
CREATE TABLE Publicacion (
    id_publicacion INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(200) NOT NULL,
    anio INT,
    id_tipo INT,
    id_editorial INT,
    FOREIGN KEY (id_tipo) REFERENCES Tipo_Publicacion(id_tipo),
    FOREIGN KEY (id_editorial) REFERENCES Editorial(id_editorial)
);

-- Tabla Autor
CREATE TABLE Autor (
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(150) NOT NULL,
    tipo_autor VARCHAR(50)
);

-- Tabla intermedia Publicacion_Autor
CREATE TABLE Publicacion_Autor (
    id_publicacion INT,
    id_autor INT,
    PRIMARY KEY (id_publicacion, id_autor),
    FOREIGN KEY (id_publicacion) REFERENCES Publicacion(id_publicacion),
    FOREIGN KEY (id_autor) REFERENCES Autor(id_autor)
);

-- Tabla Descriptor
CREATE TABLE Descriptor (
    id_descriptor INT PRIMARY KEY AUTO_INCREMENT,
    palabra_clave VARCHAR(100)
);

-- Tabla intermedia Publicacion_Descriptor
CREATE TABLE Publicacion_Descriptor (
    id_publicacion INT,
    id_descriptor INT,
    PRIMARY KEY (id_publicacion, id_descriptor),
    FOREIGN KEY (id_publicacion) REFERENCES Publicacion(id_publicacion),
    FOREIGN KEY (id_descriptor) REFERENCES Descriptor(id_descriptor)
);

-- Tabla Volumen (para revistas o publicaciones seriadas)
CREATE TABLE Volumen (
    id_volumen INT PRIMARY KEY AUTO_INCREMENT,
    numero_volumen INT,
    numero_edicion INT,
    id_publicacion INT,
    FOREIGN KEY (id_publicacion) REFERENCES Publicacion(id_publicacion)
);

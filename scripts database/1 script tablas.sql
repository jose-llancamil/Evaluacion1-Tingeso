-- Tabla Estudiante
CREATE TABLE Estudiante (
    RUT VARCHAR(20) PRIMARY KEY,
    Apellidos VARCHAR(255),
    Nombres VARCHAR(255),
    FechaNacimiento DATE,
    TipoColegioProcedencia VARCHAR(50),
    NombreColegio VARCHAR(255),
    AnioEgresoColegio INT
);

-- Tabla Matrícula
CREATE TABLE Matricula (
    IDMatricula INT PRIMARY KEY AUTO_INCREMENT,
    MontoMatricula DECIMAL(10, 2)
);

-- Tabla Arancel de Estudio
CREATE TABLE ArancelEstudio (
    IDArancel INT PRIMARY KEY AUTO_INCREMENT,
    MontoArancel DECIMAL(10, 2),
    TipoColegioProcedencia VARCHAR(50),
    AniosDesdeEgreso INT,
    PorcentajeDescuento DECIMAL(5, 2)
);

-- Tabla Pago
CREATE TABLE Pago (
    IDPago INT PRIMARY KEY AUTO_INCREMENT,
    FechaPago DATE,
    MontoPagado DECIMAL(10, 2),
    TipoPago VARCHAR(50),
    NumeroCuotasPagadas INT,
    NumeroTotalCuotasPactadas INT,
    InteresPorAtraso DECIMAL(5, 2),
    IDEstudiante VARCHAR(20),
    IDMatricula INT,
    IDArancel INT,
    FOREIGN KEY (IDEstudiante) REFERENCES Estudiante(RUT),
    FOREIGN KEY (IDMatricula) REFERENCES Matricula(IDMatricula),
    FOREIGN KEY (IDArancel) REFERENCES ArancelEstudio(IDArancel)
);

-- Tabla Exámenes
CREATE TABLE Examenes (
    IDExamen INT PRIMARY KEY AUTO_INCREMENT,
    FechaExamen DATE,
    PuntajeObtenido INT,
    IDEstudiante VARCHAR(20),
    FOREIGN KEY (IDEstudiante) REFERENCES Estudiante(RUT)
);

-- Tabla Cuotas
CREATE TABLE Cuotas (
    IDCuota INT PRIMARY KEY AUTO_INCREMENT,
    NumeroCuota INT,
    MontoCuota DECIMAL(10, 2),
    FechaVencimiento DATE,
    IDPago INT,
    FOREIGN KEY (IDPago) REFERENCES Pago(IDPago)
);

-- Tablas intermedias
-- Descuentos
CREATE TABLE Descuentos (
    IDDescuento INT PRIMARY KEY AUTO_INCREMENT,
    TipoColegioProcedencia VARCHAR(50),
    AniosDesdeEgreso INT,
    PorcentajeDescuento DECIMAL(5, 2)
);

-- Máximas Cuotas
CREATE TABLE MaximasCuotas (
    IDMaximaCuota INT PRIMARY KEY AUTO_INCREMENT,
    TipoColegioProcedencia VARCHAR(50),
    NumeroMaximoCuotas INT
);

-- Descuentos por Puntaje
CREATE TABLE DescuentosPorPuntaje (
    IDDescuentoPorPuntaje INT PRIMARY KEY AUTO_INCREMENT,
    RangoPuntaje VARCHAR(20),
    PorcentajeDescuento DECIMAL(5, 2)
);
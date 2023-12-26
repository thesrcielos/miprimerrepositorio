--Diego Macia
--Santiago Avellaneda
//CICLO 1: TABLAS
CREATE TABLE Persona(
    id NUMBER(9) NOT NULL,
    tipo CHAR(2) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    nombre VARCHAR2(50),
    registro DATE NOT NULL,
    celular NUMBER(10) NOT NULL,
    correo VARCHAR2(50) NOT NULL
);

CREATE TABLE Conductor(
    licencia VARCHAR2(10) NOT NULL,
    idPersona NUMBER(9) NOT NULL,
    fechaNacimiento DATE NOT NULL,
    estrellas NUMBER(1) NOT NULL,
    estado CHAR(1) NOT NULL
);
CREATE TABLE Vehiculo(
    licenciaConductor NUMBER(9) NOT NULL,
    a_o NUMBER(4) NOT NULL,
    placa VARCHAR2(30) NOT NULL,
    tipo CHAR(1) NOT NULL,
    estado CHAR(1) NOT NULL,
    puertas NUMBER(3),
    pasajeros NUMBER(3),
    carga NUMBER(3) 
);

CREATE TABLE Cliente(
    idPersona NUMBER(9) NOT NULL,
    idioma VARCHAR2(10) NOT NULL
);
CREATE TABLE Tarjeta(
    numero NUMBER(15) NOT NULL,
    entidad VARCHAR2(10) NOT NULL,
    vencimiento DATE NOT NULL
);
CREATE TABLE TipoTarjeta(
    idCliente NUMBER(9) NOT NULL,
    numeroTarjeta NUMBER(15) NOT NULL
);
CREATE TABLE Solicitud(
    codigo NUMBER(9) NOT NULL,
    idCliente NUMBER(9) NOT NULL,
    fechaCreacion DATE NOT NULL,
    fechaViaje DATE,
    precio NUMBER(5),
    plataforma CHAR(1) NOT NULL,
    estado CHAR(1) NOT NULL,
    posInicial NUMBER(9) NOT NULL,
    posFinal NUMBER(9) NOT NULL
);

CREATE TABLE Requerimientos(
    idCodigo NUMBER(9) NOT NULL,
    detalle VARCHAR2(15) NOT NULL
);

CREATE TABLE Posicion(
    id NUMBER(9) NOT NULL,
    latitud NUMBER(5,2) NOT NULL,
    longitud NUMBER(5,2) NOT NULL
);

CREATE TABLE PQRS(
    ticked CHAR(13) NOT NULL,
    codSolicitud NUMBER(9) NOT NULL,
    radicacion DATE NOT NULL,
    cierre DATE,
    descripcion VARCHAR2(255),
    tipo CHAR(1) NOT NULL,
    estado CHAR(1) NOT NULL
);
CREATE TABLE Anexo(
    tickedPQRS CHAR(13) NOT NULL,
    nombre VARCHAR2(20) NOT NULL,
    URL VARCHAR2(100) NOT NULL
);
CREATE TABLE PQRSRespuesta(
    tickedPQRS CHAR(13) NOT NULL,
    fecha DATE NOT NULL,
    nombre VARCHAR2(20) NOT NULL,
    correo VARCHAR2(50) NOT NULL,
    comentario VARCHAR2(20),
    evaluacion NUMBER(1)

);
//CICLO 1: PoblarOK
INSERT INTO Persona (id, TID, numero, nombre, registro, celular, correo)
VALUES (123456789, 'CC', '1234567890', 'Juan Perez Gonzalez', '01/01/1980', 1234567890, 'juan.perez@example.com');

INSERT INTO Persona (id, TID, numero, nombre, registro, celular, correo)
VALUES (987654321, 'CC', '9876543210', 'Maria Rodriguez Lopez', '02/15/1990', 9876543210, 'maria.rodriguez@example.com');

INSERT INTO Persona (id, TID, numero, nombre, registro, celular, correo)
VALUES (111111111, 'TI', '1234567890', 'Laura Torres Gómez', '05/12/2008', 3001234567, 'laura.torres@example.com');

INSERT INTO Vehiculo (licenciaConductor, a_o, placa, tipo, estado, puertas, pasajeros, carga)
VALUES (123456789, 2020, 'ABC123', 'A', 'A', 4, 5, 100);

INSERT INTO Vehiculo (licenciaConductor, a_o, placa, tipo, estado, puertas, pasajeros, carga)
VALUES (123456789, 2020, 'ABC123', 'M', 'A', 4, 5, 100);

INSERT INTO Vehiculo (licenciaConductor, a_o, placa, tipo, estado, puertas, pasajeros, carga)
VALUES (987654321, 2018, 'XYZ789', 'C', 'A', 2, 2, 50);

INSERT INTO Vehiculo (licenciaConductor, a_o, placa, tipo, estado, puertas, pasajeros, carga)
VALUES (555555555, 2019, 'DEF456', 'A', 'I', 4, 7, 200);

INSERT INTO Solicitud (codigo, idCliente, fechaCreacion, fechaViaje, precio, plataforma, estado, posInicial, posFinal)
VALUES (1, 123456789, '10/05/2023', '10/10/2023', 1500, 'P', 'A', 100000001, 200000002);

INSERT INTO Solicitud (codigo, idCliente, fechaCreacion, fechaViaje, precio, plataforma, estado, posInicial, posFinal)
VALUES (2, 987654321, '20/9/2023', '25/09/2023', 1200, 'C', 'F', 200000003, 300000004);

INSERT INTO Solicitud (codigo, idCliente, fechaCreacion, fechaViaje, precio, plataforma, estado, posInicial, posFinal)
VALUES (1, 186654321, '14/05/2023', '14/10/2023', 1500, 'C', 'P', 100000001, 200000002);

INSERT INTO PQRS (ticked, codSolicitud, radicacion, cierre, descripcion, tipo, estado)
VALUES ('A123456789012', 1, '10/05/2023', '10/10/2023', 'Descripción de la PQRS P', 'P', 'A');

INSERT INTO PQRS (ticked, codSolicitud, radicacion, cierre, descripcion, tipo, estado)
VALUES ('B987654321012', 2, '30/07/2023', '1/08/2023', 'Descripción de la PQRS Q', 'Q', 'C');

INSERT INTO PQRS (ticked, codSolicitud, radicacion, cierre, descripcion, tipo, estado)
VALUES ('C555555555012', 3, '24/12/2022', NULL, 'Descripción de la PQRS R', 'R', 'A');

INSERT INTO PQRSRespuesta (tickedPQRS, fecha, nombre, correo, comentario, evaluacion)
VALUES ('A123456789012', '05/10/2023', 'Juan Perez', 'juan.perez@example.com', 'Comentario 1', 4);

INSERT INTO PQRSRespuesta (tickedPQRS, fecha, nombre, correo, comentario, evaluacion)
VALUES ('B987654321012', '20/09/2023', 'Maria Rodriguez', 'maria.rodriguez@example.com', 'Comentario 2', 5);

INSERT INTO PQRSRespuesta (tickedPQRS, fecha, nombre, correo, comentario, evaluacion)
VALUES ('C555555555012', '15/09/2023', 'Ana Diaz', 'ana.diaz@example.com', NULL, 3);

//CICLO 1: PoblarNoOK

//2) no debería permitirse y no se permite
//estado debe ser un char de un caracter
insert into Conductor (licencia, idPersona, fechaNacimiento, estrellas, estado) values (99183418, 654, '02-04-2023', 2, 'ir');
//numero de licencia no debe superar los 9 digitos
insert into Conductor (licencia, idPersona, fechaNacimiento, estrellas, estado) values (9918341899, 654, '02-04-2023', 2, 'A');
//tipo debe ser un char de dos caracteres
insert into Persona (id, tipo, numero, nombre, registro, celular, correo) values (38, 12, 14432589305598, 'Bronson', '3/29/2023', 10000000000, 'bkirkbride0@wikia.com');
//id no puede ser nulo
insert into Persona (id, tipo, numero, nombre, registro, celular, correo) values (null, 'TI', 1443258930, 'Bronson', '3/9/2023', 1000000000, 'bkirkbride0@wikia.com');
// la latitud debe tener maximo dos decimales y la longitud maximo 3 digitos en la parte entera
insert into Posicion(id,latitud,longitud) values (1,456.234,4567.12);

//3) no debería permitirse y todavía se permite
//No puede haber dos filas con el mismo tipo y numero deben ser valores unicos
insert into Persona (id, tipo, numero, nombre, registro, celular, correo) values (38, 'TI', 1443258938, 'Bronson', '3/5/2023', 10000000, 'bkirkbride0@wikia.com');
insert into Persona (id, tipo, numero, nombre, registro, celular, correo) values (39, 'TI', 1443258938, 'Bronson', '3/2/2023', 10000000, 'bkkbride0@wikia.com');
//no se puede poner un numero de estrellas fuera del rango entre 1 y 5
insert into Conductor (licencia, idPersona, fechaNacimiento, estrellas, estado) values (99183419, 654, '02-04-2023', -2, 'A');
//no se puede poner un estado que no sea A I R o O
insert into Conductor (licencia, idPersona, fechaNacimiento, estrellas, estado) values (9918899, 654, '02-04-2023', 2, 'P');
//el numero de puertas debe ser mayor a 0
insert into Vehiculo(licenciaConducto,a_o,placa,tipo,estado,puertas,pasajeros,carga) values(1,2000,'axd-345','R','R',-1,2,4);

//Ciclo 1: elimina datos
DELETE FROM Conductor;
DELETE FROM Solicitud;
DELETE FROM Posicion;
DELETE FROM Cliente;
DELETE FROM Persona;
DELETE FROM PQRSRespuesta;
DELETE FROM PQRS;
DELETE FROM Vehiculo;
DELETE FROM Requerimientos;

DROP TABLE Conductor;
DROP TABLE Solicitud;
DROP TABLE Posicion;
DROP TABLE Cliente;
DROP TABLE Persona;
DROP TABLE PQRSRespuesta;
DROP TABLE PQRS;
DROP TABLE Vehiculo;
DROP TABLE Requerimientos;



//CICLO 1: CLAVES Y ATRIBUTOS
//Persona
ALTER TABLE Persona ADD CONSTRAINT Persona_tipo_CK
CHECK (tipo IN ('TI','CC'));

ALTER TABLE Persona ADD CONSTRAINT Persona_correo_CK
CHECK (REGEXP_LIKE(correo, '^.+@.+\..+$'));

//1
ALTER TABLE Persona ADD CONSTRAINT Persona_celular_CK 
CHECK (length(celular)=10);

ALTER TABLE Persona ADD CONSTRAINT Persona_PK
PRIMARY KEY (id);

ALTER TABLE Persona ADD CONSTRAINT Persona_tipo_numero_UK
UNIQUE KEY (tipo,numero);
//Conductor

ALTER TABLE Conductor ADD CONSTRAINT Conductor_estrellas_CK 
CHECK (estrellas BETWEEN 1 AND 5);

ALTER TABLE Persona ADD CONSTRAINT Conductor_estado_CK
CHECK (estado IN ('A','I','R','O'));

ALTER TABLE Conductor ADD CONSTRAINT Conductor_PK
PRIMARY KEY (licencia);

ALTER TABLE Conductor ADD CONSTRAINT Conductor_Persona_FK
FOREIGN KEY (idPersona) REFERENCES Persona(id);

//Vehiculo
ALTER TABLE Vehiculo ADD CONSTRAINT Vehiculo_a_o_CK 
CHECK (a_o >= 1900);

ALTER TABLE Vehiculo ADD CONSTRAINT Vehiculo_estado_CK
CHECK (estado IN ('A','I','R','O'));

ALTER TABLE Vehiculo ADD CONSTRAINT Vehiculo_puertas_carga_pasajeros_CK 
CHECK (puertas > 0 AND carga > 0 AND pasajeros > 0);

ALTER TABLE Vehiculo ADD CONSTRAINT Vehiculo_PK
PRIMARY KEY (placa);

ALTER TABLE Vehiculo ADD CONSTRAINT Vehiculo_Conductor_FK
FOREIGN KEY (licenciaConductor) REFERENCES Conductor(licencia);

//Cliente
ALTER TABLE Cliente ADD CONSTRAINT Cliente_Persona_FK
FOREIGN KEY (idPersona) REFERENCES Persona(id);

ALTER TABLE Cliente ADD CONSTRAINT Cliente_PK
PRIMARY KEY (idPersona);

//Tarjeta
ALTER TABLE Tarjeta ADD CONSTRAINT Tarjeta_PK
PRIMARY KEY (numero);

//TipoTarjeta
ALTER TABLE TipoTarjeta ADD CONSTRAINT TipoTarjeta_Cliente_FK
FOREIGN KEY (idCliente) REFERENCES Cliente(idPersona);

ALTER TABLE TipoTarjeta ADD CONSTRAINT TipoTarjeta_Tarjeta_FK
FOREIGN KEY (numeroTarjeta) REFERENCES Tarjeta(numero);

//Posicion
ALTER TABLE Posicion ADD CONSTRAINT Posicion_PK
PRIMARY KEY (id);

//Solicitud
ALTER TABLE Solicitud ADD CONSTRAINT Solicitud_precio_CK 
CHECK (precio > 0 AND MOD(precio,100) = 0);

ALTER TABLE SOLICITUD ADD CONSTRAINT Solicitud_estado_CK
CHECK (tipo IN ('P','A','C','F'));

ALTER TABLE Solicitud ADD CONSTRAINT Solicitud_PK
PRIMARY KEY (codigo);

ALTER TABLE Solicitud ADD CONSTRAINT Solicitud_Cliente_FK
FOREIGN KEY (idCliente) REFERENCES Cliente(idPersona);

ALTER TABLE Solicitud ADD CONSTRAINT Solicitd_PosicionInicial_FK
FOREIGN KEY (posInicial) REFERENCES Posicion(id);

ALTER TABLE Solicitud ADD CONSTRAINT Solicitd_PosicionFinal_FK
FOREIGN KEY (posFinal) REFERENCES Posicion(id);

//Requerimientos
ALTER TABLE Requerimientos ADD CONSTRAINT Requerimientos_detalle_CK 
CHECK (detalle LIKE 'MUSICA%' OR detalle LIKE 'IDIOMA%' OR detalle LIKE 'RUTA%');

ALTER TABLE Requerimientos ADD CONSTRAINT Requerimientos_Solicitud_FK
FOREIGN KEY (idCodigo) REFERENCES Solicitud(codigo);

//PQRS
ALTER TABLE PQRS ADD CONSTRAINT PQRS_ticked_CK
CHECK (REGEXP_LIKE(ticked, '^[A-Za-z][0-9]{12}$'));

ALTER TABLE PQRS ADD CONSTRAINT PQRS_tipo_CK
CHECK (tipo IN ('P','Q','R','S'));

ALTER TABLE PQRS ADD CONSTRAINT PQRS_estado_CK
CHECK (estado IN ('A','C','R'));

//2
ALTER TABLE PQRS ADD CONSTRAINT PQRS_radicacion_CK
CHECK (EXTRACT(YEAR FROM radicacion)>= 2009);


ALTER TABLE PQRS ADD CONSTRAINT PQRS_PK
PRIMARY KEY (ticked);

ALTER TABLE PQRS ADD CONSTRAINT PQRS_Solicitd_FK
FOREIGN KEY (codSolicitud) REFERENCES Solicitud(Codigo);

//Anexo
ALTER TABLE Anexo ADD CONSTRAINT Anexo_URL_CK
CHECK (REGEXP_LIKE(URL, '^https://'));

ALTER TABLE Anexo ADD CONSTRAINT Anexo_PQRS_FK
FOREIGN KEY (tickedPQRS) REFERENCES PQRS(ticked);

ALTER TABLE Anexo ADD CONSTRAINT Anexo_UK
UNIQUE KEY (URL);

//PQRSRespuesta
ALTER TABLE PQRSRespuesta ADD CONSTRAINT PQRSRespuesta_correo_CK
CHECK (REGEXP_LIKE(correo, '^.+@.+\..+$'));

ALTER TABLE PQRSRespuesta ADD CONSTRAINT PQRSRespuesta_evaluacion_CK 
CHECK (evaluacion BETWEEN 1 AND 5);

ALTER TABLE PQRSRespuesta ADD CONSTRAINT PQRSRespuesta_PQRS_FK
FOREIGN KEY (tickedPQRS) REFERENCES PQRS(ticked);

//3) paso 3) del punto anterior y para cada uno de ellos indique el nombre de la restricción que los protege.
//1 y 2 Persona_tipo_numero_UK
//3 Conductor_estrellas_CK
//4 Conductor_estado_CK
//5 Vehiculo_puertas_carga_pasajeros_CK

//4) otros cinco casos que ilustren la protección de la bases de datos
//VEHICULO_PUERTAS_CARGA_PASAJEROS_CK
insert into Vehiculo(licenciaConductor,a_o,placa,tipo,estado,puertas,pasajeros,carga) values(1,2000,'axd-345','A','R',1,2,-4);
//PERSONA_CORREO_CK
insert into Persona (id, tipo, numero, nombre, registro, celular, correo) values (38, 'TI', 1443258938, 'Bronson', '3/5/2023', 10000000, 'bkirwikia.com');
//PERSONA_TIPO_CK
insert into Persona (id, tipo, numero, nombre, registro, celular, correo) values (40, 'PP', 144328938, 'Bronson', '3/5/2023', 10000000, 'bkirkbride0@wikia.com');
//PQRS_TICKED_CK
insert into PQRS(ticked,codSolicitud,radicacion,cierre,descripcion,tipo,estado) values('1234567891111',1,'19/10/2020',null,null,'Q','A');
//SOLICITUD_PRECIO_CK
INSERT INTO Solicitud (codigo, idCliente, fechaCreacion, fechaViaje, precio, plataforma, estado, posInicial, posFinal)
VALUES (1, 123456789, '10/05/2023', '10/10/2023', 15555, 'P', 'A', 100000001, 200000002);

//CICLO 1: CONSULTA VIAJES CON REQUERIMIENTO DE MUSICA
SELECT * FROM Solicitud s
JOIN Requerimientos r ON s.codigo = r.idCodigo
WHERE r.detalle LIKE 'MUSICA%';

//CICLO 1: Consultar clientes con mayores montos acumulados en solicitudes
SELECT idPersona, idioma, SUM(precio) AS Monto FROM Cliente c
JOIN Solicitud s ON c.idPersona = s.idCliente
WHERE s.estado = 'F'
GROUP BY idPersona,idioma ORDER BY Monto DESC;

//CICLO 1: Consulta los vehiculos y el idPersona sus conductores con un numero de pasajeros mayor a 3 
SELECT idPersona, placa, a_o, tipo, v.estado, puertas, pasajeros, carga FROM Vehiculo v
JOIN Conductor c ON v.licenciaConductor = c.licencia
WHERE pasajeros > 3;

INSERT INTO Persona (id, tipo, numero, nombre, registro, celular, correo)
VALUES (123456789, 'CC', '123456790', 'Juan Perez Gonzalez', '01/01/1980', 1234567890, 'juan.perez@example.com');
INSERT INTO Persona (id, tipo, numero, nombre, registro, celular, correo)
VALUES (123156799, 'CC', '987654320', 'Maria Rodriguez Lopez', '02/5/1990', 9876543210, 'maria.rodriguez@example.com');
INSERT INTO Persona (id, tipo, numero, nombre, registro, celular, correo)
VALUES (123156789, 'TI', '12345690', 'Laura Torres Gómez', '05/2/2008', 3001234567, 'laura.torres@example.com');
INSERT INTO Persona (id, tipo, numero, nombre, registro, celular, correo)
VALUES (12567919, 'CC', '1233880', 'Laura Martinez', '05/2/2008', 3001234567, 'laura.LLs@example.com');
INSERT INTO Persona (id, tipo, numero, nombre, registro, celular, correo)
VALUES (12367819, 'CC', '1238820', 'Laura Martinez', '05/2/2008', 3001234567, 'laura.LLs@example.com');

INSERT INTO Persona (id, tipo, numero, nombre, registro, celular, correo)
VALUES (11111111, 'CC', '11111111', 'Juan Perez Gonzalez', '01/01/1980', 1234567890, 'juan.perez@example.com');
INSERT INTO Persona (id, tipo, numero, nombre, registro, celular, correo)
VALUES (3211, 'CC', '3211', 'Maria Rodriguez Lopez', '02/5/1990', 9876543210, 'maria.rodriguez@example.com');
INSERT INTO Persona (id, tipo, numero, nombre, registro, celular, correo)
VALUES (1211111, 'TI', '1211111', 'Laura Torres Gómez', '05/2/2008', 3001234567, 'laura.torres@example.com');
INSERT INTO Persona (id, tipo, numero, nombre, registro, celular, correo)
VALUES (12231, 'CC', '12231', 'Laura Martinez', '05/2/2008', 3001234567, 'laura.LLs@example.com');
INSERT INTO Persona (id, tipo, numero, nombre, registro, celular, correo)
VALUES (1110111, 'CC', '1110111', 'Laura Martinez', '05/1/2008', 3001234567, 'laura.LLs@example.com');

insert into Conductor (licencia, idPersona, fechaNacimiento, estrellas, estado) values (123456789, 654, '02-04-2023', 2, 'A');
insert into Conductor (licencia, idPersona, fechaNacimiento, estrellas, estado) values (123156799, 65, '02-04-2023', 4, 'A');
insert into Conductor (licencia, idPersona, fechaNacimiento, estrellas, estado) values (123156789, 64, '02-04-2023', 2, 'R');
insert into Conductor (licencia, idPersona, fechaNacimiento, estrellas, estado) values (12567919, 685, '02-04-2023', 4, 'I');
insert into Conductor (licencia, idPersona, fechaNacimiento, estrellas, estado) values (12367819, 614, '02-04-2023', 3, 'I');

insert into Cliente (idPersona,idioma) values (11111111,'Español');
insert into Cliente (idPersona,idioma) values (3211,'Español');
insert into Cliente (idPersona,idioma) values (1211111,'English');
insert into Cliente (idPersona,idioma) values (12231,'German');
insert into Cliente (idPersona,idioma) values (1110111,'French');


INSERT INTO Vehiculo (licenciaConductor, a_o, placa, tipo, estado, puertas, pasajeros, carga)
VALUES (123456789, 2020, 'ABC123', 'A', 'A', 4, 5, 100);

INSERT INTO Vehiculo (licenciaConductor, a_o, placa, tipo, estado, puertas, pasajeros, carga)
VALUES (123456799, 2020, 'ABCP23', 'M', 'A', 4, 8, 100);

INSERT INTO Vehiculo (licenciaConductor, a_o, placa, tipo, estado, puertas, pasajeros, carga)
VALUES (987654321, 2018, 'XYZ789', 'C', 'A', 2, 3, 50);

INSERT INTO Vehiculo (licenciaConductor, a_o, placa, tipo, estado, puertas, pasajeros, carga)
VALUES (555555555, 2019, 'DEF456', 'A', 'I', 4, 7, 200);

INSERT INTO Vehiculo (licenciaConductor, a_o, placa, tipo, estado, puertas, pasajeros, carga)
VALUES (12367819, 2019, 'DEF856', 'A', 'I', 4, 7, 200);

INSERT INTO Posicion(id,latitud,longitud) VALUES(100000001,123.2,56.2);
INSERT INTO Posicion(id,latitud,longitud) VALUES(200000002,123.2,56.2);
INSERT INTO Posicion(id,latitud,longitud) VALUES(300000004,123.2,56.2);

INSERT INTO Solicitud (codigo, idCliente, fechaCreacion, fechaViaje, precio, plataforma, estado, posInicial, posFinal)
VALUES (1, 11111111, '10/05/2023', '10/10/2023', 15000, 'P', 'F', 100000001, 200000002);

INSERT INTO Solicitud (codigo, idCliente, fechaCreacion, fechaViaje, precio, plataforma, estado, posInicial, posFinal)
VALUES (2, 3211, '20/9/2023', '25/09/2023', 25500, 'C', 'F', 200000002, 300000004);

INSERT INTO Solicitud (codigo, idCliente, fechaCreacion, fechaViaje, precio, plataforma, estado, posInicial, posFinal)
VALUES (3, 1211111, '14/05/2023', '14/10/2023', 12300, 'C', 'F', 100000001, 200000002);

INSERT INTO Solicitud (codigo, idCliente, fechaCreacion, fechaViaje, precio, plataforma, estado, posInicial, posFinal)
VALUES (4, 1211111, '14/05/2023', '14/10/2023', 14900, 'C', 'F', 100000001, 200000002);

INSERT INTO Solicitud (codigo, idCliente, fechaCreacion, fechaViaje, precio, plataforma, estado, posInicial, posFinal)
VALUES (5, 3211, '14/05/2023', '14/10/2023', 12300, 'C', 'F', 100000001, 200000002);

INSERT INTO Requerimientos(idCodigo,detalle) values(1,'MUSICA-SI');
INSERT INTO Requerimientos(idCodigo,detalle) values(1,'MUSICA-SI');
INSERT INTO Requerimientos(idCodigo,detalle) values(1,'MUSICA-NO');
INSERT INTO Requerimientos(idCodigo,detalle) values(1,'IDIOMA-ESP');
INSERT INTO Requerimientos(idCodigo,detalle) values(1,'RUTA-IZ');

INSERT INTO PQRS (ticked, codSolicitud, radicacion, cierre, descripcion, tipo, estado)
VALUES ('A123456789012', 1, '10/05/2023', '10/10/2023', 'Descripción de la PQRS P', 'P', 'A');

INSERT INTO PQRS (ticked, codSolicitud, radicacion, cierre, descripcion, tipo, estado)
VALUES ('B987654321012', 2, '30/07/2023', '1/08/2023', 'Descripción de la PQRS Q', 'Q', 'C');

INSERT INTO PQRS (ticked, codSolicitud, radicacion, cierre, descripcion, tipo, estado)
VALUES ('C555555555012', 3, '24/12/2022', NULL, 'Descripción de la PQRS R', 'R', 'A');

INSERT INTO PQRSRespuesta (tickedPQRS, fecha, nombre, correo, comentario, evaluacion)
VALUES ('A123456789012', '05/10/2023', 'Juan Perez', 'juan.perez@example.com', 'Comentario 1', 4);

INSERT INTO PQRSRespuesta (tickedPQRS, fecha, nombre, correo, comentario, evaluacion)
VALUES ('B987654321012', '20/09/2023', 'Maria Rodriguez', 'maria.rodriguez@example.com', 'Comentario 2', 5);

INSERT INTO PQRSRespuesta (tickedPQRS, fecha, nombre, correo, comentario, evaluacion)
VALUES ('C555555555012', '15/09/2023', 'Ana Diaz', 'ana.diaz@example.com', NULL, 3);
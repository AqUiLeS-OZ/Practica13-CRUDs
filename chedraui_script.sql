CREATE DATABASE IF NOT EXISTS chedraui;
USE chedraui;

CREATE TABLE Proveedor (
    idProveedor INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Telefono VARCHAR(15),
    Direccion VARCHAR(200)
);

CREATE TABLE Articulo (
    idArticulo INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Precio DECIMAL(10,2),
    Stock INT
);

CREATE TABLE Detalle_proveedor (
    Proveedor_idProveedor INT,
    Producto_idProducto INT,
    Cantidad INT,
    PRIMARY KEY (Proveedor_idProveedor, Producto_idProducto),
    FOREIGN KEY (Proveedor_idProveedor) REFERENCES Proveedor(idProveedor),
    FOREIGN KEY (Producto_idProducto) REFERENCES Articulo(idArticulo)
);

CREATE TABLE Empleados (
    idEmpleado INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Sueldo DECIMAL(10,2),
    Telefono VARCHAR(15),
    Puesto VARCHAR(50)
);

CREATE TABLE Tarjeta_puntos (
    idTarjeta_puntos INT PRIMARY KEY,
    Puntos INT
);

CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Telefono BIGINT,
    Tarjeta_puntos_idTarjeta_puntos INT,
    FOREIGN KEY (Tarjeta_puntos_idTarjeta_puntos) REFERENCES Tarjeta_puntos(idTarjeta_puntos)
);

CREATE TABLE cliente_general (
    idcliente_general INT PRIMARY KEY,
    fecha DATE
);

CREATE TABLE Venta (
    idVenta INT PRIMARY KEY,
    fecha DATE,
    total DECIMAL(10,2),
    metodo_de_pago VARCHAR(50),
    Cliente_idCliente1 INT,
    cliente_general_idcliente_general INT,
    Empleados_idEmpleado INT,
    FOREIGN KEY (Cliente_idCliente1) REFERENCES Cliente(idCliente),
    FOREIGN KEY (cliente_general_idcliente_general) REFERENCES cliente_general(idcliente_general),
    FOREIGN KEY (Empleados_idEmpleado) REFERENCES Empleados(idEmpleado)
);

CREATE TABLE Detalle_venta (
    idDetalle_venta INT PRIMARY KEY AUTO_INCREMENT,
    Venta_idVenta INT,
    Articulo_idArticulo INT,
    precio_unitario DECIMAL(10,2),
    cantidad INT,
    total DECIMAL(10,2),
    FOREIGN KEY (Venta_idVenta) REFERENCES Venta(idVenta),
    FOREIGN KEY (Articulo_idArticulo) REFERENCES Articulo(idArticulo)
);

INSERT INTO Proveedor (idProveedor, Nombre, Telefono, Direccion) VALUES
(100, 'Grupo Lala', '5551234567', 'Calle central oriente #100, Tuxtla Gutierrez'),
(101, 'Bimbo S.A.', '5559876543', 'Calle 9 sur #45, Tuxtla Gutierrez'),
(102, 'Coca-Cola FEMSA', '5551122334', 'Av. Central poniente #200, Tuxtla Gutierrez'),
(103, 'Alpura', '5553344556', 'Av. Central #101, Tuxtla Gutierrez');

INSERT INTO Articulo (idArticulo, Nombre, Precio, Stock) VALUES
(7501020526066, 'Leche Lala 1L', 25.00, 300),
(7501000122332, 'Pan Bimbo Blanco', 30.00, 200),
(7894900027013, 'Coca-Cola 2L', 28.00, 150),
(7501071301452, 'Arroz Verde Valle 1kg', 22.50, 400),
(7501379120137, 'Frijol Negro 900g', 18.90, 350),
(8422410000722, 'Manzana Roja kg', 32.00, 120),
(8411030015469, 'Pechuga de Pollo kg', 85.00, 80),
(7501026005381, 'Jabón Zote Blanco', 12.00, 250);

INSERT INTO Detalle_proveedor (Proveedor_idProveedor, Producto_idProducto, Cantidad) VALUES
(100, 200, 500),
(101, 201, 300),
(102, 202, 400),
(100, 203, 250),
(101, 204, 200),
(100, 205, 180),
(103, 206, 100),
(103, 207, 300);

INSERT INTO Empleados (idEmpleado, Nombre, Sueldo, Telefono, Puesto) VALUES
(300, 'Carlos Méndez', 8500.00, '9612345678', 'Cajero'),
(301, 'Lucía Ramírez', 9200.00, '9613456789', 'Supervisor'),
(302, 'Ana Torres', 7800.00, '9684567890', 'Auxiliar de Piso'),
(303, 'Miguel Sánchez', 10000.00, '9615678901', 'Gerente'),
(304, 'Jesus Gómez', 8500.00, '9611984567', 'Cajero');

INSERT INTO Tarjeta_puntos (idTarjeta_puntos, Puntos) VALUES
(800, 100),
(801, 250),
(802, 350);

INSERT INTO Cliente (idCliente, Nombre, Telefono, Tarjeta_puntos_idTarjeta_puntos) VALUES
(400, 'María López', 9611002001, 800),
(401, 'José Martínez', 9611002002, 801),
(402, 'Sandra Jiménez', 9611002003, 802);

INSERT INTO cliente_general (idcliente_general, fecha) VALUES
(500, '2025-05-10'),
(501, '2025-05-11');

INSERT INTO Venta (idVenta, fecha, total, metodo_de_pago, Cliente_idCliente1 ,  cliente_general_idcliente_general, Empleados_idEmpleado) VALUES
(600, '2025-05-12', 55.00, 'Efectivo', 400, NULL, 300),
(601, '2025-05-12', 60.00, 'Tarjeta', 401, NULL, 301),
(602, '2025-05-13', 28.00, NULL, NULL, 500, 302),
(603, '2025-05-13', 90.00, 'Transferencia', 402, NULL, 303);

INSERT INTO Detalle_venta (Venta_idVenta, Articulo_idArticulo, precio_unitario, cantidad, total) VALUES
(600, 200, 25.00, 1, 25.00),
(600, 201, 30.00, 1, 30.00),
(601, 202, 28.00, 2, 56.00),
(601, 207, 4.00, 1, 4.00),
(602, 202, 28.00, 1, 28.00),
(603, 201, 30.00, 1, 30.00),
(603, 203, 22.50, 2, 45.00),
(603, 204, 15.00, 1, 15.00);


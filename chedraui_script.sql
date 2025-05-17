CREATE DATABASE chedraui;
USE chedraui;

INSERT INTO Proveedor (idProveedor, Nombre, Telefono, Direccion) VALUES
(100, 'Grupo Lala', '5551234567', 'Calle central oriente #100, Tuxtla Guetierrez'),
(101, 'Bimbo S.A.', '5559876543', 'Calle 9 sur #45, Tuxtla Guetierrez'),
(102, 'Coca-Cola FEMSA', '5551122334', 'Av.Cental poniente #200, Tuxtla Guetierrez'),
(103, 'Alpura', '5553344556', 'Av central  #101, Tuxtla Guetierrez');

INSERT INTO Articulo (idArticulo, Nombre, Precio, stock) VALUES
(200, 'Leche Lala 1L', 25.00, '300'),
(201, 'Pan Bimbo Blanco', 30.00, '200'),
(202, 'Coca-Cola 2L', 28.00, '150'),
(203, 'Arroz Verde Valle 1kg', 22.50, '400'),
(204, 'Frijol Negro 900g', 18.90, '350'),
(205, 'Manzana Roja kg', 32.00, '120'),
(206, 'Pechuga de Pollo kg', 85.00, '80'),
(207, 'Jabón Zote Blanco', 12.00, '250');

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
(304, 'Jesus Gomex', 8500.00, '9611984567', 'Cajero');

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

INSERT INTO Detalle_venta (Venta_idVenta, Detalle_venta, precio_unitario, cantidad, total) VALUES
(600, 700, 25.00, 1, 25.00),
(600, 701, 30.00, 1, 30.00),

(601, 702, 28.00, 2, 56.00),
(601, 703, 4.00, 1, 4.00),

(602, 704, 28.00, 1, 28.00),

(603, 705, 30.00, 1, 30.00),
(603, 706, 22.50, 2, 45.00),
(603, 707, 15.00, 1, 15.00);

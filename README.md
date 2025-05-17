# CRUD Tienda - Chedraui

Este proyecto es una aplicación desarrollada con **Flet** para gestionar una tienda tipo Chedraui.

Permite realizar operaciones CRUD (Crear, Leer, Actualizar, Eliminar) sobre:

- Artículos
- Clientes
- Proveedores
- Empleados

## Tecnologías utilizadas

- Python 3.10+
- Flet
- MySQL

## Instalación

1. Clona el repositorio o descarga los archivos.
2. Asegúrate de tener Python instalado.
3. Crea un entorno virtual.
4. Dentro del entorno instala las dependencias:

```bash
pip install flet mysql-connector-python
```

4. Crea una base de datos llamada `tienda` con las siguientes tablas:

```sql
CREATE DATABASE tienda;

USE tienda;

CREATE TABLE Articulo (
  idArticulo INT PRIMARY KEY,
  Nombre VARCHAR(100),
  Precio DECIMAL(10, 2),
  stock INT
);

CREATE TABLE Cliente (
  idCliente INT PRIMARY KEY,
  Nombre VARCHAR(100),
  Telefono VARCHAR(15),
  Tarjeta_puntos_idTarjeta_puntos INT
);

CREATE TABLE Proveedor (
  idProveedor INT PRIMARY KEY,
  Nombre VARCHAR(100),
  Telefono VARCHAR(15),
  Direccion VARCHAR(255)
);

CREATE TABLE Empleado (
  idEmpleado INT PRIMARY KEY,
  Nombre VARCHAR(100),
  Sueldo DECIMAL(10,2),
  Telefono VARCHAR(15),
  Puesto VARCHAR(50)
);
```

## Ejecución

```bash
python crud_completo.py
```

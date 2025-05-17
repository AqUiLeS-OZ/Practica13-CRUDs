import flet as ft
import mysql.connector

def conectar():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="ortizzambrano13",
        database="tienda"
    )

# FUNCIONES CRUD ARTÍCULOS 
def obtener_articulos():
    conexion = conectar()
    cursor = conexion.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Articulo")
    datos = cursor.fetchall()
    conexion.close()
    return datos

def insertar_articulo(id, nombre, precio, stock):
    conexion = conectar()
    cursor = conexion.cursor()
    cursor.execute("INSERT INTO Articulo VALUES (%s, %s, %s, %s)", (id, nombre, precio, stock))
    conexion.commit()
    conexion.close()

def eliminar_articulo(id):
    conexion = conectar()
    cursor = conexion.cursor()
    cursor.execute("DELETE FROM Articulo WHERE idArticulo = %s", (id,))
    conexion.commit()
    conexion.close()

def actualizar_articulo(id, nombre, precio, stock):
    conexion = conectar()
    cursor = conexion.cursor()
    cursor.execute("UPDATE Articulo SET Nombre=%s, Precio=%s, stock=%s WHERE idArticulo=%s", (nombre, precio, stock, id))
    conexion.commit()
    conexion.close()

#  FUNCIONES CRUD CLIENTES 
def obtener_clientes():
    conexion = conectar()
    cursor = conexion.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Cliente")
    datos = cursor.fetchall()
    conexion.close()
    return datos

def insertar_cliente(id, nombre, telefono, tarjeta):
    conexion = conectar()
    cursor = conexion.cursor()
    cursor.execute("INSERT INTO Cliente VALUES (%s, %s, %s, %s)", (id, nombre, telefono, tarjeta))
    conexion.commit()
    conexion.close()

def eliminar_cliente(id):
    conexion = conectar()
    cursor = conexion.cursor()
    cursor.execute("DELETE FROM Cliente WHERE idCliente = %s", (id,))
    conexion.commit()
    conexion.close()

def actualizar_cliente(id, nombre, telefono, tarjeta):
    conexion = conectar()
    cursor = conexion.cursor()
    cursor.execute("UPDATE Cliente SET Nombre=%s, Telefono=%s, Tarjeta_puntos_idTarjeta_puntos=%s WHERE idCliente=%s", (nombre, telefono, tarjeta, id))
    conexion.commit()
    conexion.close()

# FUNCIONES CRUD PROVEEDORES ----
def obtener_proveedores():
    conexion = conectar()
    cursor = conexion.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Proveedor")
    datos = cursor.fetchall()
    conexion.close()
    return datos

def insertar_proveedor(id, nombre, telefono, direccion):
    conexion = conectar()
    cursor = conexion.cursor()
    cursor.execute("INSERT INTO Proveedor VALUES (%s, %s, %s, %s)", (id, nombre, telefono, direccion))
    conexion.commit()
    conexion.close()

def eliminar_proveedor(id):
    conexion = conectar()
    cursor = conexion.cursor()
    cursor.execute("DELETE FROM Proveedor WHERE idProveedor = %s", (id,))
    conexion.commit()
    conexion.close()

def actualizar_proveedor(id, nombre, telefono, direccion):
    conexion = conectar()
    cursor = conexion.cursor()
    cursor.execute("UPDATE Proveedor SET Nombre=%s, Telefono=%s, Direccion=%s WHERE idProveedor=%s", (nombre, telefono, direccion, id))
    conexion.commit()
    conexion.close()

# FUNCIONES CRUD EMPLEADOS ----
def obtener_empleados():
    conexion = conectar()
    cursor = conexion.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Empleados")
    datos = cursor.fetchall()
    conexion.close()
    return datos

def insertar_empleado(id, nombre, sueldo, telefono, puesto):
    conexion = conectar()
    cursor = conexion.cursor()
    cursor.execute("INSERT INTO Empleados VALUES (%s, %s, %s, %s, %s)", (id, nombre, sueldo, telefono, puesto))
    conexion.commit()
    conexion.close()

def eliminar_empleado(id):
    conexion = conectar()
    cursor = conexion.cursor()
    cursor.execute("DELETE FROM Empleado WHERE idEmpleados = %s", (id,))
    conexion.commit()
    conexion.close()

def actualizar_empleado(id, nombre, sueldo, telefono, puesto):
    conexion = conectar()
    cursor = conexion.cursor()
    cursor.execute("UPDATE Empleados SET Nombre=%s, Sueldo=%s, Telefono=%s, Puesto=%s WHERE idEmpleado=%s", (nombre, sueldo, telefono, puesto, id))
    conexion.commit()
    conexion.close()

# FUNCIÓN PARA FORMULARIOS 
def generar_crud(nombre_tabla, campos, obtener_func, insertar_func, eliminar_func, actualizar_func, page):
    inputs = [ft.TextField(label=campo, width=180) for campo in campos]
    tabla = ft.Column()

    def actualizar_tabla():
        tabla.controls.clear()
        datos = obtener_func()
        tabla.controls.append(
            ft.DataTable(
                columns=[ft.DataColumn(label=ft.Text(c, weight="bold")) for c in campos],
                rows=[ft.DataRow(cells=[ft.DataCell(ft.Text(str(d[c]))) for c in campos]) for d in datos],
                heading_row_color="#1e293b",
                heading_text_style=ft.TextStyle(color="white", weight="bold"),
                border_radius=10,
            )
        )
        page.update()

    def agregar(e):
        valores = [i.value for i in inputs]
        insertar_func(*valores)
        actualizar_tabla()

    def eliminar(e):
        id_valor = inputs[0].value
        eliminar_func(id_valor)
        actualizar_tabla()

    def actualizar(e):
        valores = [i.value for i in inputs]
        actualizar_func(*valores)
        actualizar_tabla()

    formulario = ft.Column([
        ft.Text(f"Gestión de {nombre_tabla}", size=22, weight="bold"),
        ft.Row(inputs, wrap=True),
        ft.Row([
            ft.ElevatedButton("Agregar", on_click=agregar, bgcolor="#22c55e", color="white"),
            ft.ElevatedButton("Eliminar", on_click=eliminar, bgcolor="#ef4444", color="white"),
            ft.ElevatedButton("Actualizar", on_click=actualizar, bgcolor="#3b82f6", color="white")
        ], spacing=10),
        tabla
    ])

    actualizar_tabla()
    return formulario

# INICIO 
def main(page: ft.Page):
    page.title = "CRUD Tienda - Chedraui"
    page.bgcolor = "#f8fafc"
    page.scroll = "auto"

    tabs = ft.Tabs(
        selected_index=0,
        animation_duration=300,
        expand=1,
        tabs=[
            ft.Tab(
                text="Artículos",
                content=generar_crud("Artículos", ["idArticulo", "Nombre", "Precio", "stock"],
                                     obtener_articulos, insertar_articulo, eliminar_articulo, actualizar_articulo, page)
            ),
            ft.Tab(
                text="Clientes",
                content=generar_crud("Clientes", ["idCliente", "Nombre", "Telefono", "Tarjeta_puntos_idTarjeta_puntos"],
                                     obtener_clientes, insertar_cliente, eliminar_cliente, actualizar_cliente, page)
            ),
            ft.Tab(
                text="Proveedores",
                content=generar_crud("Proveedores", ["idProveedor", "Nombre", "Telefono", "Direccion"],
                                     obtener_proveedores, insertar_proveedor, eliminar_proveedor, actualizar_proveedor, page)
            ),
            ft.Tab(
                text="Empleados",
                content=generar_crud("Empleados", ["idEmpleado", "Nombre", "Sueldo", "Telefono", "Puesto"],
                                     obtener_empleados, insertar_empleado, eliminar_empleado, actualizar_empleado, page)
            ),
        ]
    )

    page.add(tabs)

ft.app(target=main)

import pyodbc
import csv
import os
import configparser

# funciones
def Entregas(csv_files, cursor):

    # Construye la ruta completa al archivo csv
    script_dir = os.path.dirname(__file__) #Obtiene el directorio del script actual
    csv_file_path = os.path.join(script_dir, 'database', 'Entregas.csv')

    # Trunca la tabla STG_Entregas
    cursor.execute("TRUNCATE TABLE STG_Fact_Entrega")
    print("Tabla STG_Fact_Entrega truncada.")

    #Lee los datos del archivo CSV
    for file_name in csv_files:
        csv_files_path = os.path.join(script_dir, 'database', file_name)

        # Lee los datos del archivo csv
        with open(csv_file_path, mode='r', encoding='utf-8') as file:
            csv_reader = csv.reader(file)
            header = next(csv_reader) # Salta el encabezado
            
            # Inserta los datos en la tabla STG_Ventas
            for row in csv_reader:
                # Verifica si la fila tiene datos faltantes
                if len(row) != 15 or any(not field for field in row):
                    # Inserta la fila en la tabla de datos faltantes
                    try:
                        cursor.execute("""
                            INSERT INTO STG_Fact_Entrega_Datos_Faltantes (ID_Entrega, ID_Proveedor, ID_Almacen, ID_Estado, Fecha_Envio, Fecha_Entrega, Tiempo_Entrega, Costo_Entrega, Entregado_Tiempo, Costo_Km, Direccion, Ciudad, Provincia, Pais, Km)
                            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                        """, row)
                    except Exception as e:
                        print(f"Error al ejecutar el INSERT en STG_Fact_Entrega_Datos_Faltantes: {e}")
                else:
                    # Inserta la fila en la tabla principal
                    cursor.execute("""
                        INSERT INTO STG_Fact_Entrega (ID_Entrega, ID_Proveedor, ID_Almacen, ID_Estado, Fecha_Envio, Fecha_Entrega, Tiempo_Entrega, Costo_Entrega, Entregado_Tiempo, Costo_Km, Direccion, Ciudad, Provincia, Pais, Km)
                        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                    """, row)

def Almacenes(csv_files, cursor):
    
    # Construye la ruta completa al archivo csv
    script_dir = os.path.dirname(__file__) #Obtiene el directorio del script actual
    csv_file_path = os.path.join(script_dir, 'database', 'Almacenes.csv')

    # Trunca la tabla STG_Almacenes
    cursor.execute("TRUNCATE TABLE STG_Dim_Almacen")
    print("Tabla STG_Dim_Almacen truncada.")

    #Lee los datos del archivo CSV
    for file_name in csv_files:
        csv_files_path = os.path.join(script_dir, 'database', file_name)

        # Lee los datos del archivo csv
        with open(csv_file_path, mode='r', encoding='utf-8') as file:
            csv_reader = csv.reader(file)
            header = next(csv_reader) # Salta el encabezado
            
            # Inserta los datos en la tabla STG_Ventas
            for row in csv_reader:
                # Verifica si la fila tiene datos faltantes
                if len(row) != 11 or any(not field for field in row):
                    try:
                        # Inserta la fila en la tabla de datos faltantes
                        cursor.execute("""
                            INSERT INTO STG_Dim_Almacen_Datos_Faltantes (ID_Almacen, Nombre_Almacen, Ubicacion, Telefono, Mail, CP, Capacidad_Max, Activo, Ciudad, Provincia, Pais)
                            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                        """, row)
                    except Exception as e:
                        print(f"Error al ejecutar el INSERT en STG_Dim_Almacen_Datos_Faltantes: {e}")
                else:
                    # Inserta la fila en la tabla principal
                    cursor.execute("""
                        INSERT INTO STG_Dim_Almacen (ID_Almacen, Nombre_Almacen, Ubicacion, Telefono, Mail, CP, Capacidad_Max, Activo, Ciudad, Provincia, Pais)
                        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                    """, row)

def Clientes(csv_files, cursor):
    
    # Construye la ruta completa al archivo csv
    script_dir = os.path.dirname(__file__) #Obtiene el directorio del script actual
    csv_file_path = os.path.join(script_dir, 'database', 'clientes.csv')

    # Trunca la tabla STG_cliente
    cursor.execute("TRUNCATE TABLE STG_Dim_cliente")
    print("Tabla STG_Dim_cliente truncada.")

    #Lee los datos del archivo CSV
    for file_name in csv_files:
        csv_files_path = os.path.join(script_dir, 'database', file_name)

        # Lee los datos del archivo csv
        with open(csv_file_path, mode='r', encoding='utf-8') as file:
            csv_reader = csv.reader(file)
            header = next(csv_reader) # Salta el encabezado
            
            # Inserta los datos en la tabla STG_Ventas
            for row in csv_reader:
                # Verifica si la fila tiene datos faltantes
                if len(row)!=8 or any(not field for field in row):
                    try:
                        # Inserta la fila en la tabla de datos faltantes
                        cursor.execute("""
                            INSERT INTO STG_Dim_cliente_Datos_Faltantes (CodCliente, RazonSocial, Telefono, Mail, Direccion, Localidad, Provincia, CP)
                            VALUES (?, ?, ?, ?, ?, ?, ?, ?)
                        """, row)
                    except Exception as e:
                        print(f"Error al ejecutar el INSERT en STG_Dim_Cliente_Datos_Faltantes: {e}")
                else:
                    # Inserta la fila en la tabla principal
                    cursor.execute("""
                        INSERT INTO STG_Dim_cliente (CodCliente, RazonSocial, Telefono, Mail, Direccion, Localidad, Provincia, CP)
                        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
                    """, row)

def Estado(csv_files, cursor):
    
    # Construye la ruta completa al archivo csv
    script_dir = os.path.dirname(__file__) #Obtiene el directorio del script actual
    csv_file_path = os.path.join(script_dir, 'database', 'EstadoDelPedido.csv')

    # Trunca la tabla STG_Estado
    cursor.execute("TRUNCATE TABLE STG_Dim_Estado")
    print("Tabla STG_Dim_Estado truncada.")

    #Lee los datos del archivo CSV
    for file_name in csv_files:
        csv_files_path = os.path.join(script_dir, 'database', file_name)

        # Lee los datos del archivo csv
        with open(csv_file_path, mode='r', encoding='utf-8') as file:
            csv_reader = csv.reader(file)
            header = next(csv_reader) # Salta el encabezado
            
            # Inserta los datos en la tabla STG_Ventas
            for row in csv_reader:
                # Verifica si la fila tiene datos faltantes
                if len(row) != 2 or any(not field for field in row):
                    try:
                        # Inserta la fila en la tabla de datos faltantes
                        cursor.execute("""
                            INSERT INTO STG_Dim_Estado_Datos_Faltantes (ID_Estado, Descripcion)
                            VALUES (?, ?)
                        """, row)
                    except Exception as e:
                        print(f"Error al ejecutar el INSERT en STG_Dim_Estado_Datos_Faltantes: {e}")
                else:
                    # Inserta la fila en la tabla principal
                    cursor.execute("""
                        INSERT INTO STG_Dim_Estado (ID_Estado, Descripcion)
                        VALUES (?, ?)
                    """, row)

def Productos(csv_files, cursor):
    
    # Construye la ruta completa al archivo csv
    script_dir = os.path.dirname(__file__) #Obtiene el directorio del script actual
    csv_file_path = os.path.join(script_dir, 'database', 'productos.csv')

    # Trunca la tabla STG_producto
    cursor.execute("TRUNCATE TABLE STG_Dim_producto")
    print("Tabla STG_Dim_producto truncada.")

    #Lee los datos del archivo CSV
    for file_name in csv_files:
        csv_files_path = os.path.join(script_dir, 'database', file_name)

        # Lee los datos del archivo csv
        with open(csv_file_path, mode='r', encoding='utf-8') as file:
            csv_reader = csv.reader(file)
            header = next(csv_reader) # Salta el encabezado
            
            # Inserta los datos en la tabla STG_Ventas
            for row in csv_reader:
                # Verifica si la fila tiene datos faltantes
                if len(row)!=6 or any(not field for field in row):
                    try:
                        # Inserta la fila en la tabla de datos faltantes
                        cursor.execute("""
                            INSERT INTO STG_Dim_producto_Datos_Faltantes (CodigoProducto, Descripcion, Categoria, Marca, PrecioCosto, PrecioVentaSugerido)
                            VALUES (?, ?, ?, ?, ?, ?)
                        """, row)
                    except Exception as e:
                        print(f"Error al ejecutar el INSERT en STG_Dim_producto_Datos_Faltantes: {e}")
                else:
                    # Inserta la fila en la tabla principal
                    cursor.execute("""
                        INSERT INTO STG_Dim_producto (CodigoProducto, Descripcion, Categoria, Marca, PrecioCosto, PrecioVentaSugerido)
                        VALUES (?, ?, ?, ?, ?, ?)
                    """, row)    

def Proveedores(csv_files, cursor):
    
    # Construye la ruta completa al archivo csv
    script_dir = os.path.dirname(__file__) #Obtiene el directorio del script actual
    csv_file_path = os.path.join(script_dir, 'database', 'Proveedores.csv')

    # Trunca la tabla STG_proveedor
    cursor.execute("TRUNCATE TABLE STG_Dim_proveedor")
    print("Tabla STG_Dim_proveedor truncada.")

    #Lee los datos del archivo CSV
    for file_name in csv_files:
        csv_files_path = os.path.join(script_dir, 'database', file_name)

        # Lee los datos del archivo csv
        with open(csv_file_path, mode='r', encoding='utf-8') as file:
            csv_reader = csv.reader(file)
            header = next(csv_reader) # Salta el encabezado
            
            # Inserta los datos en la tabla STG_Ventas
            for row in csv_reader:
                # Verifica si la fila tiene datos faltantes
                if len(row)!=13 or any(not field for field in row):
                    try:
                        # Inserta la fila en la tabla de datos faltantes
                        cursor.execute("""
                            INSERT INTO STG_Dim_proveedor_Datos_Faltantes (ID_Proveedor, Nombre_Proveedor, Costo_Estimado, Telefono, Mail, Direccion, Tipo_Proveedor, CP, Fecha_Alta, Ciudad, Provincia, Pais, Activo)
                            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                        """, row)
                    except Exception as e:
                        print(f"Error al ejecutar el INSERT en STG_Dim_Proveedores_Datos_Faltantes: {e}")
                else:
                    # Inserta la fila en la tabla principal
                    cursor.execute("""
                        INSERT INTO STG_Dim_proveedor (ID_Proveedor, Nombre_Proveedor, Costo_Estimado, Telefono, Mail, Direccion, Tipo_Proveedor, CP, Fecha_Alta, Ciudad, Provincia, Pais, Activo)
                        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                    """, row)

def Tiendas(csv_files, cursor):
    
    # Construye la ruta completa al archivo csv
    script_dir = os.path.dirname(__file__) #Obtiene el directorio del script actual
    csv_file_path = os.path.join(script_dir, 'database', 'tiendas.csv')

    # Trunca la tabla STG_Tiendas
    cursor.execute("TRUNCATE TABLE STG_Dim_Tienda")
    print("Tabla STG_Dim_Tienda truncada.")

    #Lee los datos del archivo CSV
    for file_name in csv_files:
        csv_files_path = os.path.join(script_dir, 'database', file_name)

        # Lee los datos del archivo csv
        with open(csv_file_path, mode='r', encoding='utf-8') as file:
            csv_reader = csv.reader(file)
            header = next(csv_reader) # Salta el encabezado
            
            # Inserta los datos en la tabla STG_Ventas
            for row in csv_reader:
                # Verifica si la fila tiene datos faltantes
                if len(row)!=7 or any(not field for field in row):
                    try:
                        # Inserta la fila en la tabla de datos faltantes
                        cursor.execute("""
                            INSERT INTO STG_Dim_Tienda_Datos_Faltantes (CodigoTienda, Descripcion, Direccion, Localidad, Provincia, CP, TipoTienda)
                            VALUES (?, ?, ?, ?, ?, ?, ?)
                        """, row)
                    except Exception as e:
                        print(f"Error al ejecutar el INSERT en STG_Dim_Tienda_Datos_Faltantes: {e}")
                else:
                    # Inserta la fila en la tabla principal
                    cursor.execute("""
                        INSERT INTO STG_Dim_Tienda (CodigoTienda, Descripcion, Direccion, Localidad, Provincia, CP, TipoTienda)
                        VALUES (?, ?, ?, ?, ?, ?, ?)
                    """, row)

def Ventas(csv_files, cursor):
    
    # Construye la ruta completa al archivo csv
    script_dir = os.path.dirname(__file__) #Obtiene el directorio del script actual
    csv_file_path = os.path.join(script_dir, 'database', 'ventas.csv')

    # Trunca la tabla STG_Ventas
    cursor.execute("TRUNCATE TABLE STG_Fact_Ventas")
    print("Tabla STG_Fact_Ventas truncada.")

    #Lee los datos del archivo CSV
    for file_name in csv_files:
        csv_files_path = os.path.join(script_dir, 'database', file_name)

        # Lee los datos del archivo csv
        with open(csv_files_path, mode='r', encoding='utf-8') as file:
            csv_reader = csv.reader(file)
            header = next(csv_reader) # Salta el encabezado
            
            # Inserta los datos en la tabla STG_Ventas
            for row in csv_reader:
                # Verifica si la fila tiene datos faltantes
                if len(row) != 11 or any(not field for field in row):
                    try:
                        # Inserta la fila en la tabla de datos faltantes
                        cursor.execute("""
                            INSERT INTO STG_Fact_Ventas_Datos_Faltantes (Id_Venta, FechaVenta, CodigoProducto, Producto, Cantidad, PrecioVenta, CodigoCliente, Cliente, CodigoTienda, Tienda, ID_Entrega)
                            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                        """, row)
                    except Exception as e:
                        print(f"Error al ejecutar el INSERT en STG_Fact_Ventas_Datos_Faltantes: {e}")
                else:
                    # Inserta la fila en la tabla principal
                    cursor.execute("""
                        INSERT INTO STG_Fact_Ventas (Id_Venta, FechaVenta, CodigoProducto, Producto, Cantidad, PrecioVenta, CodigoCliente, Cliente, CodigoTienda, Tienda, ID_Entrega)
                        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                    """, row)
####

# Crear una instancia de ConfigParser
config = configparser.ConfigParser()

# Leer el archivo de configuracion
config.read('config.ini')

# Acceder a los datos de la configuración

db_config = {
    'driver': config['database']['driver'],
    'server': config['database']['server'],
    'database': config['database']['database'],
    'uid': config['database']['uid'],
    'pwd': config['database']['pwd']
}

# Configura la conexión a la base de datos SQL Server 'DRIVER={ODBC Driver 17 for SQL Server};'

# Contruir la cadena de conexion
connection_string = (
    f"DRIVER={db_config['driver']};"
    f"SERVER={db_config['server']};"
    f"DATABASE={db_config['database']};"
    f"UID={db_config['uid']};"
    f"PWD={db_config['pwd']};"
)

# Archivos a procesar
csv_entregas = ['Entregas.csv']
csv_almacenes = ['Almacenes.csv']
csv_clientes = ['clientes.csv']
csv_estado = ['EstadoDelPedido.csv']
csv_productos = ['productos.csv']
csv_proveedores = ['Proveedores.csv']
csv_tiendas = ['tiendas.csv']
csv_ventas = ['ventas.csv']

# Conectarse a la base de datos usando la configuracion
try:
    conn = pyodbc.connect(connection_string)
    print("Conexión exitosa")

    cursor = conn.cursor()

    Entregas(csv_entregas, cursor)
    Almacenes(csv_almacenes, cursor)
    Clientes(csv_clientes, cursor)
    Estado(csv_estado, cursor)
    Productos(csv_productos, cursor)
    Proveedores(csv_proveedores, cursor)
    Tiendas(csv_tiendas, cursor)
    Ventas(csv_ventas, cursor)
    # Confirma los cambios y cierra la conexión
    conn.commit()
    cursor.close()
    conn.close()

    print("Datos insertados exitosamente")

except Exception as e:
    print(f'Error al conectarse a la base de datos: {e}')


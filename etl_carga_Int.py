import pyodbc
import configparser

def store(stored_procedure):
    param = 123456789 # Valor del parametro bigint
    cursor.execute(f'EXEC {stored_procedure} ?', param)
    # cursor.execute(f'EXEC {stored_procedure}')

    # Confirmar ejecución
    conn.commit()
    print(f"Stored procedure {stored_procedure} ejecutado con éxito.")

#Crear una instancia de ConfigParser
config = configparser.ConfigParser()

#Leer el archivo de configuracion 
config.read('config.ini')

# Acceder a los datos de la configuración

db_config = {
    'driver': config['database']['driver'],
    'server': config['database']['server'],
    'database': config['database']['database'],
    'uid': config['database']['uid'],
    'pwd': config['database']['pwd']
}

#Configura la conexion a la base de datos SQL Server 'DRIVER={ODBC Driver 17 for SQL Server}'

# Contruir la cadena de conexion
connection_string = (
    f"DRIVER={db_config['driver']};"
    f"SERVER={db_config['server']};"
    f"DATABASE={db_config['database']};"
    f"UID={db_config['uid']};"
    f"PWD={db_config['pwd']};"
)

# Conectarse a la base de datos usando la configuracion
try:
    conn = pyodbc.connect(connection_string)
    print("Conexión exitosa")

    # Conectarse a la base de datos
    cursor = conn.cursor()

    # Ejecutar el Store Procedure sin parametros
    store('sp_carga_Int_Dim_Almacen')
    store('sp_carga_Int_Dim_Cliente')
    store('sp_carga_Int_Fact_Entrega')
    store('sp_carga_Int_Dim_Estado')
    store('sp_carga_Int_Dim_Producto')
    store('sp_carga_Int_Dim_Proveedor')
    store('SP_Carga_Int_Dim_Tienda')
    store('SP_Carga_Int_Fact_Ventas')

except pyodbc.Error as e:
    print(f'Error al conectar o ejecutar el stored procedure SP_Carga_Int: {e}')

finally:
    # Asegurarse de cerrar la conexion
    if 'cursor' in locals():
        cursor.close()
    if 'conn' in locals():
        conn.close()
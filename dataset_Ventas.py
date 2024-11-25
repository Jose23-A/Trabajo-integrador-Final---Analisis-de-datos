import pandas as pd
import random
from datetime import datetime, timedelta

# Configurar la generación de datos
productos = [
    "Televisor LED 55\"", "Lavadora 8kg", "Refrigerador Doble Puerta",
    "Microondas 20L", "Aspiradora Sin Bolsa", "Computadora Portátil",
    "Tablet 10\"", "Auriculares Bluetooth", "Smartphone", "Horno Eléctrico"
]
clientes = [
    "ACME Corp", "Globex Corporation", "Initech", "Umbrella Corp",
    "Weyland-Yutani", "Cyberdyne Systems", "Tyrell Corporation", "Stark Industries"
]
tiendas = [
    "ElectroShop", "Tienda Central", "Outlet Norte", "ElectroShop Sur",
    "Tienda Premium", "MegaMarket", "TecnoStore", "Digital Plaza"
]

# Generar datos aleatorios
data = []
start_date = datetime(2024, 1, 1)
for i in range(1, 1001):
    fecha_venta = start_date + timedelta(days=random.randint(0, 365))
    codigo_producto = random.randint(1, len(productos))
    producto = productos[codigo_producto - 1]
    cantidad = random.randint(1, 5)
    precio_venta = round(random.uniform(100.0, 2000.0), 2)
    codigo_cliente = random.randint(1, len(clientes))
    cliente = clientes[codigo_cliente - 1]
    codigo_tienda = random.randint(1, len(tiendas))
    tienda = tiendas[codigo_tienda - 1]
    id_entrega = random.randint(1, 10)
    
    data.append([
        i, fecha_venta.strftime("%Y-%m-%d"), codigo_producto, producto,
        cantidad, precio_venta, codigo_cliente, cliente,
        codigo_tienda, tienda, id_entrega
    ])

# Crear DataFrame
columns = ["Id_Venta", "FechaVenta", "CodigoProducto", "Producto", "Cantidad", "PrecioVenta", 
           "CodigoCliente", "Cliente", "CodigoTienda", "Tienda", "ID_Entrega"]
df = pd.DataFrame(data, columns=columns)

# Guardar en un archivo CSV
file_path = r"E:\Ingenieria\Cursos\Analisis de Datos - Quales Group\Trabajo integrador final\database\ventas.csv"
df.to_csv(file_path, index=False)
print(f"Archivo CSV con 1000 filas generado y guardado en: {file_path}")

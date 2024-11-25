import pandas as pd
import random
from datetime import datetime, timedelta

# Datos iniciales para proveedores
data_proveedores = {
    "ID_Proveedor": [1, 2, 3, 4, 5],
    "Nombre_Proveedor": ["FastDelivery", "ExpressShip", "GlobalCourier", "QuickSend", "ShipPro"],
    "Costo_Estimado": [10.00, 12.00, 15.00, 8.00, 11.00]
}

# Crear DataFrame
df_proveedores = pd.DataFrame(data_proveedores)

# Generar columnas adicionales para proveedores
df_proveedores["Telefono"] = [f"+1-{random.randint(200, 999)}-{random.randint(1000, 9999)}" for _ in range(len(df_proveedores))]
df_proveedores["Mail"] = [f"contacto{proveedor.replace(' ', '').lower()}@empresa.com" for proveedor in df_proveedores["Nombre_Proveedor"]]
df_proveedores["Direccion"] = [f"Calle {random.randint(1, 100)}, N° {random.randint(1, 50)}" for _ in range(len(df_proveedores))]
df_proveedores["Tipo_Proveedor"] = random.choices(["Transporte", "Logística", "Almacenamiento"], k=len(df_proveedores))
df_proveedores["CP"] = [random.randint(1000, 9999) for _ in range(len(df_proveedores))]
df_proveedores["Fecha_Alta"] = [(datetime.now() - timedelta(days=random.randint(100, 3650))).strftime("%Y-%m-%d") for _ in range(len(df_proveedores))]
df_proveedores["Ciudad"] = random.choices(["Ciudad A", "Ciudad B", "Ciudad C", "Ciudad D"], k=len(df_proveedores))
df_proveedores["Provincia"] = random.choices(["Provincia X", "Provincia Y", "Provincia Z"], k=len(df_proveedores))
df_proveedores["Pais"] = "Argentina"
df_proveedores["Activo"] = [random.choice([1, 0]) for _ in range(len(df_proveedores))]

# Exportar a CSV
df_proveedores.to_csv("dataset_proveedores.csv", index=False)

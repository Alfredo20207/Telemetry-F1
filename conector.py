import pandas as pd
from sqlalchemy import create_engine

# Creamos la conexión directa saltándonos el bug de Power BI
# Estructura: mysql+pymysql://usuario:contraseña@servidor/base_de_datos
engine = create_engine('mysql+pymysql://root:@localhost:3306/f1_analysis')

# Leemos las tablas directo a Power BI
circuits = pd.read_sql('SELECT * FROM circuits', engine)
constructors = pd.read_sql('SELECT * FROM constructors', engine)
drivers = pd.read_sql('SELECT * FROM drivers', engine)
pit_stops = pd.read_sql('SELECT * FROM pit_stops', engine)
races = pd.read_sql('SELECT * FROM races', engine)
results = pd.read_sql('SELECT * FROM results', engine)
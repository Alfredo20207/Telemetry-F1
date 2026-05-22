import fastf1
import plotly.express as px
import os

# 1. Preparar la Caché (¡Muy importante!)
# F1 maneja muchísimos datos. Creamos una carpeta llamada "cache" para guardar los datos descargados.
# Así, la próxima vez que corras el código, será instantáneo porque ya los tendrá guardados.
if not os.path.exists('cache'):
    os.makedirs('cache')
fastf1.Cache.enable_cache('cache')

# 2. Cargar una sesión oficial
# Aquí pedimos: Año 2023, Gran Premio de Monza (Italia), Sesión de Clasificación ('Q' de Qualifying)
# Nota: La primera vez que lo corras tardará unos segundos mientras descarga todo de internet.
sesion = fastf1.get_session(2023, 'Monza', 'Q')
sesion.load()

# 3. Obtener la vuelta más rápida de un piloto en específico
# Usamos las 3 letras oficiales del piloto. Por ejemplo: 
# 'PER' = Sergio Pérez, 'VER' = Verstappen, 'HAM' = Hamilton, 'ALO' = Alonso
vuelta_rapida = sesion.laps.pick_driver('PER').pick_fastest()

# 4. Extraer la telemetría de esa vuelta
# La "telemetría" es una tabla gigante que contiene el estado del auto milisegundo a milisegundo: 
# Velocidad, Acelerador, Freno, RPM, Marcha (Gear), etc.
telemetria = vuelta_rapida.get_telemetry()

# 5. Crear un gráfico interactivo con Plotly
# Queremos ver la Velocidad (eje Y) a lo largo de la Distancia recorrida de la pista (eje X).
fig = px.line(
    telemetria, 
    x="Distance", 
    y="Speed", 
    title="Velocidad de Checo Pérez en su vuelta rápida - Qualy Monza 2023",
    labels={
        "Distance": "Distancia en pista (metros)",
        "Speed": "Velocidad (km/h)"
    }
)

# 6. Personalizar un poco el gráfico para que se vea más genial
fig.update_traces(line_color='green') # Usamos verde para Checo (Aston Martin / Red Bull)
fig.update_layout(template="plotly_dark")

# 7. Mostrar el gráfico 
# Esto abrirá una pestaña en tu navegador web automáticamente con el resultado.
fig.show()

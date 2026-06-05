import folium

# Centrar el mapa en Querétaro
mapa = folium.Map(location=[20.477694736471342, -100.12033044415305], zoom_start=13)

# Centrar el mapa en Querétaro (Vista Satelital)
#mapa = folium.Map(
#    location=[20.477694736471342, -100.12033044415305], 
#    zoom_start=13,
#    tiles='https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
#    attr='Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community'
#)
# Ejemplo: Resaltar una región dibujando un Polígono
# (Estas son coordenadas aproximadas para formar un cuadro en el mapa)
coordenadas_region = [
    [20.490, -100.140],
    [20.490, -100.100],
    [20.460, -100.100],
    [20.460, -100.140]
]

folium.Polygon(
    locations=coordenadas_region,
    color='red',          # Color de la línea del borde
    weight=3,             # Grosor del borde
    fill=True,            # Rellenar el interior de la región
    fill_color='orange',  # Color del relleno
    fill_opacity=0.3,     # Nivel de transparencia (0.0 a 1.0)
    popup="Región Resaltada"
).add_to(mapa)


mapa.save("mapa_queretaro.html")
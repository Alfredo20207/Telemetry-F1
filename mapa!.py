import folium

# Centrar el mapa en Querétaro (Vista Satelital)
mapa = folium.Map(
    location=[20.477694736471342, -100.12033044415305], 
    zoom_start=13,
    tiles='https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
    attr='Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community'
)


mapa.save("mapa_queretaro.html")
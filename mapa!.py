import folium

# Centrar el mapa en Querétaro
mapa = folium.Map(location=[20.588, -100.388], zoom_start=13)
folium.Marker([20.588, -100.388], popup="Centro de Querétaro").add_to(mapa)

mapa.save("mapa_queretaro.html")
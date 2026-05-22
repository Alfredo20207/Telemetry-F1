import dash
from dash import html, Input, Output
import plotly.express as px
from dash import dcc
import pandas as pd

# Inicializa la aplicación
app = dash.Dash(__name__)

# Base de datos simulada con coordenadas (X, Y) y Velocidad (V) para dibujar la forma del circuito
pistas_f1 = {
    'Monza': {
        'x': [0, 2, 4, 5, 6, 8, 7, 5, 3, 1, -1, -2, 0],
        'y': [0, 4, 8, 12, 15, 14, 10, 6, 2, -2, -4, -2, 0],
        'v': [200, 340, 320, 120, 250, 140, 300, 350, 330, 100, 150, 180, 200]
    },
    'Mónaco': {
        'x': [0, 2, 3, 5, 4, 2, 1, 3, 5, 4, 2, 0, -1, 0],
        'y': [0, 1, 3, 2, 0, -2, -4, -5, -3, -1, 1, 2, 1, 0],
        'v': [120, 180, 150, 80, 120, 160, 90, 150, 110, 70, 130, 200, 140, 120]
    },
    'Silverstone': {
        'x': [0, 3, 6, 9, 10, 8, 5, 2, -1, -3, -4, -2, 0],
        'y': [0, 2, 1, 4, 7, 10, 9, 8, 7, 5, 2, 1, 0],
        'v': [180, 290, 240, 160, 280, 310, 190, 300, 260, 130, 210, 250, 180]
    }
}

# Define el diseño de la aplicación web
app.layout = html.Div(children=[
    html.H1(children='Dashboard de Telemetría F1', style={'textAlign': 'center', 'fontFamily': 'Arial', 'color': 'white'}),
    
    html.Div(children='Selecciona una pista para ver su telemetría (Simulada):', style={'textAlign': 'center', 'fontFamily': 'Arial', 'color': 'white', 'marginBottom': '10px'}),

    # Menú desplegable para seleccionar la pista
    html.Div([
        dcc.Dropdown(
            id='selector-pista',
            options=[
                {'label': '🇮🇹 Monza (El Templo de la Velocidad)', 'value': 'Monza'},
                {'label': '🇲🇨 Mónaco (Circuito Callejero)', 'value': 'Mónaco'},
                {'label': '🇬🇧 Silverstone (Cuna de la F1)', 'value': 'Silverstone'}
            ],
            value='Monza', # Valor por defecto
            clearable=False,
            style={'color': 'black'}
        )
    ], style={'width': '50%', 'margin': '0 auto', 'marginBottom': '20px'}),

    dcc.Graph(
        id='grafico-ejemplo'
    )
], style={'backgroundColor': '#111111', 'minHeight': '100vh', 'padding': '20px'})

# Callback para actualizar el gráfico cuando se cambia la pista
@dash.callback(
    Output('grafico-ejemplo', 'figure'),
    Input('selector-pista', 'value')
)
def actualizar_grafico(pista_seleccionada):
    # Generar datos según la pista seleccionada (ahora incluye x, y, y velocidad)
    df = pd.DataFrame(pistas_f1[pista_seleccionada])
    
    # Crear el gráfico dibujando el circuito (mapa) usando x e y, coloreando por velocidad
    fig = px.scatter(
        df, x="x", y="y", color="v", 
        title=f"Mapa del Circuito Simulado - {pista_seleccionada}",
        color_continuous_scale="turbo" # Escala de colores que va de azul (lento) a rojo (rápido)
    )
    
    # Unir los puntos con una línea para formar la pista y hacer los puntos (telemetría) más visibles
    fig.update_traces(
        mode='lines+markers', 
        marker=dict(size=12, line=dict(width=1, color='white')), 
        line=dict(width=4, color='gray')
    )
    
    # Ocultar los ejes para que parezca un mapa real y forzar que la proporción sea 1:1 (scaleanchor)
    fig.update_layout(
        template="plotly_dark",
        xaxis=dict(visible=False),
        yaxis=dict(visible=False, scaleanchor="x", scaleratio=1),
        coloraxis_colorbar=dict(title="Velocidad<br>(km/h)")
    )
    
    return fig

if __name__ == '__main__':
    app.run(debug=True)

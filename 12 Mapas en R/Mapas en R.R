# Mapas en R

library(ggplot2)

#################################   Italia
italy_map <- map_data(map="italy")
str(italy_map)
head(italy_map)

## Construir un dataset con los valores para cada región del mapa (puede ser que ya se tenga)
library(tibble)
# Generamos algunos datos aleatorios 
# Si usamos nuestro propio dataset, solo nos aseguramos de contar con la columna 'region' y 'value'
# Lo que necesitamos es un dataset que para cada región nos de un valor numérico
reg_data <- tibble(region=unique(italy_map$region),
                   value=sample(100, length(region)))

## Inicializamos un nuevo gráfico
gg <- ggplot()
# capa base
# 'data=italy_map' y 'map=italy_map' nos sirven para indicarle las coordenadas que queremos graficar
# 'map_id' nos permite identificar el mapa para agregar más información después
gg <- gg + geom_map(data=italy_map, map=italy_map,
                    aes(long, lat, map_id=region),
                    color="#b2b2b2", size=0.1, fill=NA)

## Graficar el mapa: no tiene colores que diferencien las áreas (fill=NA):
gg

## Vamos a rellenar las regiones con un color
# queremos que el color se corresponda al valor de "value"
# 'data=reg_data' es la información que queremos agregar (datos por regiones)
# 'fill=value' nos indica qué columna de 'reg_data' usaremos para determinar el color
gg <- gg + geom_map(data=reg_data, map=italy_map,
                    aes(fill=value, map_id=region),
                    color="#b2b2b2", size=0.1)
gg

# nuestro mapa está casi listo, pero se verá algo estirado
# con 'coord_fixed' le daremos una apariencia cuadrada
gg <- gg + coord_fixed(ratio = 1)
gg



#################################   USA states
usa_map <- map_data("state")
str(usa_map)
head(usa_map)

reg_data <- tibble(region=unique(usa_map$region),
                   value=sample(100, length(region)))

gg <- ggplot()

gg <- gg + geom_map(data=usa_map, map=usa_map,
                    aes(long, lat, map_id=region),
                    color="#b2b2b2", size=0.1, fill=NA)
gg


gg <- gg + geom_map(data=reg_data, map=usa_map,
                    aes(fill=value, map_id=region),
                    color="#b2b2b2", size=0.1)
gg

gg <- gg + coord_fixed(ratio = 1.5)
gg



#################################   WORLD and WORLD2 TAREA
world_map <- map_data("world") #world2
str(world_map)
head(world_map)

reg_data <- tibble(region=unique(world_map$region),
                   value=sample(300, length(region)))

gg <- ggplot()

gg <- gg + geom_map(data=world_map, map=world_map,
                    aes(long, lat, map_id=region),
                    color="#b2b2b2", size=0.1, fill=NA)
gg


gg <- gg + geom_map(data=reg_data, map=world_map,
                    aes(fill=value, map_id=region),
                    color="#b2b2b2", size=0.1)
gg

gg <- gg + coord_fixed(ratio = 1)
gg


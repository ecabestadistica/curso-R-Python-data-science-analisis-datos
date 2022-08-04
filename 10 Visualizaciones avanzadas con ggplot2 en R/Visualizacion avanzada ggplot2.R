### Visualizaciones avanzadas con ggplot2

# Instalando el paquete
install.packages("ggplot2")
library(ggplot2)

# Importar los datos
# Dataset "mpg" (pertenece a ggplot2)
?mpg
data <- ggplot2::mpg

# Convertir las variables categóricas en tipo "factor"
data <- transform(data,
                 cyl = factor(cyl),
                 drv = factor(drv),
                 fl = factor(fl),
                 year = factor(year),
                 class = factor(class)
)

## Scatterplot (Diagrama de dispersion)
ggplot(data) +  # datos
  aes(x=displ, y=hwy) +   # variables
  geom_point()  #tipo de gráfico: puntos
  
# Forma alternativa (con el aes dentro del ggplot):
ggplot(data, aes(x=displ, y=hwy) ) +  # datos y variables
  geom_point()  #tipo de gráfico: puntos

## Gráfico de línea 
ggplot(data) +
  aes(x = displ, y = hwy) +
  geom_line()   #tipo de gráfico: linea

## Gráfico combinado de líneas y puntos
ggplot(data) +
  aes(x = displ, y = hwy) +
  geom_point() +
  geom_line() # añadir linea

# Cambiar colores y tamaño
ggplot(data) +
  aes(x = displ, y = hwy, color="red", size=cty) + 
  geom_point() 

# color respecto a una variable categorica y tamaño con cuantitativa
ggplot(data) +
  aes(x = displ, y = hwy, color=year, size=cty) + 
  geom_point() 

# color respecto a una variable cuantitativa
ggplot(data) + 
  aes(x = displ, y = hwy, color = cty) + 
  geom_point() +
  scale_colour_gradient2(
    low = "green",
    mid = "gray",
    high = "red",
    midpoint = median(data$cty)
  )

# añadir texto en puntos
ggplot(data) + 
  aes(x = displ, y = hwy, color = cty) + 
  geom_point() + 
  geom_text(aes(label = rownames(data)),
              check_overlap = TRUE,
              size = 2,
              vjust = -1)

#añadir texto en grafico
ggplot(data) + 
  aes(x = displ, y = hwy, color = cty) + 
  geom_point() + 
  annotate("text",
           x = 5,
           y = 40,
           label = "hwy and displ are \n negatively correlated \n (rho = -0.77, p-value < 0.001)",
           size = 3
)

# suavizado (smooth) 
ggplot(data) + 
  aes(x = displ, y = hwy, color = cty) + 
  geom_point() + 
  geom_smooth()

# metodo lm (regresión lineal)
ggplot(data) + 
  aes(x = displ, y = hwy, color = cty) + 
  geom_point()+ 
  geom_smooth(method = lm)

# facetas: dividir en paneles
ggplot(data) + 
  aes(x = displ, y = hwy, color = cty) + 
  geom_point() + 
  facet_grid(. ~ drv)


## Histograma
ggplot(data) +
  aes(x = hwy) +
  geom_histogram()

# Numero de barras = sqrt(n)
ggplot(data) +
  aes(x = hwy) +
  geom_histogram(bins = sqrt(nrow(data)))


# Personalizacion
ggplot(data) +
  aes(x = hwy) +
  geom_histogram(bins = sqrt(nrow(data)), fill="magenta") # fill con color

ggplot(data) +
  aes(x = hwy) +
  geom_histogram(bins = sqrt(nrow(data)), aes(fill=class)) # fill con variable

ggplot(data) +
  aes(x = hwy) +
  geom_histogram(bins = sqrt(nrow(data)), aes(fill=class), color="black") # color del borde


## Gráfico de densidades
ggplot(data) +
  aes(x = hwy) +
  geom_density()

# varias
ggplot(data) +
  aes(x = hwy) +
  geom_density(aes(fill=drv), alpha=0.25)

## Combinacion de histograma + densidad
ggplot(data) +
  aes(x = hwy, y = ..density..) +
  geom_histogram() +
  geom_density()


## Boxplot
ggplot(data) +
  aes(x = "", y = hwy) +
  geom_boxplot()

# varios
ggplot(data) +
  aes(x = drv, y = hwy) +
  geom_boxplot()


ggplot(data) +
  aes(x = drv, y = hwy) +
  geom_boxplot() + 
  geom_jitter(alpha = 0.25, width = 0.2) # datos aleatorios


ggplot(data) +
  aes(x = drv, y = hwy) +
  geom_boxplot() + # 
  geom_jitter(alpha = 0.25, width = 0.2) + 
  facet_wrap(~year) # faceta: dividir en 2 paneles según el año



ggplot(data) +
  aes(x = drv, y = hwy, fill = drv) + # añadir color de relleno
  geom_boxplot(varwidth = TRUE) + 
  geom_jitter(alpha = 0.25, width = 0.2) + 
  facet_wrap(~year) 

## Barplot
ggplot(data) +
  aes(x = drv) +
  geom_bar()

# con colores
ggplot(data) +
  aes(x = drv, fill = drv) + # colores de relleno
  geom_bar() +
  theme(legend.position = "none") # quitar leyenda


ggplot(data) +
  aes(x = drv, fill = year) + # fill con respecto a una vble cualitativa: years
  geom_bar()

# para comparar entre grupos (proporciones), se pueden poner las barras del mismo tamaño
ggplot(data) +
  geom_bar(aes(x = drv, fill = year), position = "fill") #position fill

# dibujar dos barras una a continuacion de la otra para cada valor de drv
ggplot(data) +
  geom_bar(aes(x = drv, fill = year), position = "dodge")


## Personalizacion avanzada
# Titulos, subtitulos, etc
p <- ggplot(data) +
  aes(x = displ, y = hwy) +
  geom_point()
p + labs(
  title = "Fuel efficiency for 38 popular models of car",
  subtitle = "Period 1999-2008",
  caption = "Data: ggplot2::mpg. See more at www.statsandr.com",
  x = "Engine displacement (litres)",
  y = "Highway miles per gallon (mpg)"
)


# Temas: modificar aún más los labs:
p + labs(
  title = "Fuel efficiency for 38 popular models of car",
  subtitle = "Period 1999-2008",
  caption = "Data: ggplot2::mpg. See more at www.statsandr.com",
  x = "Engine displacement (litres)",
  y = "Highway miles per gallon (mpg)"
) +
  theme(
    plot.title = element_text(
      hjust = 0.5, # center
      size = 12,
      color = "steelblue",
      face = "bold"
    ),
    plot.subtitle = element_text(
      hjust = 0.5, # center
      size = 10,
      color = "gray",
      face = "italic"
    )
  )


# Leyenda
p + aes(color = class) +
  theme(legend.position = "top")


# Creando varios gráficos de diferentes tipos en una sola imagen
p_a <- ggplot(data) +
  aes(x = displ, y = hwy) +
  geom_point()
p_b <- ggplot(data) +
  aes(x = hwy) +
  geom_histogram()
p_c <- ggplot(data) +
  aes(x = drv, y = hwy) +
  geom_boxplot()

install.packages("patchwork")
library(patchwork)

p_a + p_b + p_c

p_a / p_b / p_c

p_a + p_b / p_c

(p_a + p_b) / p_c


# Ajustando las coordenadas
# sin ajustar
p1 <- ggplot(data) +
  aes(x = class, y = hwy) +
  geom_boxplot()
# ajustadas
p2 <- ggplot(data) +
  aes(x = class, y = hwy) +
  geom_boxplot() +
  coord_flip()


p1 + p2 

# vertical
ggplot(data) +
  aes(x = class) +
  geom_bar()

# horizontal
ggplot(data) +
  aes(x = class) +
  geom_bar() +
  coord_flip()

# Guardar gráfico
getwd()
setwd('/Users/elisacabana/Documents/UDEMY Github/0. Curso R y Python/11 Librería ggplot2')
getwd()
ggplot(data) +
  aes(x = displ, y = hwy) +
  geom_point()
ggsave("plot1.pdf")
getwd()




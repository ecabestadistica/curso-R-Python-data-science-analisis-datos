### Importar datos
# Hay conjuntos de datos que ya están dentro de R, por ejemplo el USA states (datos de 50 estados de EE.UU)
?state.x77

#Cargar los datos
X <- as.data.frame(state.x77)
X

#Dimensiones
dim(X)

n.X <- nrow(X)
n.X
p.X <- ncol(X)
p.X

#Resumen estadístico de cada variable
summary(X)

#Vector de medias por columna
mu.X <- colMeans(X)
mu.X

#Matriz de covarianza
S.X <- cov(X)
S.X

#Matriz de correlaciones
R.X <- cor(X)
R.X

#Seleccionando subconjuntos
X[X$Population>9000,]

X[(X$Population>9000) & (X$Income>5000),]

subset=X[(X$Population>9000) & (X$Income>5000), c("Population", "Income", "Area")]
subset


## Importar desde un .csv
cancerdata <- read.csv("~/Documents/UDEMY Github/0. Curso R y Python/9 Importar y exportar datos/5 Importar y exportar datos en R/cancerdata.csv")

#Dimensiones
dim(cancerdata)


#Resumen estadístico de cada variable
summary(cancerdata)

# Filtrar
subset_cancerdata=cancerdata[(cancerdata$radius_mean>17) & (cancerdata$diagnosis=="M"),]
subset_cancerdata
dim(subset_cancerdata)

## Guardar un .csv
write.csv(subset_cancerdata,"~/Documents/UDEMY Github/0. Curso R y Python/9 Importar y exportar datos/5 Importar y exportar datos en R/subset_cancerdata.csv")



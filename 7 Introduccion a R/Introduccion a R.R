### Introducción a R

## Variables

#integer (la "L" es para exigir que sea entera)
x <- 3L
typeof(x)

#double
y <- 3.3
typeof(y)

z <- 3
typeof(z)

#complex
c <- 9 + 4i
typeof(c)

#string / character (vale comilla doble o simple)
s <- "a"
typeof(s)

ch <- 'b' 
typeof(ch)

#logical
t <- T
typeof(t)

t <- TRUE
typeof(t)

f <- F
typeof(f)

f <- FALSE
typeof(f)

#vector de doubles
v <- c(1,2,3)
typeof(v)

#vector de caracteres
v <- c("a","b","c")
typeof(v)

## Operaciones

a <- 3
b <- 5

#suma
a+b

#resta
a-b

#división
a/b

#producto
a*b

#exponente
b^a

#división entera
a%%b

#raíz cuadrada (es una función)
sqrt(a)
sqrt(b^a)

#operaciones con strings
string1 <- "Me gusta"
string2 <- "R"
mensaje <- paste(string1,string2)
mensaje

#operaciones matemáticas y estadísticas con vectores
x <- c(1,2,3,4,5,6,7,8,9,10,0)
mean(x) #media
var(x) #varianza
sd(x) #standard deviation

sum(x) #suma de todos los elementos
prod(x) #producto de todos los elementos

sin(x)
cos(x)
tan(x)
sqrt(x)
exp(x)
log(x)

max(x)
min(x)

sort(x)

## Generación de sucesiones
1:30
10*1:10
30:1

#con seq(min,max,step)
seq(1,30) #equivalente a 1:30
seq(1,30,5)

#con rep(valor o vector, numero de repeticiones)
rep(1,10)
rep(x,10)

## Operadores lógicos
x==0
x!=0
x==10
x<5
x>=5

## Conversiones
typeof(x)

y=as.integer(x)
y
typeof(y)

y=as.character(x)
y
typeof(y)

y=as.factor(x)
y
typeof(y)

y=as.logical(x)
y
typeof(y)

y=as.null(x)
y
typeof(y)

#Verificar un tipo de dato concreto
is.integer(x)
is.logical(x)
is.character(x)
is.numeric(x)

## Cadenas de texto
install.packages("stringr")
library(stringr)
x <- c("manzana", "plátano", "pera") 
x
#detectar qué elemento contiene la "e":
str_detect(x, "e") 
#contar cuántos "e" hay contenidos en cada elemento:
str_count(x, "e") 
#contar cuántas "a" hay contenidos en cada elemento:
str_count(x, "a") 
#reemplazar las coincidencias
str_replace(x, "[aeiou]", "-") #reemplazar la primera vocal (sin tilde) por un guión "-"
str_replace_all(x, "[aeiou]", "-") #reemplazar todas las vocales (sin tilde) por un guión "-"
str_replace_all(x, "[aeiouáéíóú]", "-") #reemplazar todas las vocales (con o sin tilde) por un guión "-"

## Matrices
#crear una matriz de tres filas y cuatro columnas, con los numeros del 1:12:
matrix(1:12, nrow = 3, ncol = 4)

#crear una matriz de tres filas y cuatro columnas, con todos los elementos = 3:
matrix(3, nrow = 3, ncol = 4)

#unir vectores como filas o columnas
v1 <- 1:5
v2 <- 6:10
v3 <- 11:15

v1; v2; v3

mi_matriz <- rbind(v1,v2,v3) #unir por filas (rows)
mi_matriz 
mi_matriz <-cbind(v1,v2,v3) #unir por columnas (columns)
mi_matriz 

# Operaciones con matrices
mi_matriz + 100
mi_matriz - 99
mi_matriz * 50
mi_matriz / 2
mi_matriz ^ 3
t(mi_matriz) #transpuesta

## Acceso a elementos
# Elementos de un vector
x <- seq(1,100,10)
x
x[1] #primer elemento del vector x
x[2] #segundo elemento del vector x
x[-1] #todos los elementos del vector x, excepto el primero
x[-3] #todos los elementos del vector x, excepto el tercero
x[1:3] #los tres primeros elementos de x
x[c(1,3,10)] #primer, tercero y último elemento de x

# Elementos de una matriz (uno)
mi_matriz <- mi_matriz*10
mi_matriz
mi_matriz[1] #primer elemento de mi_matriz
mi_matriz[2] #segundo elemento de mi_matriz
mi_matriz[6] #sexto elemento de mi_matriz (cuenta fila por fila para cada columna)
mi_matriz[-1] #todos los elementos excepto el primero. Devuelve un vector porque ya no cuadran las dimensiones
mi_matriz[-3] #todos los elementos excepto el tercero
mi_matriz[1:3] #los tres primeros elementos de mi_matriz. Devuelve un vector
mi_matriz[c(1,3,10)] #primer, tercero y último elemento de mi_matriz. Devuelve un vector


# Elementos de una matriz (especificando dos: fila x columna)
mi_matriz
mi_matriz[1,1] #fila 1 y columna 1
mi_matriz[1,] #fila 1 y todas las columnas
mi_matriz[,1] #columna 1 y todas las filas
mi_matriz[1:3,] #tres primeras filas y todas las columnas
mi_matriz[c(1,4),] #fila 1 y 4, y todas las columnas
mi_matriz[,"v1"] #todas las filas de la columna llamada "v1"
mi_matriz[,c("v1","v3")] #todas las filas de la columna llamada "v1" y la "v3"

#usando condicionales
mi_matriz>50
mi_matriz[mi_matriz>50]

#Nombrando dimensiones de matrices
rownames(mi_matriz)
rownames(mi_matriz) <- c("user1", "user2", "user3", "user4", "user5")
rownames(mi_matriz)
mi_matriz

colnames(mi_matriz)
colnames(mi_matriz) <- c("var1","var2","var3")
mi_matriz

mi_matriz["user1",]
mi_matriz["user1","var2"]
mi_matriz["user1",1:2]

## Dataframes
# Convertir una matriz a dataframe
df <- data.frame(mi_matriz)
df
head(df)

#Acceso a elementos
df[1,1]
df[1:3,1:2]
df[,2:3]

df$var1
df$var2
df$var3

#Subconjuntos 
#seleccionar todas las filas cuya variable 1 cumpla la condición, y devuelve todas las columnas
df[df$var1>=30,] 
#con dos condiciones 
df[(df$var1>=30) & (df$var2>=100),]  
#devolver solamente dos columnas
df[(df$var1>=30) & (df$var2>=100), c("var1","var2")]  

#Resumen estadístico
summary(df)

## Crear una Función
#que calcule la media de la columna elegida de un dataframe:
funcion_media <- function(dataframe, columna) {
  mean(dataframe[,columna])
}

#comprobar la funcion:
funcion_media(df,1)
#debe coincidir con:
mean(df$var1)

#comprobar la funcion:
funcion_media(df,2)
#debe coincidir con:
mean(df$var2)

#comprobar la funcion:
funcion_media(df,3)
#debe coincidir con:
mean(df$var3)

# Función que calcule la media de la columna elegida de un dataframe, y devuelva un mensaje si es mayor que 50:
funcion_media <- function(dataframe, columna) {
  m=mean(dataframe[,columna])
  if (m>50) {
    print("La media de esta columna es mayor que 50")
  } else {
    print("La media de esta columna NO es mayor que 50")
  }
}

#comprobar la funcion:
funcion_media(df,1)
mean(df$var1)

#comprobar la funcion:
funcion_media(df,2)
mean(df$var2)

#comprobar la funcion:
funcion_media(df,3)
mean(df$var3)

# Función que calcule la media de todas las columnas del dataframe
funcion_todas_medias <- function(dataframe) {
  #p: numero de columnas
  p=dim(dataframe)[2]
  
  #vector de ceros del tamaño de la dimensión
  mean_vector=rep(0,p)
  
  #para cada columna, calcula la media de la columna y guardala
  for (i in 1:p) {
    m=mean(dataframe[,i])
    mean_vector[i]=m
  }
  #devuelve el vector de medias
  mean_vector
}

#comprobar la funcion:
funcion_todas_medias(df)
mean(df$var1)
mean(df$var2)
mean(df$var3)




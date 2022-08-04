# Series temporales en R

library(readr)
sbux.df <- read.csv("~/Documents/UDEMY Github/0. Curso R y Python/12 Series temporales en R/2 Trabajar con series temporales en R/sbuxPrices.csv")

msft.df <- read.csv("~/Documents/UDEMY Github/0. Curso R y Python/12 Series temporales en R/2 Trabajar con series temporales en R/msftPrices.csv")


# Convertir los datos en time-series
sbux.ts = ts(data=sbux.df$Adj.Close, frequency = 12, start=c(1993,3), end=c(2008,3))
class(sbux.ts)  #clase ts (time series)

msft.ts = ts(data=msft.df$Adj.Close, frequency = 12, start=c(1993,3), end=c(2008,3))
class(msft.ts) 

# Fechas y frecuencia de la serie
sbux.ts 
start(sbux.ts) 
end(sbux.ts) 
frequency(sbux.ts) 

# Extraer un subconjunto de la serie
tmp = sbux.ts[1:5] #numeric
class(tmp)

tmp = window(sbux.ts, start=c(1993, 3), end=c(1993,8)) # se mantiene como "ts"
class(tmp)


# Combinar dos series temporales en dos columnas dentro del mismo dataset
sbuxmsft.ts = cbind(sbux.ts, msft.ts) 
class(sbuxmsft.ts) #clase mts (multiple time series)


# Plot objeto ts
plot(sbux.ts, col="blue", lwd=2, ylab="Adjusted close",
     main="Monthly closing price of SBUX") 



# Dibujar un subconjunto (Acercar)
plot(window(sbux.ts, start=c(2000,3), end=c(2008,3)),
     ylab="Adjusted close",col="blue", lwd=2,
     main="Monthly closing price of SBUX") 


# Plot para multiples columnas
# En graficos diferentes
plot(sbuxmsft.ts) 


# Plot en el mismo grafico
plot(sbuxmsft.ts, plot.type="single",
     main="Monthly closing prices on SBUX and MSFT",
     ylab="Adjusted close price",
     col=c("blue", "red"), lty=1:2)
legend(1994, 35, legend=c("SBUX","MSFT"), col=c("blue", "red"),
       lty=1:2)
















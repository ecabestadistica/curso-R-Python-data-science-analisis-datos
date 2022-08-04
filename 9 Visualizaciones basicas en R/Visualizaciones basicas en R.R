### Visualizaciones básicas en R

# Cargar los datos
X <- as.data.frame(state.x77)
X

#Boxplot
boxplot(X$Population)
boxplot(X$Population, col="blue")
boxplot(X) 
?boxplot

#Histograma
hist(X[,"Murder"],main="Murder Histogram",xlab="",col="cyan")

#Scatterplot (pch: símbolo)
plot(X$Income,X$Population,pch=5,col="magenta",xlab="Income",ylab="Population")

pairs(X,pch=19,col="blue")


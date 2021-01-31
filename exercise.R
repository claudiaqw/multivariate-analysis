library(tidyverse)
library(dplyr)
library(GGally)

original_sales = read.csv(file = "HomeSalesData.csv", header=T, sep=",")

glimpse(original_sales)

sum(is.na(original_sales)) #no hay NAs en los datos
#hist(rowMeans(is.na(sales)))
#barplot(colMeans(is.na(sales)), las=2)

sales <- select(original_sales, -c('id', 'date'))
head(sales)


price <- original_sales[c('id', 'price')]
head(price)

sales <- select(sales, -c('price'))



#4. Anadir analisis descriptivo multivariante (numerico y grafico)
summary(sales)

boxplot(sales, las=2, col="darkblue")

boxplot(sales$sqft_lot, las=2, col="darkblue")

R = cor(sales)   # correlation matrix
R

pairs(sales)


#5. Aplicar herramienta PCA e interpretar: 2 puntos
pca = prcomp(sales, scale=T)
# pca = princomp(nba, cor=T) # the same, but using SVD instead of eigen decomposition 
summary(pca)

eigen(R)  # the same, with numeric format; here, eigenvalues denote variances and eigenvectors denote loadings

# how many components to consider?
screeplot(pca,main="Screeplot",col="blue",type="barplot",pch=19)




#6. Aplicar herramienta FA e interpretar: 2 puntos








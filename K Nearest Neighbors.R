### K Nearest Neighbor

library(ISLR)
str(Caravan)
summary(Caravan$Purchase)
any(is.na(Caravan))

var(Caravan[,1])
var(Caravan[,2])

purchase <- Caravan[,86]
# Standardize Dataset in R
standardized.Caravan <- scale(Caravan[,-86])

print(var(standardized.Caravan[,1]))
print(var(standardized.Caravan[,2]))

# Test
test.index <- 1:1000
test.data <- standardized.Caravan[test.index,]
test.purchase <- purchase[test.index]

# Train
train.data <- standardized.Caravan[-test.index,]
train.purchase <- purchase[-test.index]


# KNN Model
library(class)
set.seed(101)

predicted.purchase <- knn(train.data,test.data,train.purchase,k=1)

print(head(predicted.purchase))


# Using Different K value Where k=3

predicted.purchase <- knn(train.data,test.data,train.purchase,k=3)
mean(test.purchase != predicted.purchase)

# k=5

predicted.purchase <- knn(train.data,test.data,train.purchase,k=5)
mean(test.purchase != predicted.purchase)

# Null vs. NA
predicted.purchase = NULL
error.rate = NULL

for(i in 1:20){
  set.seed(101)
  predicted.purchase = knn(train.data,test.data,train.purchase,k=i)
  error.rate[i] = mean(test.purchase != predicted.purchase)
}


print(error.rate)


# Elbow Method
library(ggplot2)

k.values <- 1:20

error.df <- data.frame(error.rate,k.values)

error.df

# Determining Misclassification
ggplot(error.df,aes(x=k.values,y=error.rate)) + geom_point()+ geom_line(lty="dotted",color='red')


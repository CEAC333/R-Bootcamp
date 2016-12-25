# K Nearest Neighbors Project

library(ISLR)
head(iris)
str(iris)
# Scale the Data

stand.features <- scale(iris[1:4])
print(var(stand.features[,1]))

# Final Data
final.data <- cbind(stand.features,iris[5])

head(final.data)


# Train Test Splits
set.seed(101)
library(caTools)

sample <- sample.split(final.data$Species,SplitRatio = 0.7)

train <- subset(final.data, sample ==T)
test <- subset(final.data, sample == F)


# KNN

library(class)

predicted.species <- knn(train[1:4],test[1:4],train$Species,k=1)


predicted.species


# Misclassficiation Data


mean(test$Species != predicted.species)

# Choosing a K Value


predicted.species <- NULL
error.rate <- NULL

for(i in 1:10){
  set.seed(101)
  predicted.species <- knn(train[1:4],test[1:4],train$Species,k=i)
  error.rate[i] <- mean(test$Species != predicted.species)
}



library(ggplot2)
k.values <- 1:10
error.df <- data.frame(error.rate,k.values)



plot <- ggplot(error.df,aes(x=k.values,y=error.rate)) + geom_point()
plot + geom_line(lty="dotted",color='red')



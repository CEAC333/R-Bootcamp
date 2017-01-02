# Neural Nets in R

## Load Libraries
library(MASS)
head(Boston)

## Structure of Data
str(Boston)

## Checking for NA Values
any(is.na(Boston))


data <- Boston

## Normalize Our Data

maxs <- apply(data,2,max)
maxs

mins <- apply(data,2,min)
mins

scaled.data <- scale(data,center=mins,scale = maxs-mins)
scaled <- as.data.frame(scaled.data)
head(scaled)
head(Boston)


## Machine Learning
library(caTools)
split <- sample.split(scaled$medv,SplitRatio = 0.7)
train <- subset(scaled,split==T)
test <- subset(scaled,split==F)
head(train)

## Neural Net
library(neuralnet)

n <- names(train)
n

f <- as.formula(paste("medv ~ ", paste(n[!n %in% "medv"], collapse = " + ")))
f

nn <- neuralnet(f, data = train, hidden = c(5,3), linear.output = TRUE)
plot(nn)


predicted.nn.values <- compute(nn,test[1:13])
str(predicted.nn.values)


true.predictions <- predicted.nn.values$net.result * 
  (max(data$medv) - min(data$medv) + min(data$medv))

## Convert the Test Data

test.r <- (test$medv) * max((data$medv) - min(data$medv)) + min(data$medv)
MSE.nn <- sum((test.r - true.predictions)^2/nrow(test))
MSE.nn

error.df <- data.frame(test.r,true.predictions)
head(error.df)

library(ggplot2)

ggplot(error.df, aes(x=test.r,y=true.predictions)) + 
  geom_point() + stat_smooth()


#### Linear Regression 

setwd("./R Bootcamp/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Machine Learning with R")
## Part 1

df <- read.csv('student-mat.csv',sep=';')
head(df)
summary(df)
str(df)
# Checking for Null Values
any(is.na(df))

# Loading libraries:
library(ggplot2)
library(ggthemes)
library(dplyr)
library(corrgram)
library(corrplot)


# Num Only

num.cols <- sapply(df,is.numeric)

# Filter
cor.data <- cor(df[,num.cols])
print(cor.data)


print(corrplot(cor.data,method = 'color'))

corrgram(df)
help("corrgram")

corrgram(df,order=TRUE,lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt)

ggplot(df,aes(x=G3)) + geom_histogram(bins=20,alpha=0.5,fill='blue')

## Part 2
library(caTools)

# Set a Seed
set.seed(101)

#Split up Sample
sample <- sample.split(df$G3,SplitRatio = 0.7)

# 70% of data -> train
train <- subset(df,sample == TRUE)

# 30% will be test
test <- subset(df,sample == FALSE)

# Train and Build Model
model <- lm(G3 ~ ., data = train)

# Run Model

# Interpret Model
summary(model)

res <- residuals(model)
class(res)

res <- as.data.frame(res)
head(res)

ggplot(res, aes(res)) + geom_histogram(fill='blue',alpha=0.5)


## Part 3

# Predictions
G3.predictions <- predict(model,test)

results <- cbind(G3.predictions,test$G3)
colnames(results) <- c('predicted','actual')
results <- as.data.frame(results)
head(results)

# Take Care of Neg Values
to_zero <- function(x){
  if(x <0){
    return(0)
  }else{
    return(x)
  }
}

# Apply Zero Function
results$predicted <- sapply(results$predicted, to_zero)

# Mean Squared Error (MSE)

mse <- mean((results$actual - results$predicted)^2)
print('MSE')
print(mse)


# RMSE
print(mse^0.5)

#######
SSE <- sum((results$predicted - results$actual)^2)
SST <- sum((mean(df$G3) - results$actual)^2)

R2 <- 1 - SSE/SST
print('R2')
print(R2)
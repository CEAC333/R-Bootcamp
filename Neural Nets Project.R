# Neural Nets Project

setwd('./R Bootcamp/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Training Exercises/Machine Learning Projects/CSV files for ML Projects')

## Reading the Data
df <- read.csv('bank_note_data.csv')
head(df)

any(is.na(df))

## Train Test Split
library(caTools)
set.seed(101)
split <- sample.split(df$Class,SplitRatio = 0.7)

train <- subset(df,split==TRUE)
test <- subset(df,split==FALSE)

## Neural Nets

library(neuralnet)

nn <- neuralnet(Class ~ Image.Var + Image.Skew + Image.Curt + Entropy, 
          data=train, hidden = c(5,3), linear.output = FALSE)
predicted.nn.values <- compute(nn,test[1:4])
predicted.nn.values

head(predicted.nn.values$net.result)

## Rounding the Data
predictions <- sapply(predicted.nn.values$net.result,round)
head(predictions)

## Confusion Matrix

table(predictions, test$Class)


## Random Forest
library(randomForest)

df$Class <- factor(df$Class)
library(caTools)
set.seed(101)
split = sample.split(df$Class, SplitRatio = 0.70)

train = subset(df, split == TRUE)
test = subset(df, split == FALSE)

model <- randomForest(Class ~ Image.Var + 
    Image.Skew + Image.Curt + Entropy,data=train)

rf.pred <- predict(model,test)

table(rf.pred,test$Class)

### Models are very close to each other.
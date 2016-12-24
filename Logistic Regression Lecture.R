##  Logistic Regression

# Part 1

setwd("./R Bootcamp/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Machine Learning with R")

df.train <- read.csv('titanic_train.csv')
head(df.train)
str(df.train)

library(Amelia)
library(ggplot2)
help("missmap")

missmap(df.train,main = 'Missing Map', col = c('yellow','black'),legend=FALSE)
# Survived
ggplot(df.train,aes(Survived)) + geom_bar()

# Pclass
ggplot(df.train,aes(Pclass)) + geom_bar(aes(fill=factor(Pclass)))

# Sex
ggplot(df.train,aes(Sex)) + geom_bar(aes(fill=factor(Sex)))

# Hist of Age
ggplot(df.train,aes(Age)) + geom_histogram(bins=20,fill='blue',alpha=0.5)

# SibSp
ggplot(df.train,aes(SibSp)) + geom_bar(aes(fill=factor(SibSp)))


# Fare Histogram
ggplot(df.train,aes(Fare)) + geom_histogram(fill='green',color='black',alpha=0.5,bins=20)

# Boxplot Pclass
plot <- ggplot(df.train,aes(Pclass,Age))
plot <- plot + geom_boxplot(aes(group=Pclass,fill=factor(Pclass),alpha=0.4))
plot + scale_y_continuous(breaks = seq(min(0),max(80),by=2)) + theme_bw()

# Imputation of Age Based on Class
impute_age <- function(age,class){
out <- age
for (i in 1:length(age)){
  
  if (is.na(age[i])){
    
    if (class[i] == 1){
      out[i] <- 37
      
    }else if (class[i] == 2){
      out[i] <- 29
      
    }else{
      out[i] <- 24
    }
  }else{
    out[i]<-age[i]
  }
}
return(out)
}


# Building a Logistic Regression Model (Part 2)

fixed.ages <- impute_age(df.train$Age,df.train$Pclass)

df.train$Age <- fixed.ages

missmap(df.train, main="Titanic Training Data - Missings Map", 
        col=c("yellow", "black"), legend=FALSE)

## Get the str of the data
str(df.train)


## Remove What We Don't Use

head(df.train,3)


## Relevant Columns for Training


library(dplyr)

df.train <- select(df.train,-PassengerId,-Name,-Ticket,-Cabin)

head(df.train,3)

## Set Factor Columns

str(df.train)

df.train$Survived <- factor(df.train$Survived)
df.train$Pclass <- factor(df.train$Pclass)
df.train$Parch <- factor(df.train$Parch)
df.train$SibSp <- factor(df.train$SibSp)


## Train the Model

log.model <- glm(formula=Survived ~ . , family = binomial(link='logit'),data = df.train)
summary(log.model)


## Predictting Using Test Cases

library(caTools)
set.seed(101)

split = sample.split(df.train$Survived, SplitRatio = 0.70)

final.train = subset(df.train, split == TRUE)
final.test = subset(df.train, split == FALSE)


## Final Logistic Model


final.log.model <- glm(formula=Survived ~ . , family = binomial(link='logit'),data = final.train)

summary(final.log.model)

## Checking Prediction Accuracy

fitted.probabilities <- predict(final.log.model,newdata=final.test,type='response')
fitted.results <- ifelse(fitted.probabilities > 0.5,1,0)

misClasificError <- mean(fitted.results != final.test$Survived)
print(paste('Accuracy',1-misClasificError))


## Conculsion Matrix

table(final.test$Survived, fitted.probabilities > 0.5)


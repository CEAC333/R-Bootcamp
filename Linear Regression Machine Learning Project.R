# Linear Regression Machine Learning Project With R


setwd("./R Bootcamp/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Training Exercises/Machine Learning Projects/CSV files for ML Projects")

bike <- read.csv('./bikeshare.csv')
head(bike)

## Exploratory Data Analysis

library(ggplot2)
library(dplyr)

ggplot(bike,aes(temp,count)) + geom_point(alpha=0.3,aes(color=temp)) + theme_bw()

# Convert to Timestamp
bike$datetime <- as.POSIXct(bike$datetime)

plot <- ggplot(bike,aes(datetime,count)) + geom_point(aes(color=temp), alpha = 0.5)
print(plot)
plot + scale_color_continuous(low='#55D8CE',high = '#FF6E2E') + theme_bw()


cor(bike[,c('temp','count')])
ggplot(bike,aes(factor(season),count)) + geom_boxplot(aes(color=factor(season))) + theme_bw()

# Feature Engineering

bike$hour <- sapply(bike$datetime,function(x){format(x, "%H")})
head(bike)

# Scatterplot

## For Working Days
plot <- ggplot(filter(bike,workingday==1),aes(hour,count))

plot <- plot + geom_point(position=position_jitter(w=1, h=0),aes(color=temp),alpha=0.5)
plot <- plot + scale_color_gradientn(colours = c('dark blue','blue','light blue','light green','yellow','orange','red'))
plot + theme_bw()

## For Non-Working Days
plot <- ggplot(filter(bike,workingday==0),aes(hour,count)) 
plot <- plot + geom_point(position=position_jitter(w=1, h=0),aes(color=temp),alpha=0.8)
plot <- plot + scale_color_gradientn(colours = c('dark blue','blue','light blue','light green','yellow','orange','red'))
plot + theme_bw()


## Building the Linear Model

temp.model <- lm(count~temp,bike)


## Getting the Summary of the Model
summary(temp.model)


## How many bike rentals would we predict if the temperature was 25 degrees Celsius? Calculate this two ways:

# * Using the values we just got above
# * Using the predict() function


# Method 1
6.0462 + 9.17*25



# Method 2
temp.test <- data.frame(temp=c(25))
predict(temp.model,temp.test)


# Columns of Numeric Values

bike$hour <- sapply(bike$hour,as.numeric)

# Building Models Based on Different Variables

model <- lm(count ~ . -casual - registered -datetime -atemp,bike )
summary(model)



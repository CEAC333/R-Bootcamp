## Logistic Regression Project


# Part 1
setwd("./R Bootcamp/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Training Exercises/Machine Learning Projects/CSV files for ML Projects")

adult <- read.csv("./adult_sal.csv")
head(adult)

library(dplyr)

adult <- select(adult,-X)
str(adult)
summary(adult)


table(adult$type_employer)
### Data Cleaning

# Combine Employer Type
unemp <- function(job){
  job <- as.character(job)
  if (job=='Never-worked' | job == 'Without-pay'){
    return("Unemployed")
  }else{
    return(job)
  }
}

#### Apply
adult$type_employer <- sapply(adult$type_employer,unemp)
##
print(table(adult$type_employer))



# Group Self-Employment and State and Local
group_emp <- function(job){
  if (job=='Local-gov' | job == 'State-gov'){
    return("SL-gov")
  }else if (job=='Self-emp-inc' | job=='Self-emp-not-inc'){
    return('self-emp')
  }else{
    return(job)
  }
}

####
adult$type_employer <- sapply(adult$type_employer,group_emp)
##
print(table(adult$type_employer))


### Marital Status

table(adult$marital)

##
group_marital <- function(mar){
  mar <- as.character(mar)
  
  # Not-Married
  if (mar=='Separated' | mar=='Divorced' | mar=='Widowed'){
    return('Not-Married')
    
    # Never-Married   
  }else if(mar=='Never-married'){
    return(mar)
    
    #Married
  }else{
    return('Married')
  }
}


adult$marital <- sapply(adult$marital,group_marital)
table(adult$marital)


## Country
table(adult$country)
levels(adult$country)


Asia <- c('China','Hong','India','Iran','Cambodia','Japan', 'Laos' ,
          'Philippines' ,'Vietnam' ,'Taiwan', 'Thailand')

North.America <- c('Canada','United-States','Puerto-Rico' )

Europe <- c('England' ,'France', 'Germany' ,'Greece','Holand-Netherlands','Hungary',
            'Ireland','Italy','Poland','Portugal','Scotland','Yugoslavia')

Latin.and.South.America <- c('Columbia','Cuba','Dominican-Republic','Ecuador',
                             'El-Salvador','Guatemala','Haiti','Honduras',
                             'Mexico','Nicaragua','Outlying-US(Guam-USVI-etc)','Peru',
                             'Jamaica','Trinadad&Tobago')
Other <- c('South')



group_country <- function(ctry){
  if (ctry %in% Asia){
    return('Asia')
  }else if (ctry %in% North.America){
    return('North.America')
  }else if (ctry %in% Europe){
    return('Europe')
  }else if (ctry %in% Latin.and.South.America){
    return('Latin.and.South.America')
  }else{
    return('Other')      
  }
}


adult$country <- sapply(adult$country,group_country)
table(adult$country)

# Rechecking the Data
str(adult)


adult$type_employer <- sapply(adult$type_employer,factor)
adult$country <- sapply(adult$country,factor)
adult$marital <- sapply(adult$marital,factor)


### Part 2 (Missing Data)
library(Amelia)

## Adult Transformation

adult[adult=='?'] <- NA
table(adult$type_employer)


# Factor Transformation After the Code
adult$type_employer <- sapply(adult$type_employer,factor)
adult$country <- sapply(adult$country,factor)
adult$marital <- sapply(adult$marital,factor)

table(adult$type_employer)

missmap(adult)


missmap(adult,y.at=c(1),y.labels = c(''),col=c('yellow','black'))

# Dropping the NA Values/Missing Data

adult <- na.omit(adult)
#str(adult)

# Missmap Afterwards
missmap(adult,y.at=c(1),y.labels = c(''),col=c('yellow','black'))

str(adult)

# Exploratory Data Analysis
library(ggplot2)
library(dplyr)

# Histograms on EDA

# Age Based on Income
ggplot(adult,aes(age)) + geom_histogram(aes(fill=income),
    color='black',binwidth=1) + theme_bw()


# Hours Per Week
ggplot(adult,aes(hr_per_week)) + geom_histogram() + theme_bw()


## Rename the Country Region

head(adult)

#Lots of ways to do this, could use dplyr as well
names(adult)[names(adult)=="country"] <- "region"

str(adult)

# Region Based on Income
ggplot(adult,aes(region)) + geom_bar(aes(fill=income),color='black')+theme_bw()+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


#### Part 3 Logistic Regression Model
head(adult)



## Train Test Data Set


# Import Library
library(caTools)

# Set a random see so your "random" results are the same as this notebook
set.seed(101) 

# Split up the sample, basically randomly assigns a booleans to a new column "sample"
sample <- sample.split(adult$income, SplitRatio = 0.70) # SplitRatio = percent of sample==TRUE

# Training Data
train = subset(adult, sample == TRUE)

# Testing Data
test = subset(adult, sample == FALSE)

help("glm")


# Creating a GLM Function
model = glm(income ~ ., family = binomial(logit), data = train)

summary(model)


help("step")

## Creating the Step Models

# New Step Model
new.step.model <- step(model)

summary(new.step.model)


# Confusion Matrix
test$predicted.income = predict(model, newdata=test, type="response")

table(test$income, test$predicted.income > 0.5)


# Accuracy
(6372+1423)/(6372+1423+548+872)

# Calculate other measures of performance like, recall or precision.

#recall
6732/(6372+548)


#precision
6732/(6372+872)


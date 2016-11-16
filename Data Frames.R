days <- c('Mon', 'Tues', 'Weds', 'Thurs', 'Fri')
temp <- c(22.2,21,23,24.3,25)
rain <- c(T,T,F,F,T)
data.frame(days,temp,rain)
df <- data.frame(days,temp,rain)
df
str(df)
summary(df)

df[1,]
df[,1]
df[,'rain']
df[1:5,c('days','temp')]

df$days
df$temp
df['days']
subset(df, subset = rain == TRUE)
subset(df, subset = temp > 23)
sorted.temp <- order(df['temp'])
sorted.temp

df[sorted.temp,]
desc.temp <- order(-df['temp'])
desc.temp <- order(-df$temp)
desc.temp

empty <- data.frame()
c1 <- 1:10
c1

# Overview of Data Frame
letters
c2 <- letters[1:10]
c2

df <- data.frame(col.name.1 = c1, col.name.2 = c2)
df

write.csv(df,file ='saved_df.csv')
df2 <- read.csv('saved_df.csv')
df2


df
nrow(df)
ncol(df)
colnames(df)
rownames(df)

str(df)
summary(df)

df[[5,2]]
df[[5,'col.name.2']]

df[[2,'col.name.1']] <- 9999
df

df[1,]
mtcars
head(mtcars)

mtcars$mpg
mtcars[,'mpg']
mtcars[,1]
mtcars[['mpg']]
mtcars['mpg']

head(mtcars[c('mpg','cyl')])

# Part 2
df2 <- data.frame(col.name.1 = 2000, col.name.2 = 'new')
df2

dfnew <- rbind(df,df2)
dfnew


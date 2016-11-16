# R Dataframes Exercise

# Ex. 1
Name <- c('Sam', 'Frank', 'Amy')
Age <- c(22,25,26)
Weight <-c(150,165,120)
Sex <- c("M","M","F")


df <- data.frame(row.names = Name, Age, Weight, Sex)
print(df)


# Ex. 2
head(mtcars)
data() # Data built in

is.data.frame(mtcars)

# Ex. 3

mat <- matrix(1:25, nrow=5)
mat


# Ex. 4
df <- mtcars
df

# Ex. 5
head(df)
head(df,2)

# Ex. 6

df$mpg
mean(df$mpg)

# Ex. 7

df[df$cyl == 6,]
subset(df,cyl==6)

# Ex. 8

df[,'am']
df[,c('am','gear','carb')]

# Ex. 9

df$performance <- df$hp/df$wt
head(df)
round(x, digits = 0)
df$performance <- round(df$performance, digits = 2)
head(df)

# Ex. 10
subset(df,hp>100 & wt > 2.5)$mpg
mean(subset(df,hp>100 & wt>2.5)$mpg)
df[df$hp > 100 & df$wt > 2.5 ,]$mpg
mean(df[df$hp > 100 & df$wt > 2.5,]$mpg)

# Ex. 11

df['Hornet Sportabout',]$mpg

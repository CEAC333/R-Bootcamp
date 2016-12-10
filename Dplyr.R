# Guide to Using Dplyr

library(dplyr)
library(nycflights13)

head(flights)
summary(flights)

head(filter(flights, month==11,day==3,carrier=='AA'))
head(flights[flights$month == 11 & flights$day ==3 & flights$carrier=='AA',])

slice(flights,1:10)

head(arrange(flights,year,month,day,air_time))
head(arrange(flights,year,month,day,desc(air_time)))

# Part 2

head(select(flights,carrier))
head(select(flights,carrier,arr_time))

head(rename(flights,airline_carrier = carrier))

distinct(select(flights,carrier))

head(mutate(flights, newcol = arr_delay-dep_delay))

head(transmute(flights, newcol = arr_delay*dep_delay))

summarize(flights,avg_air_time=mean(air_time,na.rm=TRUE))
summarize(flights,total_time=sum(air_time,na.rm=TRUE))

sample_n(flights,10)
sample_frac(flights,0.1)

# Pipe Operator Lecture
df <- mtcars

# Nesting
result <- arrange(sample_n(filter(df,mpg>20),size=5),desc(mpg))

print(result)


# Multiple Assignments
a <- filter(df,mpg>20)
b <- sample_n(a,size=5)
result <- arrange(b,desc(mpg))
print(result)


#Pipe Operator Data %>% op1 %>% op2 %>% op3
result <- df %>% filter(mpg>20) %>% sample_n(size=5) %>% arrange(desc(mpg))

print(result)

## Guide to Using tidyr
library(tidyr)
library(data.table)


comp <- c(1,1,1,2,2,2,3,3,3)
yr <- c(1998,1999,2000,1998,1999,2000,1998,1999,2000)
q1 <- runif(9, min=0, max=100)
q2 <- runif(9, min=0, max=100)
q3 <- runif(9, min=0, max=100)
q4 <- runif(9, min=0, max=100)

df <- data.frame(comp=comp,year=yr,Qtr1 = q1,Qtr2 = q2,Qtr3 = q3,Qtr4 = q4)
df

# Using Pipe Operator
head(df %>% gather(Quarter,Revenue,Qtr1:Qtr4))

# With just the function
head(gather(df,Quarter,Revenue,Qtr1:Qtr4))

# spread()
stocks <- data.frame(
  time = as.Date('2009-01-01') + 0:9,
  X = rnorm(10, 0, 1),
  Y = rnorm(10, 0, 2),
  Z = rnorm(10, 0, 4)
)


stocksm <- stocks %>% gather(stock, price, -time)

stocksm %>% spread(stock, price)

stocksm %>% spread(time, price)

# Seperate
df <- data.frame(x = c(NA, "a.x", "b.y", "c.z"))
df

df %>% separate(x, c("ABC", "XYZ"))

# unite

head(mtcars)
unite_(mtcars, "vs.am", c("vs","am"),sep = '.')

# Separate is the complement of unite
mtcars %>%
  unite(vs_am, vs, am) %>%
  separate(vs_am, c("vs", "am"))



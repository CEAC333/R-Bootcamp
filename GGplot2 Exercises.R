# GGplot2 Exercises

library(ggplot2)
library(ggthemes)
head(mpg)

# Exercise 1

plot <- ggplot(mpg,aes(x=hwy)) + geom_histogram(bins=20,fill='red',alpha=0.5)
print(plot)

# Exercise 2

plot <- ggplot(mpg,aes(x=manufacturer))
plot2 <- plot + geom_bar(aes(fill=factor(cyl)))
print(plot2)

# Exercise 3

library(ggplot2)
head(txhousing)

plot <- ggplot(txhousing,aes(x=sales,y=volume))
plot2 <- plot + geom_point(color='blue',alpha=0.1)
print(plot2)

# Exercise 4

plot3 <- plot2 + geom_smooth(color='red')
print(plot3)


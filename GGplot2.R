# GGplot 2

library(ggplot2)
library(ggplot2movies)

# DATA  & AESTHETICS (Histograms)
colnames(movies)
head(movies)
pl <- ggplot(movies,aes(x=rating))

# Geometry

print(pl + geom_histogram(binwidth = 0.1,color = 'red', fill = 'pink',alpha = 0.4))

pl2 <- (pl + geom_histogram(binwidth = 0.1, aes(fill=..count..)))

pl3 <- pl2 + xlab('Movie Rating') + ylab('Count')

print(pl3 + ggtitle("MY TITLE"))


# Scatterplots
df <- mtcars

# Data & Aesthetics Layer
plot <- ggplot(df,aes(x=wt,y=mpg))

# Geometry

plot2 <- plot + geom_point(size=5,color='blue')
print(plot2)
plot2 <- plot + geom_point(aes(color=hp),size=5)
print(plot2)
plot3 <- plot2+scale_color_gradient(low='blue',high='red')
print(plot3)
print(plot + geom_point(alpha=0.5,size=5))
print(plot + geom_point(aes(size=hp)))
print(plot + geom_point(aes(size=cyl)))
print(plot + geom_point(aes(shape=factor(cyl)), size=5))
print(plot + geom_point(aes(shape=factor(cyl),color=factor(cyl)), size=5))

# Barplots
df <- mpg
head(mpg)

plot <- ggplot(df, aes(x=class))
print(plot + geom_bar(color='blue', fill='blue'))
print(plot + geom_bar(aes(fill=drv),position="dodge"))


# Boxplots

df <- mtcars

plot <- ggplot(df,aes(x=factor(cyl),y=mpg))
print(plot + geom_boxplot())
print(plot + geom_boxplot() + coord_flip())
print(plot + geom_boxplot(fill='blue') + coord_flip())
print(plot + geom_boxplot(aes(fill=factor(cyl))) + theme_bw())
print(plot + geom_boxplot(aes(fill=factor(cyl))) + theme_bw() + coord_flip()) 

# 2 variable Plotting with GGplot2

plot <- ggplot(movies,aes(x=year,y=rating))
print(plot + geom_bin2d())

plot2 <- plot + geom_bin2d() + scale_fill_gradient(high='red',low='green')
print(plot2 + geom_bin2d())

plot2 <- plot + geom_bin2d(binwidth=c(3,1))
print(plot2 + scale_fill_gradient(high='red',low='blue'))

plot2 <- plot + geom_hex()
print(plot2 + scale_fill_gradient(high='red',low='blue'))

plot2 <- plot + geom_density2d()
print(plot2 + scale_fill_gradient(high='red',low='blue'))


# Coordinates and Faceting

plot <- ggplot(mpg,aes(x=displ,y=hwy)) + geom_point()
print(plot)


plot2 <- plot + coord_cartesian(xlim = c(1,4), ylim = c(15,30))
print(plot2)

plot2 <- plot + coord_fixed(ratio = 1/3)
print(plot2)

help("facet_grid")
plot <- ggplot(mpg,aes(x=displ,y=hwy)) + geom_point()
print(plot + facet_grid(.~cyl))
print(plot + facet_grid(drv~.))
print(plot + facet_grid(drv~cyl))


# Themes
library(ggthemes)

theme_set(theme_minimal())

plot <- ggplot(mtcars,aes(x=wt,y=mpg)) + geom_point()
print(plot + theme_dark())
print(plot + theme_fivethirtyeight())
print(plot + theme_wsj())




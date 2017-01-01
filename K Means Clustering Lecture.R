# K Means Clustering Lecture

library(ISLR)
library(ggplot2)


head(iris)


plot <- ggplot(iris,aes(Petal.Length,Petal.Width,color=Species))
print(plot + geom_point(size=4))


set.seed(101)
irisCluster <- kmeans(iris[,1:4],3,nstart = 20)
print(irisCluster)

table(irisCluster$cluster,iris$Species)


library(cluster)

clusplot(iris,irisCluster$cluster,color = T, shade = T, labels = 0, lines = 0)


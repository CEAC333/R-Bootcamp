# Dplyr Training Exercise

library(dplyr)
head(mtcars)

# Exercise 1:
filter(mtcars,mpg>20,cyl==6)

# Exercise 2:
arrange(mtcars,cyl,desc(wt))

# Exercise 3:
select(mtcars,mpg,hp)

# Exercise 4:
distinct(select(mtcars,gear))
mtcars %>% select(gear) %>% distinct()

# Exercise 5:
mutate(mtcars,Performance = hp/wt)

# Exercise 6:
summarize(mtcars,avg_mpg = mean(mpg))

# Exercise 7:
mtcars %>% filter(cyl == 6) %>% summarize(avg_hp = mean(hp))
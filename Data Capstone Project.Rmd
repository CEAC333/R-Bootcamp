# Capstone Data Project (Moneyball Project)

# Loading the Data

```{r}
batting <- read.csv('Batting.csv')
head(batting)
```


# Gathering the Batting Averages

```{r}
str(batting)
head(batting$AB)
head(batting$X2B)

batting$BA <- batting$H / batting$AB
tail(batting$BA,5)
```


# On-Base Percentage

```{r}
batting$OBP <- (batting$H + batting$BB + batting$HBP)/(batting$AB + batting$BB + batting$HBP + batting$SF)

# Batting Singles
batting$X1B <- batting$H - batting$X2B - batting$X3B - batting$HR

# Slugging Averages
batting$SLG <- ((1 * batting$X1B) + (2 * batting$X2B) + (3 * batting$X3B) + (4 * batting$HR) ) / batting$AB

# Check the Data Frame 
str(batting)
```


## Merging Salary Data

# Gathering Data
```{r}
sal <- read.csv('Salaries.csv')
summary(batting)
```

# >1985 Data
```{r}
batting <- subset(batting,yearID >= 1985)
```

```{r}
summary(batting)
```

# Merging the Data Together with Salary and Batting
```{r}
combo <- merge(batting,sal,by=c('playerID','yearID'))
summary(combo)
```


# Getting the Lost Players Season

```{r}
lost_players <- subset(combo,playerID %in% c('giambija01','damonjo01','saenzol01'))
lost_players
```

# Grabbing the information for 2001

```{r}
lost_players <- subset(lost_players,yearID == 2001)
lost_players <- lost_players[,c('playerID','H','X2B','X3B','HR','OBP','SLG','BA','AB')]
head(lost_players)
```

# Replacement Players to Look For
#1469AB, AVG 0.364 OBP, $15 Million

```{r}
combo <- subset(combo,yearID == 2001)
str(combo)
```

# Plotting the Data

```{r}
library(ggplot2)
library(dplyr)
```


```{r}
ggplot(combo,aes(x=OBP,y=salary)) + geom_point(size=2,col='limegreen',alpha=1)
```



# Cutting Off the Salary Mark at $8M


```{r}
combo <- subset(combo,salary < 8000000, OBP > 0)
str(combo)
```

```{r}
1469/3
combo <- subset(combo,AB>=450)
str(combo)
```


# Sorting the OBP

```{r}
options <- head(arrange(combo,desc(OBP)),10)

options[,c('playerID', 'AB', 'salary', 'OBP')]

4950000+4833333+305000
```



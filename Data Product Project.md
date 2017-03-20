Data Product Project
========================================================
author: Aiganym Baizakova
date: 20 March 2017
autosize: true

Introduction
========================================================

Using a dataset esoph, data from a case-control study of (o)esophageal cancer in Ille-et-Vilaine, France, 
we can see the chances of getting (O)Esophageal Cancer, given your age, alcohol and tobacco consumption.



Cleaning the data
========================================================
First, it's better to clean the dataset so it is easier to work with.
And setting factors.

```r
esoph_proj <- esoph
## replacing in esoph_proj$alcpg "0-39g/day" --> "0-39"
esoph_proj$alcgp <- as.character(esoph_proj$alcgp)
esoph_proj$alcgp[esoph_proj$alcgp == "0-39g/day"] <- "0-39"
## as.factor(esoph_proj$alcgp)
esoph_proj$alcgp <- as.factor(esoph_proj$alcgp)
## replacing in esoph_proj$tobgp "0-9g/day" --> "0-9"
esoph_proj$tobgp <- as.character(esoph_proj$tobgp)
esoph_proj$tobgp[esoph_proj$tobgp == "0-9g/day"] <- "0-9"
## as.factor(esoph_proj$alcgp)
esoph_proj$tobgp <- as.factor(esoph_proj$tobgp)
```

Calculation
========================================================
There are three type-bars where you select your group of age, tobacco and alcohol consumption.
Using the 'filter' function, we can calculate the percentage of getting the (o)esophagea cancer.


```r
library(dplyr)
percentageOutput1 <- esoph_proj %>% 
  filter(agegp == "45-54", alcgp == "80-119", tobgp == "10-19") %>%
  mutate(perc = ncases/ncontrols*100)
percentageOutput1$perc
```

```
[1] 42.85714
```

Conclusion
================================
Using the Shiny app it is more easy and interactive to work with a data and to have a visualization of your work.

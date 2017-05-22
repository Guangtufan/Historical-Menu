# Historical-Menu
---
title: '123'
output:
  github_document: default
  pdf_document: default
---
## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r cars}
library(dplyr)
library(nycflights13)
library(tidyverse)
flights
class(flights)
View(flights)
filter(flights, month == 1, day == 1)
filter(flights, between(month, 7,9))

arrange(flights, year, month, desc(day)) # sort/order

select(flights, year:day)
select(flights, -(year:day))
select(flights, starts_with('dep'))
select(flights, ends_with('time'))
select(flights, contains('arr_'))
select(flights, matches(''))
select(flights, num_range('x', 1:3))
select(flights, air_time, distance, everything()) # reorder col order

```

## Including Plots

You can also embed plots, for example:

```{r pressure, echo=FALSE}
plot(pressure)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.

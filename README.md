# Historical-Menu
R Markdown
----------

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

``` r
library(tidyr)
library(tidyverse)
```

    ## Loading tidyverse: ggplot2
    ## Loading tidyverse: tibble
    ## Loading tidyverse: readr
    ## Loading tidyverse: purrr
    ## Loading tidyverse: dplyr

    ## Conflicts with tidy packages ----------------------------------------------

    ## filter(): dplyr, stats
    ## lag():    dplyr, stats

``` r
table4a
```

    ## # A tibble: 3 × 3
    ##       country `1999` `2000`
    ## *       <chr>  <int>  <int>
    ## 1 Afghanistan    745   2666
    ## 2      Brazil  37737  80488
    ## 3       China 212258 213766

``` r
table4a %>% 
  gather( key = 'year', value = 'cases', `1999`, `2000`)
```

    ## # A tibble: 6 × 3
    ##       country  year  cases
    ##         <chr> <chr>  <int>
    ## 1 Afghanistan  1999    745
    ## 2      Brazil  1999  37737
    ## 3       China  1999 212258
    ## 4 Afghanistan  2000   2666
    ## 5      Brazil  2000  80488
    ## 6       China  2000 213766

``` r
table4b %>%
  gather(key = 'year', value = 'population', `1999`, `2000`)
```

    ## # A tibble: 6 × 3
    ##       country  year population
    ##         <chr> <chr>      <int>
    ## 1 Afghanistan  1999   19987071
    ## 2      Brazil  1999  172006362
    ## 3       China  1999 1272915272
    ## 4 Afghanistan  2000   20595360
    ## 5      Brazil  2000  174504898
    ## 6       China  2000 1280428583

``` r
table2 %>%
  spread(key=type, value=count)
```

    ## # A tibble: 6 × 4
    ##       country  year  cases population
    ## *       <chr> <int>  <int>      <int>
    ## 1 Afghanistan  1999    745   19987071
    ## 2 Afghanistan  2000   2666   20595360
    ## 3      Brazil  1999  37737  172006362
    ## 4      Brazil  2000  80488  174504898
    ## 5       China  1999 212258 1272915272
    ## 6       China  2000 213766 1280428583

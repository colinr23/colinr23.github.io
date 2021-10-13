library(stringr)
setwd("/Users/colinr23/colinr23gp/markdown_generator")
x <- read.csv('pubs-from-website.csv')
x <- x$WebTex
x <- str_sub(x, str_locate(x, '[a-z]')[,1]-1) #stip off numbers
url <- str_sub(x, str_locate(x, "http")[,1])
citation <- str_trim(str_sub(x, start=1, end=str_locate(x, "http")[,1]-1))
year <- str_sub(x, str_locate(x, '[1-9]')[,1], str_locate(x, '[1-9]')[,1]+3)
yearOn <- str_sub(x, str_locate(x, '[1-9]')[,1]+6)
title <- str_sub(yearOn, start=1, end=str_locate(yearOn, '\\.')[,1])
titleOn <- str_trim(str_sub(yearOn, start=str_locate(yearOn, '\\.')[,1]+1))
venue <- str_trim(str_sub(titleOn, start=1, end=str_locate(titleOn, '\\.')[,1]))
df <- data.frame(pub_date=year, title=title, venue=venue, excerpt="", citation=citation, url_slug="", paper_url=url, raw=x)
write.csv(df, 'cleaned-pubs.csv')

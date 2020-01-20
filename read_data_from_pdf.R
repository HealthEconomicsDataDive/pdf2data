#
# read data from pdf table
#
#

install.packages("pdftools")
library(pdftools)
library("glue")
library("tidyverse")
raw_text <- pdf_text("smoking cessation/tablep1.pdf")
table <- str_split(raw_text, "\r", simplify = TRUE) %>% str_split("\n", simplify = TRUE) %>% str_split("          ", simplify = TRUE)
View(table)
table <- table[table[ , 1] != "", ]
write.csv(table, "temp.csv")

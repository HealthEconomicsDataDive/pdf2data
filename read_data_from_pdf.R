#
# read data from pdf table
#
#

install.packages("pdftools")

library("pdftools")
library("glue")
library("tidyverse")

raw_text <- pdf_text("tablep1.pdf")
table <- str_split(raw_text, "\r", simplify = TRUE) %>% str_split("\n", simplify = TRUE) %>% str_split("          ", simplify = TRUE)
View(table)
table <- table[table[ , 1] != "", ]
head(table)
write.csv(table, "table1.csv")

raw_text <- pdf_text("tablep2.pdf")
table <- str_split(raw_text, "\r", simplify = TRUE) %>% str_split("\n", simplify = TRUE) %>% str_split("          ", simplify = TRUE)
View(table)
table <- table[table[ , 1] != "", ]
head(table)
write.csv(table, "table2.csv")

raw_text <- pdf_text("tablep3.pdf")
table <- str_split(raw_text, "\r", simplify = TRUE) %>% str_split("\n", simplify = TRUE) %>% str_split("          ", simplify = TRUE)
View(table)
write.csv(table, "table3.csv")

raw_text <- pdf_text("report.pdf")
cat(raw_text[c(49,50)])
raw_text[41]

table <- str_split(raw_text, "\r", simplify = TRUE) %>% str_split("\n", simplify = TRUE) %>% str_split("          ", simplify = TRUE)
View(table)
write.csv(table, "table3.csv")

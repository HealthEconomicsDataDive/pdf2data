#
# read data from pdf table
#
#

install.packages("pdftools")
install.packages("tabulizer")

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
cat(raw_text[c(70)])
table <- str_split(raw_text[70], "\r\n", simplify = TRUE)
view(table)

out <- list()
for (i in seq_along(table)){
  out[[i]] <- str_split(table[i], "\\s{2,}", simplify = TRUE)
}

grep(pattern = "TABLE(.*)", table1)
stringr::str_extract(pattern = "TABLE(.*)", raw_text[70])



table <- str_split(raw_text, "\r", simplify = TRUE) %>% str_split("\n", simplify = TRUE) %>% str_split("          ", simplify = TRUE)
view(table)


View(table)
View(table)\n
write.csv(table, "

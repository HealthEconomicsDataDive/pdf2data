#
# read data from pdf table
#
#

# install.packages("pdftools")
# install.packages("tabulizer")

library("pdftools")
library("glue")
library("tidyverse")
library(purrr)
library(reshape2)


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

page <- 70

raw_text <- pdf_text("report.pdf")
cat(raw_text[page])
table <- str_split(raw_text[page], "\r\n", simplify = TRUE)
view(table)

out <- list()
for (i in seq_along(table)){
  out[[i]] <- str_split(table[i], "\\s{2,}", simplify = TRUE)
}

#TODO:  do TABLE thing here
out <- out[5:26]


## headers ##

num_rows_of_headings <- 3
num_cols_ids <- 1

headers_orig <- out[1:num_rows_of_headings]
headers_orig <- map(headers_orig, function(x) x[x!=""])

headers_length <- map_dbl(headers_orig, length)

max_headers <- max(headers_length)
which_max <- which(headers_length == max_headers)

headers_orig[[which_max]] <- headers_orig[[which_max]][-num_cols_ids]
max_headers <- max_headers - num_cols_ids


headers <- list()

for (i in 1:num_rows_of_headings) {
  header <- headers_orig[[i]]
  headers[[i]] <- rep(header, each = max_headers/length(header)) 
}

do.call(cbind, headers)

## data ##

data_line <- map_lgl(out, function(x) length(x) == 12)
data_line[seq_len(num_rows_of_headings)] <- FALSE
data <- do.call(rbind, out[data_line])

data <- as.data.frame(data[, -1])
melt(data,  id.vars = "V1")


out

## which index has TABLE in and only keep everything afterwards
grep(pattern = "TABLE(.*)", table1)
stringr::str_extract(pattern = "TABLE(.*)", raw_text[page])



table <- str_split(raw_text, "\r", simplify = TRUE) %>% str_split("\n", simplify = TRUE) %>% str_split("          ", simplify = TRUE)
view(table)


View(table)
View(table)\n
write.csv(table, "

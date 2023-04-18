library(DBI)
library(tidyverse)

files <- list.files("data", 
                    pattern = "earthquakes*",
                    full.names = TRUE)

db <- dbConnect(duckdb::duckdb(), 
                dbdir = "earthquakes.duckdb",
                read_only = FALSE)
rs <- dbExecute(db, "DROP TABLE IF EXISTS earthquakes")
rs <- dbDisconnect(db, shutdown = TRUE)

import_file <- function(file) {
  df <- read_csv(file, locale = locale(tz = "UTC"),
                 col_types = "TnnnncnnnnccTccnnnccc")  
  db <- dbConnect(duckdb::duckdb(), dbdir = "data/earthquakes.duckdb",
                  read_only = FALSE)
  dbWriteTable(db, "earthquakes", df, append = TRUE)
  dbDisconnect(db, shutdown=TRUE)
}

res <- unlist(lapply(files, import_file)) 

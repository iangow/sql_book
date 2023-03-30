library(DBI)
library(tidyverse)

files <- list.files("Chapter 6: Anomaly Detection", 
                    pattern = "*.csv",
                    full.names = TRUE)

pg <- dbConnect(RPostgres::Postgres())
rs <- dbExecute(pg, "SET search_path TO sql_book")
rs <- dbExecute(pg, "DROP TABLE IF EXISTS earthquakes_new")
rs <- dbDisconnect(pg)

import_file <- function(file) {
  df <- read_csv(file, locale = locale(tz = "UTC"),
                 col_types = "TnnnncnnnnccTccnnnccc")  
  pg <- dbConnect(RPostgres::Postgres())
  rs <- dbExecute(pg, "SET search_path TO sql_book")
  dbWriteTable(pg, "earthquakes_new", df, append = TRUE)
  dbDisconnect(pg)
}

res <- unlist(lapply(files, import_file)) 

library(DBI)
library(tidyverse)

files <- list.files("Chapter 4: Cohorts", 
                    pattern = "*.csv",
                    full.names = TRUE)

csv_to_pq <- function(file) {
  db <- dbConnect(duckdb::duckdb())

  df <- tbl(db, paste0("read_csv('", file, "')")) |>
    compute(name = "df")

  pq_file <- file.path("data", gsub("csv$", "parquet", basename(file)))

  if (!dir.exists("data")) dir.create("data")
 
  rs <- dbExecute(db, paste0("COPY df TO '", pq_file, "'"))
  dbDisconnect(db)
  rs
}

lapply(files, csv_to_pq)

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

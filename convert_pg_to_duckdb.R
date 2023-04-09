library(DBI)
library(tidyverse)

pg_to_duckdb <- function(table) {
  
  pg <- dbConnect(RPostgres::Postgres(), 
                  bigint = "integer",
                  check_interrupts = TRUE)
  dbExecute(pg, "SET search_path TO sql_book")
  db <- dbConnect(duckdb::duckdb(), 
                 dbdir = "sql_book.duckdb", 
                 read_only = FALSE)
  pg_tbl <- tbl(pg, table)
  pg_tbl %>%
    copy_to(db, ., name = table,
            temporary = FALSE,
            overwrite = TRUE)
  duckdb::duckdb_shutdown(duckdb::duckdb())
  dbDisconnect(pg)
}

pg_to_duckdb("game_users")
pg_to_duckdb("game_actions")
pg_to_duckdb( "game_purchases")
pg_to_duckdb("exp_assignment")
pg_to_duckdb("earthquakes")
pg_to_duckdb("legislators")
pg_to_duckdb("legislators_terms")
pg_to_duckdb("retail_sales")
pg_to_duckdb("stop_words")
pg_to_duckdb("ufo")
pg_to_duckdb("date_dim")

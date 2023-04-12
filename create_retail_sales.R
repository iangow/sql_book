library(tidyverse)
library(readxl)

t <- tempfile(tmpdir = ".", fileext = ".xlsx")
url <- "https://www.census.gov/retail/mrts/www/mrtssales92-present.xlsx"
download.file(url, t)

read_tab <- function(year) {
  temp <- read_excel(t,
                     range = "A5:N71", 
                     sheet = as.character(year),
                     col_types = "text")
  names(temp)[1:2] <- c("naics_code", "kind_of_business")
  temp <- temp[-1, ]
  df <-
    temp %>%
    pivot_longer(names_to = "sales_month",
                 values_to = "sales",
                 cols = -1:-2) %>%
    mutate(sales_month = paste("01", str_remove(sales_month, "\\.")),
           sales_month = as.Date(sales_month, "%d %b %Y"))
}

retail_sales_new <-
  bind_rows(lapply(1992:2020, read_tab)) %>%
  mutate(reason_for_null = case_when(sales == "(NA)" ~ "Not Available",
                                     sales == "(S)" ~ "Supressed",
                                     TRUE ~ NA_character_),
         sales = case_when(sales == "(NA)" ~ NA_real_,
                           sales == "(S)" ~ NA_real_,
                           TRUE ~ as.double(sales))) %>%
  select(sales_month, naics_code, kind_of_business, reason_for_null, sales) 

retail_sales_new %>% summarise(sum(sales, na.rm = TRUE),
                               max_month = max(sales_month))
retail_sales %>% summarise(sum(sales, na.rm = TRUE),
                           max_month = max(sales_month))
  
retail_sales %>% 
  mutate(sales = coalesce(sales, 0)) %>%
  left_join(retail_sales_new %>% mutate(sales = coalesce(sales, 0)),
            join_by(sales_month, kind_of_business)) %>%
  filter(sales.x != sales.y) %>%
  select(sales_month, kind_of_business, sales.x, sales.y)

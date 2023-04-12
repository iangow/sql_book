library(tidyverse)
library(readxl)

# Use tmpdir = "." or known directory if you have trouble with this part.
mrtssales <- tempfile(fileext = ".xlsx")
url <- "https://www.census.gov/retail/mrts/www/mrtssales92-present.xlsx"
download.file(url, mrtssales)

read_tab <- function(year) {
  temp <- read_excel(mrtssales,
                     range = "A4:N71", 
                     sheet = as.character(year),
                     col_types = "text",
                     col_names = paste0("v", 1:14))
  
  # The third row has the dates for columns 3:14
  names(temp) <- c("naics_code", "kind_of_business",
                   as.character(temp[2, 3:14]))
  
  # The actual data are found after row 3
  temp <- temp[-1:-3, ]
  df <-
    temp %>%
    pivot_longer(names_to = "sales_month",
                 values_to = "sales",
                 cols = -1:-2) %>%
    mutate(sales_month = paste("01", str_remove(sales_month, "\\.")),
           sales_month = as.Date(sales_month, "%d %b %Y")) %>%
    mutate(reason_for_null = case_when(sales == "(NA)" ~ "Not Available",
                                       sales == "(S)" ~ "Supressed",
                                       TRUE ~ NA),
           sales = case_when(sales == "(NA)" ~ NA,
                             sales == "(S)" ~ NA,
                             TRUE ~ sales)) %>%
    mutate(sales = as.double(sales)) %>%
    select(sales_month, naics_code, kind_of_business, reason_for_null, sales)
  df
}

retail_sales_new <- bind_rows(lapply(1992:2020, read_tab)) 
   

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

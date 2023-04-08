-- create the table
DROP table if exists sql_book.retail_sales;
CREATE table sql_book.retail_sales
(
sales_month date
,naics_code varchar
,kind_of_business varchar
,reason_for_null varchar
,sales decimal
)
;

-- populate the table with data from the csv file. Download the file locally before completing this step
COPY sql_book.retail_sales 
FROM '/Users/igow/git/sql_book/Chapter 3: Time Series Analysis/us_retail_sales.csv' -- change to the location you saved the csv file
DELIMITER ','
CSV HEADER
;

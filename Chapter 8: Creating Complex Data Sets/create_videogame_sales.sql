DROP table if exists sql_book.videogame_sales;
CREATE table sql_book.videogame_sales
(
rank int
,name text
,platform text
,year int
,genre text
,publisher text
,na_sales decimal
,eu_sales decimal
,jp_sales decimal
,other_sales decimal
,global_sales decimal
)
;

-- change localpath to the location of the saved file
COPY sql_book.videogame_sales FROM '/Users/igow/git/sql_book/Chapter 8: Creating Complex Data Sets/videogame_sales.csv' DELIMITER ',' CSV HEADER;

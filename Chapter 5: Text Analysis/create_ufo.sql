SET search_path TO sql_book;

DROP TABLE IF exists ufo;
CREATE TABLE ufo
(
sighting_report text
,description text
)
;

-- change localpath to the directory where you saved the ufo .csv files

COPY ufo FROM '/Users/igow/git/sql_book/Chapter 5: Text Analysis/ufo1.csv' DELIMITER ',' CSV HEADER;

COPY ufo FROM '/Users/igow/git/sql_book/Chapter 5: Text Analysis/ufo2.csv' DELIMITER ',' CSV HEADER;

COPY ufo FROM '/Users/igow/git/sql_book/Chapter 5: Text Analysis/ufo3.csv' DELIMITER ',' CSV HEADER;

COPY ufo FROM '/Users/igow/git/sql_book/Chapter 5: Text Analysis/ufo4.csv' DELIMITER ',' CSV HEADER;

COPY ufo FROM '/Users/igow/git/sql_book/Chapter 5: Text Analysis/ufo5.csv' DELIMITER ',' CSV HEADER;



DROP table if exists public.earthquakes;
CREATE table public.earthquakes
(
time timestamp with time zone
,latitude decimal
,longitude decimal
,depth decimal
,mag decimal
,magType text
,nst decimal
,gap decimal
,dmin decimal
,rms decimal
,net text
,id text
,updated timestamp with time zone
,place text
,type text
,horizontalError decimal
,depthError decimal
,magError decimal
,magNst decimal
,status text
,locationSource text
,magSource text
)
;

SET timezone TO 'UTC';
-- replace localpath with the directory where you saved the csv files. The data set is large - the code will run if you load one or a few files, but the results will differ.

COPY public.earthquakes FROM '/Users/igow/git/sql_book/Chapter 6: Anomaly Detection/earthquakes1.csv' DELIMITER ',' CSV HEADER;

COPY public.earthquakes FROM '/Users/igow/git/sql_book/Chapter 6: Anomaly Detection/earthquakes2.csv' DELIMITER ',' CSV HEADER;

COPY public.earthquakes FROM '/Users/igow/git/sql_book/Chapter 6: Anomaly Detection/earthquakes3.csv' DELIMITER ',' CSV HEADER;

COPY public.earthquakes FROM '/Users/igow/git/sql_book/Chapter 6: Anomaly Detection/earthquakes4.csv' DELIMITER ',' CSV HEADER;

COPY public.earthquakes FROM '/Users/igow/git/sql_book/Chapter 6: Anomaly Detection/earthquakes5.csv' DELIMITER ',' CSV HEADER;

COPY public.earthquakes FROM '/Users/igow/git/sql_book/Chapter 6: Anomaly Detection/earthquakes6.csv' DELIMITER ',' CSV HEADER;

COPY public.earthquakes FROM '/Users/igow/git/sql_book/Chapter 6: Anomaly Detection/earthquakes7.csv' DELIMITER ',' CSV HEADER;

COPY public.earthquakes FROM '/Users/igow/git/sql_book/Chapter 6: Anomaly Detection/earthquakes8.csv' DELIMITER ',' CSV HEADER;

COPY public.earthquakes FROM '/Users/igow/git/sql_book/Chapter 6: Anomaly Detection/earthquakes9.csv' DELIMITER ',' CSV HEADER;

COPY public.earthquakes FROM '/Users/igow/git/sql_book/Chapter 6: Anomaly Detection/earthquakes10.csv' DELIMITER ',' CSV HEADER;

COPY public.earthquakes FROM '/Users/igow/git/sql_book/Chapter 6: Anomaly Detection/earthquakes11.csv' DELIMITER ',' CSV HEADER;

COPY public.earthquakes FROM '/Users/igow/git/sql_book/Chapter 6: Anomaly Detection/earthquakes12.csv' DELIMITER ',' CSV HEADER;

COPY public.earthquakes FROM '/Users/igow/git/sql_book/Chapter 6: Anomaly Detection/earthquakes13.csv' DELIMITER ',' CSV HEADER;

COPY public.earthquakes FROM '/Users/igow/git/sql_book/Chapter 6: Anomaly Detection/earthquakes14.csv' DELIMITER ',' CSV HEADER;

COPY public.earthquakes FROM '/Users/igow/git/sql_book/Chapter 6: Anomaly Detection/earthquakes15.csv' DELIMITER ',' CSV HEADER;

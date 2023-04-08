DROP table if exists sql_book.game_users;
CREATE table sql_book.game_users
(
user_id int
,created date
,country text
)
;

COPY sql_book.game_users FROM '/Users/igow/git/sql_book/Chapter 7: Experiment Analysis/game_users.csv' DELIMITER ',' CSV HEADER;

DROP table if exists sql_book.game_actions;
CREATE table sql_book.game_actions
(
user_id int
,action text
,action_date date
) 
;

COPY sql_book.game_actions FROM '/Users/igow/git/sql_book/Chapter 7: Experiment Analysis/game_actions.csv' DELIMITER ',' CSV HEADER;

DROP table if exists sql_book.game_purchases;
CREATE table sql_book.game_purchases
(
user_id int
,purch_date date
,amount decimal
)
;

COPY sql_book.game_purchases FROM '/Users/igow/git/sql_book/Chapter 7: Experiment Analysis/game_purchases.csv' DELIMITER ',' CSV HEADER;

DROP table if exists sql_book.exp_assignment;
CREATE table sql_book.exp_assignment
(
exp_name text
,user_id int
,exp_date date
,variant text
)
;

COPY sql_book.exp_assignment FROM '/Users/igow/git/sql_book/Chapter 7: Experiment Analysis/exp_assignment.csv' DELIMITER ',' CSV HEADER;

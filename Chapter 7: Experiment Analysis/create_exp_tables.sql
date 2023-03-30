DROP table if exists game_users;
CREATE table game_users
(
user_id int
,created date
,country text
)
;

COPY game_users FROM '/Users/igow/git/sql_book/Chapter 7: Experiment Analysis/game_users.csv' DELIMITER ',' CSV HEADER;

DROP table if exists game_actions;
CREATE table game_actions
(
user_id int
,action text
,action_date date
) 
;

COPY game_actions FROM '/Users/igow/git/sql_book/Chapter 7: Experiment Analysis/game_actions.csv' DELIMITER ',' CSV HEADER;

DROP table if exists game_purchases;
CREATE table game_purchases
(
user_id int
,purch_date date
,amount decimal
)
;

COPY game_purchases FROM '/Users/igow/git/sql_book/Chapter 7: Experiment Analysis/game_purchases.csv' DELIMITER ',' CSV HEADER;

DROP table if exists exp_assignment;
CREATE table exp_assignment
(
exp_name text
,user_id int
,exp_date date
,variant text
)
;

COPY exp_assignment FROM '/Users/igow/git/sql_book/Chapter 7: Experiment Analysis/exp_assignment.csv' DELIMITER ',' CSV HEADER;

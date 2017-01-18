drop table bidding ;
drop table owner ;
drop table team ;
drop table player ;

--Table PLAYER
create table PLAYER (
player_id number (20) NOT NULL,
name varchar(50),
nationality varchar(20),
matches_played number (10),
player_type varchar (20),
price number (15)
--PRIMARY KEY (player_id)
);

--Deleting,Adding & Renaming Of Columns
ALTER TABLE PLAYER RENAME COLUMN name TO player_name;
ALTER TABLE PLAYER DROP COLUMN price;
ALTER TABLE PLAYER ADD base_price number (10);

--Adding constaraints into TABLE PLAYER
ALTER TABLE PLAYER ADD CONSTRAINT p_id PRIMARY KEY(player_id);


--Table TEAM
create table TEAM (
team_name varchar (20) NOT NULL,
player_id number(20) NOT NULL,
player_name varchar(50),
owner_name varchar(50),
sold_price number(20)
--PRIMARY KEY (team_name),
--FOREIGN KEY (player_id) REFERENCES PLAYER (player_id)
);

--Adding constaraints into TABLE TEAM
ALTER TABLE TEAM ADD CONSTRAINT t_name PRIMARY KEY(team_name);

ALTER TABLE TEAM ADD CONSTRAINT p_id_2 
FOREIGN KEY (player_id) REFERENCES PLAYER (player_id) ON DELETE CASCADE;


--Table Owner
create table OWNER (
owner_id number (20) NOT NULL,
team_name varchar (20),
owner_name varchar (20),
account_ballance number (20),
profession varchar (20),
nationality varchar (20)
--PRIMARY KEY (owner_id),
--FOREIGN KEY (team_name) REFERENCES TEAM (team_name)
);

--Adding constaraints into TABLE OWNER
ALTER TABLE OWNER ADD CONSTRAINT o_id PRIMARY KEY(owner_id);

ALTER TABLE OWNER ADD CONSTRAINT t_name_2 
FOREIGN KEY (team_name) REFERENCES TEAM (team_name) ON DELETE CASCADE;

--Modifying Table to Check Fixed Account Ballance for Bidding Of Each Team
ALTER TABLE OWNER MODIFY account_ballance number(9) check(account_ballance<100000000);


--Table Bidding
create table BIDDING (
bidding_id number (10) NOT NULL,
owner_id number (10),
date_of_auction varchar (20),
time_of_auction varchar (20),
auction_room_number varchar (20),
CONSTRAINT b_id PRIMARY KEY(bidding_id)
--PRIMARY KEY (bidding_id),
--FOREIGN KEY (owner_id) REFERENCES OWNER (owner_id)
);

--Adding CONSTRAINT into TABLE BIDDING
--ALTER TABLE BIDDING ADD CONSTRAINT b_id PRIMARY KEY(bidding_id);

ALTER TABLE BIDDING ADD CONSTRAINT o_id_2 
FOREIGN KEY (owner_id) REFERENCES OWNER (owner_id) ON DELETE CASCADE;
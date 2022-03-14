-- NOTE: change this to your h0700xxx database
-- before you uncomment it and run this cod
use lindodb;

-- holdings Table
drop table if exists hol_table;
create table hol_table ( symbol varchar(7) not null,
holder varchar(255), 
shares bigint, 
datereported datetime, 
pctout float, 
val bigint
);

-- Recommendation Table
drop table if exists rec_table;
create table rec_table ( symbol varchar(7) not null,
recdate datetime,
firm varchar(255),
recto varchar(255),
recfrom varchar(255),
fromgrade varchar(255), 
recaction varchar(255)
);


-- Balance Sheet Table
drop table if exists bal_table;
create table bal_table ( symbol varchar(7) not null,
description varchar(255), 
quarter_0 float, 
quarter_1 float, 
quarter_2 float, 
quarter_3 float
);

-- Cash Flow Table
drop table if exists cfl_table;
create table cfl_table ( symbol varchar(7) not null,
description varchar(255), 
quarter_0 float, 
quarter_1 float, 
quarter_2 float, 
quarter_3 float
);

-- Financials Table
drop table if exists fin_table;
create table fin_table ( symbol varchar(7) not null,
description varchar(255), 
quarter_0 float, 
quarter_1 float, 
quarter_2 float, 
quarter_3 float
);

-- Calendar Table
drop table if exists cal_table;
create table cal_table ( symbol varchar(7) not null,
indexlabel varchar(255),
indexvalue varchar(255)
);


-- Earnings Table
drop table if exists ear_table;
create table ear_table ( symbol varchar(7) not null,
quarterlabel varchar(255),
revenue bigint,
earnings bigint
);

-- News Table
drop table if exists nws_table;
create table nws_table ( symbol varchar(7) not null,
uuid varchar(255), 
title varchar(255), 
publisher varchar(255), 
link varchar(255), 
publishtime bigint,
pubtype varchar(255) 
);

-- Price Table
drop table if exists price_table;
create table price_table ( symbol varchar(7) not null,
lastdate datetime, 
openprice float, 
highprice float, 
lowprice float, 
closeprice float,
volume bigint,
dividend int,
split int
);

show tables;

-- load local from csv files
-- LOAD DATA LOCAL INFILE '<replace with local file location>.csv' 
-- INTO TABLE bal_table FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' 
-- IGNORE 1 LINES;

select * from bal_table limit 50;
select * from cal_table limit 50;
select * from cfl_table limit 50;
select * from ear_table limit 50;
select * from fin_table limit 50;
select * from hol_table limit 50;
select * from rec_table limit 50;
select * from price_table limit 50;
select * from nws_table limit 50;

drop table if exists customer_table;
create table customer_table ( cust_id int auto_increment  primary key,
Pfolio_id int,
Sscript_id int,
cust_name varchar(255)
);
alter table customer_table auto_increment=100;

drop table if exists stock_table;
create table stock_table ( 
  stock_id varchar(7) primary key, folio_id int,
  constraint fk_folio
    foreign key (folio_id) 
      references portfolio_table(folio_id) 
	    on update cascade
        on delete cascade
);

drop table if exists portfolio_table;
create table portfolio_table ( folio_id int auto_increment  primary key,
cust_id int
);

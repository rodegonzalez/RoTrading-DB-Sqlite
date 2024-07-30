-- 
-- rotrading - sqlite
-- v2.2
-- 20240721
-- 

-- -------------------------
-- Ro-Trading
-- 20230309
-- 20240719 2.0
-- 20240721 2.1 - Use name-description, status='not-set', active1-deleted0  in all tables
-- 20240721 2.2 - Add tpp to positions. Add views
--				- isrealCheck, temporal
-- -------------------------

-- Date: 2024-07-21 12:00
-- -------------------------
-- use rotrading;

CREATE TABLE positions (
	id 	integer  primary key,
	block	text,
	creation TEXT DEFAULT CURRENT_TIMESTAMP,
	modification TEXT default '2000-01-01 00:00:00',
	guid			TEXT default '',
	datetimein		TEXT default '0',
	datetimeout		TEXT default '0',
	buysell			TEXT DEFAULT "buy",
	pricein			real default 0,
	priceout		real default 0,
	ticks			integer default 0,
	profit			real default 0,
	stoploss		real default 0,
	contracts		integer DEFAULT 0,
	commision		real default 0,
	euros			real default 0,	
	dollareuro		real default 0,
	imagepath		TEXT default '',

	status			TEXT default "not-set",
	tppcheck		integer default 0,
	isrealcheck		integer default 0,
	processed		integer default 0,
	active			integer default 1,
	deleted			integer default 0,
	temporal		text,
	note			TEXT,
	
	divisaid		integer default 0,
	accountid		integer default 0,
	brokerid		integer default 0,
	tickerid		integer default 0,
	marketid		integer default 0,
	patternid 		integer default 0,	
	setupid			integer default 0,
	tppid			integer default 0	
);

CREATE TABLE tpps (
	id		integer  primary key,
	creation		TEXT DEFAULT CURRENT_TIMESTAMP,
	modification	TEXT,
	name			TEXT  UNIQUE,
	description	TEXT,
	status		TEXT default "not-set",
	active		integer default 1,
	deleted		integer default 0,
	note			TEXT default null
);

CREATE TABLE brokers (
	id		integer  primary key,
	creation		TEXT DEFAULT CURRENT_TIMESTAMP,
	modification	TEXT,
	name			TEXT  UNIQUE,
	description	TEXT,
	status		TEXT  default "not-set",
	active		integer default 1,
	deleted		integer default 0,
	note			TEXT default null
);

CREATE TABLE accounts (
	id		integer  primary key,
	creation		TEXT DEFAULT CURRENT_TIMESTAMP,
	modification	TEXT,
	name			TEXT  UNIQUE,
	description	TEXT,
	amount_initial	REAL  default 0,
	amount_current	REAL  default 0,
	brokerid		integer  default 1,
	divisaid		integer  DEFAULT 1,
	status		TEXT default "not-set",
	acctype		TEXT  default "not-set",
	active		integer default 1,
	deleted		integer default 0,
	note			TEXT default null
);

CREATE TABLE divisas (	
	id		integer  primary key,
	creation		TEXT DEFAULT CURRENT_TIMESTAMP,
	modification	TEXT,
	name			TEXT  UNIQUE,
	description	TEXT,
	active		integer default 1,
	deleted		integer default 0,
	note			TEXT default null
);

CREATE TABLE diaries (	
	id		integer  primary key,			
	creation		TEXT DEFAULT CURRENT_TIMESTAMP,
	modification	TEXT,
	title		text,
	annotation	TEXT,
	short			TEXT,
	keywords		TEXT NULL,
	active		integer default 1,	
	deleted		integer default 0,
	note			TEXT default null	
);

CREATE TABLE position_patterns (	
	id		integer  primary key,		
	creation		TEXT DEFAULT CURRENT_TIMESTAMP,
	modification	TEXT,
	name			TEXT  unique,
	description	TEXT,
	status		TEXT  default "active",
	active		integer default 1,
	deleted		integer default 0,
	note			TEXT default null
);

CREATE TABLE position_setups (	
	id		integer  primary key,			
	creation		TEXT DEFAULT CURRENT_TIMESTAMP,
	modification	TEXT,
	name			TEXT  unique,
	description	TEXT,
	status		TEXT  default "not-set",
	active		integer default 1,
	deleted		integer default 0,
	note			TEXT  null
);

CREATE TABLE tickers (	
	id		integer  primary key,			
	creation		TEXT DEFAULT CURRENT_TIMESTAMP,
	modification	TEXT,
	name			text unique,
	description	TEXT,
	marketid	integer default 1,
	tictype		TEXT null default "not-set", 
	status		TEXT  default "active",
	active		integer default 1,
	deleted		integer default 0,
	note			TEXT default null
);

CREATE TABLE markets (	
	id		integer  primary key,			
	creation		TEXT DEFAULT CURRENT_TIMESTAMP,
	modification	TEXT,
	name			text unique,
	description	TEXT,
	status		TEXT  default "not-set",
	active		integer default 1,
	deleted		integer default 0,
	note			TEXT default null
);

-- test
create table items (
guid text null,
id integer primary key,
itemname text null,
itemvalue integer null
);


-- -------------------------------- 
-- Views

create view view_positions as
select 
	p.*, 
	d.name as divisa, 
	a.name as account,
	a.acctype as acctype,	
	m.name as market, 
	pa.name as pattern, 
	s.name as setup, 
	t.name as ticker,	
	tpps.name as tpp,
	b.name as broker
from positions p
join tickers t on t.id = p.tickerid
join accounts a on a.id = p.accountid
join markets m on m.id = p.marketid 
join divisas d on d.id = p.divisaid
join position_patterns pa on pa.id = p.patternid
join position_setups s on s.id = p.setupid
join tpps on tpps.id = p.tppid 
join brokers as b
where p.deleted = 0;

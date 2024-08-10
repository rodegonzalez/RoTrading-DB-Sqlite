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
-- 20240731 2.3 - Add pattaerns and setup to positions
-- 20240731 2.4 - Add highpatterns
-- 20240809 2.5 - Change positions, add sessions
-- -------------------------

-- Date: 2024-08-09
-- -------------------------
-- use rotrading;

CREATE TABLE sessions (
	id 				text primary key, 		/* use yyyyMMdd format */
	usdeur			real default 0, 		/* day value usd to eur */
	haspositions	integer default 0,
	note		text	
);

CREATE TABLE positions (
	id 				integer primary key AUTOINCREMENT,
	sessionid		text not null, 					/* use yyyyMMdd format */
	guid			text,
	tppid			integer default 0,
	tppcheck		integer default 1, 		/* 1-true 0-false */
	block			text default 'Not-set',
	blocksecuence	integer default 0,
	creation 		text DEFAULT CURRENT_TIMESTAMP,
	modification 	text,	
	timein			text,
	timeout			text,
	pricein			real default 0,
	priceout		real default 0,
	buysell			text DEFAULT "buy",
	contracts		integer DEFAULT 0,
	opresultticks		integer default 0,
	opresult		real default 0, 		/* in divisaid */
	commission		real default 0, 		/* in divisaid, round turn commission */
	opresulteur		real default 0,
	divisaid		integer default 0,
	accountid		integer default 0,	
	tickerid		integer default 0,
	pattern1id 		integer default 0, 		/* high pattern */	
	pattern2id 		text default 'Not-set', /* G-giro C-continuacion F-facilidad */	
	setup1id		integer default 0,
	setup2id		text default 'Not-set', /* setup temporality m1,m3,m5 */
	processed		integer default 0,
	deleted			integer default 0,
	deletednote		text,					/* why deleted */
	imagepath		text,
	note			text,
	status			text				/* opened, closed */
);

CREATE TABLE tpps (
	id		integer  primary key AUTOINCREMENT,
	creation		TEXT DEFAULT CURRENT_TIMESTAMP,
	modification	TEXT,
	name			TEXT  UNIQUE,
	description	TEXT,
	status		TEXT default "not-set",
	active		integer default 1,
	deleted		integer default 0,
	note			TEXT default null
);

CREATE TABLE accounts (
	id		integer  primary key AUTOINCREMENT,
	creation		TEXT DEFAULT CURRENT_TIMESTAMP,
	modification	TEXT,
	name			TEXT  UNIQUE, /* include account name and broker */ 
	description	TEXT,
	amount_initial	REAL  default 0,
	amount_current	REAL  default 0,
	divisaid		integer  DEFAULT 1,
	status		TEXT default "not-set",
	acctype		TEXT  default "not-set",
	active		integer default 1,
	deleted		integer default 0,
	note			TEXT default null
);

CREATE TABLE divisas (	
	id		integer  primary key AUTOINCREMENT,
	creation		TEXT DEFAULT CURRENT_TIMESTAMP,
	modification	TEXT,
	name			TEXT  UNIQUE,
	description	TEXT,
	active		integer default 1,
	deleted		integer default 0,
	note			TEXT default null
);

CREATE TABLE diaries (	
	id		integer  primary key AUTOINCREMENT,			
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

CREATE TABLE position_highpatterns (	
	id		integer  primary key AUTOINCREMENT,		
	creation		TEXT DEFAULT CURRENT_TIMESTAMP,
	modification	TEXT,
	name			TEXT  unique,
	description	TEXT,
	status		TEXT  default "active",
	active		integer default 1,
	deleted		integer default 0,
	note			TEXT default null
);

CREATE TABLE position_patterns (	
	id		integer primary key AUTOINCREMENT,		
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
	id		integer  primary key AUTOINCREMENT,			
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
	id		integer  primary key AUTOINCREMENT,			
	creation		TEXT DEFAULT CURRENT_TIMESTAMP,
	modification	TEXT,
	name			text unique, /* include ticker and market */
	description	TEXT,
	tictype		TEXT null default "not-set", 
	tickmin real default 0.0,
	tickminvalue real default 0.0,
	divisaid integer default 1,
	status		TEXT  default "active",
	active		integer default 1,
	deleted		integer default 0,
	note			TEXT default null
);

-- test
create table items (
guid text null,
id integer primary key AUTOINCREMENT,
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
	pa.name as pattern, 
	s.name as setup, 
	t.name as ticker,	
	tpps.name as tpp
from positions p
join tickers t on t.id = p.tickerid
join accounts a on a.id = p.accountid
join divisas d on d.id = p.divisaid
join position_highpatterns pa on pa.id = p.pattern1id
join position_setups s on s.id = p.setup1id
join tpps on tpps.id = p.tppid 
where p.deleted = 0;

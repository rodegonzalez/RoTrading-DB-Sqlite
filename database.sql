-- -------------------------
-- Ro-Trading DB - sqlite
-- -------------------------
-- 20230309 0.0.0,0
-- 20240719 
-- 20240721 0.1.0.1 - Use name-description, status='not-set', active1-deleted0  in all tables
-- 20240721 0.1.0.2 - Add tpp to positions. Add views
--				- isrealCheck, temporal
-- 20240731 0.1.0.3 - Add pattaerns and setup to positions
-- 20240731 0.1.0.4 - Add highpatterns
-- 20240809 0.1.0.5 - Change positions, add sessions
-- 20240811 0.1.0.6 - Tickeraccounts where to extract commissions. Change sessions.commisSion
-- 20240914 0.1.0.7 - Blocks and secuences of positions
-- 20240916 0.1.0.8 - Sessions
-- 20240817 0.1.0.9 - Rewrite version for publish - TAG 0.1.0
-- -------------------------
-- -------------------------
-- use rotrading;

CREATE TABLE sessions (
	id 				integer PRIMARY KEY, 		/* use yyyyMMdd format */
	creation 		text DEFAULT CURRENT_TIMESTAMP,
	modification 	text,	
	usdeur			real DEFAULT 0, 		/* day value usd to eur */
	haspositions	integer DEFAULT 0,
	consolidated	integer default 0,		/* consolidated values */
	active			integer DEFAULT 1,
	deleted			integer DEFAULT 0,
	sessionnote		text	
);

CREATE TABLE positions (
	id 				integer PRIMARY KEY AUTOINCREMENT,
	sessionid		integer DEFAULT 0, 		/* integer using yyyyMMdd format */
	guid			text,
	tppid			integer DEFAULT 0,	
	tppblocksec		integer DEFAULT 0,
	sec				integer DEFAULT 0,
	tppcheck		integer DEFAULT 1, 		/* 1-true 0-false */
	creation 		text DEFAULT CURRENT_TIMESTAMP,
	modification 	text,	
	timein			text,
	timeout			text,
	pricein			real DEFAULT 0,
	priceout		real DEFAULT 0,
	buysell			text DEFAULT "buy",
	contracts		integer DEFAULT 0,
	commission		real DEFAULT 0, 		/* in divisaid, round turn commission */
	opresultticks	integer DEFAULT 0,
	opresult		real DEFAULT 0, 		/* in divisaid */
	usdeur			real DEFAULT 0, 		/* day value usd to eur */	
	opresulteur		real DEFAULT 0,
	divisaid		integer DEFAULT 0,
	accountid		integer DEFAULT 0,	
	tickerid		integer DEFAULT 0,
	pattern1id 		integer DEFAULT 0, 		/* high pattern */	
	pattern2id 		text DEFAULT 'not-set', /* G-giro C-continuacion F-facilidad */	
	setup1id		text DEFAULT 0,
	setup2id		integer DEFAULT 'not-set', /* setup temporality m1,m3,m5 */
	processed		integer DEFAULT 0,
	deleted			integer DEFAULT 0,
	deletednote		text,					/* why deleted */
	imagepath		text,
	note			text,
	status			text				/* opened, closed */
);

CREATE TABLE tpps (
	id				integer  PRIMARY KEY AUTOINCREMENT,
	creation		text DEFAULT CURRENT_TIMESTAMP,
	modification	text,
	name			text UNIQUE,
	description		text,
	blockprefix		text DEFAULT 'B',
	maxblocksecuence	integer DEFAULT 10, /* max secuence items in block of each tpp*/
	status			text DEFAULT "not-set",
	active			integer DEFAULT 1,
	deleted			integer DEFAULT 0,
	note			text DEFAULT NULL
);

CREATE TABLE tppblocks (
	id				integer  PRIMARY KEY AUTOINCREMENT,
	creation		text DEFAULT CURRENT_TIMESTAMP,
	modification	text,
	tppid			integer DEFAULT 0,
	tppblocksec		integer DEFAULT 0	/* secuential block number of tpp */
);

CREATE TABLE tppblocksecuences (
	id				integer  PRIMARY KEY AUTOINCREMENT,
	creation		text DEFAULT CURRENT_TIMESTAMP,
	modification	text,
	positionid		integer DEFAULT 0,	/* this secuence number belogs to a position */
	sessionid		integer DEFAULT 0,	/* this secuence number belogs to a session */	
	tppid			integer DEFAULT 0,
	tppblocksec			integer DEFAULT 0,
	sec	integer DEFAULT 0	/* secuential number in block of tpp */
);

CREATE TABLE accounts (
	id				integer  PRIMARY KEY AUTOINCREMENT,
	creation		text DEFAULT CURRENT_TIMESTAMP,
	modification	text,
	name			text UNIQUE, /* include account name and broker */ 
	description		text,
	amount_initial	REAL  DEFAULT 0,
	amount_current	REAL  DEFAULT 0,
	divisaid		integer DEFAULT 1,
	status			text DEFAULT "not-set",
	acctype			text  DEFAULT "not-set",
	active			integer DEFAULT 1,
	deleted			integer DEFAULT 0,
	note			text
);

CREATE TABLE divisas (	
	id				integer  PRIMARY KEY AUTOINCREMENT,
	creation		text DEFAULT CURRENT_TIMESTAMP,
	modification	text,
	name			text UNIQUE,
	description		text,
	active			integer DEFAULT 1,
	deleted			integer DEFAULT 0,
	note			text
);

CREATE TABLE diaries (	
	id				integer PRIMARY KEY AUTOINCREMENT,			
	creation		text DEFAULT CURRENT_TIMESTAMP,
	modification	text,
	title			text,
	anNOTation		text,
	short			text,
	keywords		text,
	active			integer DEFAULT 1,	
	deleted			integer DEFAULT 0,
	note			text	
);

CREATE TABLE position_highpatterns (	
	id				integer PRIMARY KEY AUTOINCREMENT,		
	creation		text DEFAULT CURRENT_TIMESTAMP,
	modification	text,
	name			text UNIQUE,
	description		text,
	status			text  DEFAULT "active",
	active			integer DEFAULT 1,
	deleted			integer DEFAULT 0,
	note			text
);

CREATE TABLE position_patterns (	
	id				integer PRIMARY KEY AUTOINCREMENT,		
	creation		text DEFAULT CURRENT_TIMESTAMP,
	modification	text,
	name			text UNIQUE,
	description		text,
	status			text  DEFAULT "active",
	active			integer DEFAULT 1,
	deleted			integer DEFAULT 0,
	note			text
);

CREATE TABLE position_setups (	
	id				integer PRIMARY KEY AUTOINCREMENT,			
	creation		text DEFAULT CURRENT_TIMESTAMP,
	modification	text,
	name			text UNIQUE,
	description		text,
	status			text  DEFAULT "not-set",
	active			integer DEFAULT 1,
	deleted			integer DEFAULT 0,
	note			text
);

CREATE TABLE tickers (	
	id				integer PRIMARY KEY AUTOINCREMENT,			
	creation		text DEFAULT CURRENT_TIMESTAMP,
	modification	text,
	name			text UNIQUE, /* include ticker and market */
	description		text,
	tictype			text NULL DEFAULT "not-set", 
	tickmin 		real DEFAULT 0,
	tickminvalue 	real DEFAULT 0,
	divisaid 		integer DEFAULT 1,
	status			text,
	active			integer DEFAULT 1,
	deleted			integer DEFAULT 0,
	note			text
);

CREATE TABLE tickeraccounts (	
	tickerid		integer, 
	accountid		integer,
	creation		text DEFAULT CURRENT_TIMESTAMP,
	modification	text,
	commission		real default 0, /* commision by broker, round turn commission */
	PRIMARY KEY (tickerid, accountid)
);

-- test
create table items (
guid text NULL,
id integer PRIMARY KEY AUTOINCREMENT,
itemname text NULL,
itemvalue integer NULL
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
	tpp.name as tpp
from positions p
join tickers t on t.id = p.tickerid
join accounts a on a.id = p.accountid
join divisas d on d.id = p.divisaid
join position_highpatterns pa on pa.id = p.pattern1id
join position_setups s on s.id = p.setup2id
join tpps as tpp on tpp.id = p.tppid 
where p.deleted = 0;

-- 
-- rotrading
-- v1.0.0
-- 20230404
-- 

-- -------------------------
-- Ro-Trading
-- 20230309
-- -------------------------

-- use rotrading;

DROP TABLE IF EXISTS `positions`;
CREATE TABLE `positions` (
	`idoperation`			integer NOT NULL auto_increment primary key,
	`creation`		timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`datetimein`	timestamp NULL,
	`datetimeout`	timestamp NULL,
	`buysell`		enum('buy','sell') NOT NULL DEFAULT 'buy',
	`pricein`		decimal(10,6) NOT NULL default 0.0,
	`priceout`		decimal(10,6) NOT NULL default 0.0,
	`ticks`			integer NOT NULL default 0,
	`contracts`		integer NOT NULL DEFAULT 1,
	`commision`		decimal(10,6) NOT NULL default 0.0,
	`euros`			decimal(10,6) NOT NULL default 0.0,	
	`dollareuro`	decimal(10,6) NOT NULL default 0.0,
	`imagepath`			text NULL,
	`iddivisa`		integer NOT NULL DEFAULT 1,
	`idaccount`		integer NOT NULL default 1,
	`status`		enum('opened','closed','cancelled','not-set') default 'not-set'
);

DROP TABLE IF EXISTS `brokers`;
CREATE TABLE `brokers` (
	`idbroker`			integer NOT NULL auto_increment primary key,
	`creation`		timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`name`			varchar(45) NOT NULL UNIQUE,
	`description`	text NULL,
	`status`		enum('active','not-active','cancelled','not-set') default 'not-set'
);

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
	`idaccount`			integer NOT NULL auto_increment primary key,
	`creation`		timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`name`			varchar(45) NOT NULL UNIQUE,
	`description`	text NULL,	
	`amount_initial`	decimal(10,6) NOT NULL default 0.0,
	`amount_current`	decimal(10,6) NOT NULL default 0.0,
	`idbroker`		integer NOT NULL default 1,
	`iddivisa`		integer NOT NULL DEFAULT 1,
	`status`		enum('active','not-active','cancelled','not-set') default 'not-set',
	`type`		enum('personal','funded','other','not-set') not null default "not-set"
);

DROP TABLE IF EXISTS `divisas`;
CREATE TABLE `divisas` (	
	`iddivisa`			integer NOT NULL auto_increment primary key,
	`creation`		timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`name`			varchar(45) NOT NULL UNIQUE,
	`description`	TEXT NULL
);

DROP TABLE IF EXISTS `diaries`;
CREATE TABLE `diaries` (	
	`iddiary`			integer NOT NULL auto_increment primary key,			
	`creation`		timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`annotation`	text NOT NULL,
	`short`			text NULL,
	`keywords`		text NULL
);

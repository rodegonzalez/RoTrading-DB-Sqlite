-- 
-- rotrading - sqlite
-- v2.1
-- 20240721
-- 

-- -------------------------
-- Ro-Trading - Views
-- 20240721 2.1 - Use name-description, status='not-set', active1-deleted0  in all tables
-- -------------------------

-- Date: 2024-07-21 12:00
-- -------------------------
-- use rotrading;
drop view view_positions;
create view view_positions as
select 
	p.id as id,
	p.block as block, 
	p.datetimein as datetimein, 
	p.datetimeout as datetimeout, 
	p.buysell as buysell, 
	p.pricein as pricein, 
	p.priceout as priceout, 
	p.ticks as ticks, 
	p.profit as profit, 
	p.stoploss as stoploss, 
	p.contracts as contracts, 
	p.commision as commision, 
	p.euros as euros, 
	p.dollareuro as dollareuro, 
	d.name as divisa, 
	a.name as account, 
	m.name as market, 
	pa.name as pattern, 
	p.tppcheck as tppcheck, 
	s.name as setup, 
	t.name as ticker, 
	p.processed as processed, 
	p.note as note
		
from positions p
join tickers t on t.id = p.tickerid
join accounts a on a.id = p.accountid
join markets m on m.id = p.marketid 
join divisas d on d.id = p.divisaid
join positions_pattern pa on pa.id = p.patternid
join positions_setup s on s.id = p.setupid
where p.deleted = 0;

-- ---------------------------- 
create view view_positions as
select 
	p.*, 
	d.name as divisa, 
	a.name as account, 
	m.name as market, 
	pa.name as pattern, 
	p.tppcheck as tppcheck, 
	s.name as setup, 
	t.name as ticker,	
	tpp.name as tpp
from positions p
join tickers t on t.id = p.tickerid
join accounts a on a.id = p.accountid
join markets m on m.id = p.marketid 
join divisas d on d.id = p.divisaid
join positions_pattern pa on pa.id = p.patternid
join positions_setup s on s.id = p.setupid
join tpp on tpp.id = p.tppid 
where p.deleted = 0;

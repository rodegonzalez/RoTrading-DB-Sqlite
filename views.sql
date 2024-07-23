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
	tpp.name as tpp,
	b.name as broker
from positions p
join tickers t on t.id = p.tickerid
join accounts a on a.id = p.accountid
join markets m on m.id = p.marketid 
join divisas d on d.id = p.divisaid
join positions_pattern pa on pa.id = p.patternid
join positions_setup s on s.id = p.setupid
join tpp on tpp.id = p.tppid 
join brokers as b
where p.deleted = 0;

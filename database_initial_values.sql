-- -------------------------
-- INITIAL VALUES

-- 2024-08-09
-- 2024-08-11
-- 2024-08-14
-- -------------------------
INSERT INTO divisas (id, name, modification) VALUES (1,"dollar", datetime("now")),(2,"euro", datetime("now"));

INSERT INTO accounts (name,description, status, acctype, divisaid) VALUES 
("iBroker","111000-A", "active","REAL",1),
("PaperTrading","Simulated", "active","Simulated",1),
("AOP","AOP8000180", "active","Funded",1);

INSERT INTO position_patterns (id, name, description, modification) VALUES 
(1,"Giro","Giro", datetime("now")),
(2,"Continuación","Continuación", datetime("now")),
(3,"Facilidad","Facilidad",datetime("now"));

INSERT INTO position_highpatterns (id, name, description, modification) VALUES 
(1,"A Tipo1","A Tipo1", datetime("now")),
(2,"A Tipo2","A Tipo2", datetime("now")),
(3,"A Tipo3","A Tipo3", datetime("now")),
(4,"A Tipo4","A Tipo4", datetime("now")),
(5,"A Tipo5","A Tipo5", datetime("now")),
(6,"B Tipo1","B Tipo1", datetime("now")),
(7,"B Tipo2","B Tipo2", datetime("now")),
(8,"B Tipo3","B Tipo3", datetime("now")),
(9,"B Tipo4","B Tipo4", datetime("now")),
(10,"B Tipo5","B Tipo5", datetime("now"));

INSERT INTO position_setups (id, name, description, modification) VALUES 
(1,"FV","Falta de volumen", datetime("now")),
(2,"VD-i","Vela direccional - interior", datetime("now")),
(3,"VD-A1","Vela direccional - A1", datetime("now")),
(4,"VD-B3","Vela direccional - B3", datetime("now")),
(5,"VD-r","Vela direccional - rechazo", datetime("now"));

INSERT INTO tickers (id, name, description, tictype, modification,tickmin, tickminvalue,divisaid) VALUES 
(1,"MCL (NYMEX)", "Micro Crude Oil", "energies", datetime("now"),0.01,1,1),
(2,"CL (NYMEX)", "Crude Oil", "energies", datetime("now"),0.01,10,1),
(3,"QM (market)", "Mini Crude Oil", "energies", datetime("now"),0.01,5,1),
(4,"YM (market)", "YM", "indices", datetime("now"),0.0005,6.25,1),
(5,"6E (market)", "EURUSD", "forex", datetime("now"),0.01,5,1);

INSERT INTO tickeraccounts (`tickerid`,`accountid`, commission) VALUES (1,1,3.50),(2,1,5);
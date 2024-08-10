-- 
-- Indexes
--
-- Date: 2024-08-09
--

CREATE INDEX bysession_idx on positions(sessionid,deleted);
CREATE INDEX bytpp_idx on positions(tppid);
CREATE INDEX byaccticker_idx on positions(accountid,tickerid);
CREATE INDEX bypattern1_idx on positions(pattern1id);
CREATE INDEX bypattern2_idx on positions(pattern2id);
CREATE INDEX bysetup1_idx on positions(setup1id);

DROP INDEX deleted_idx;
DROP INDEX bysession_idx;
DROP INDEX bytpp_idx;
DROP INDEX byaccticker_idx;
DROP INDEX bypattern1_idx;
DROP INDEX bypattern2_idx;
DROP INDEX bysetup1_idx;



	
	
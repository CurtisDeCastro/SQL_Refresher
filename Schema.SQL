
-- Globals

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'world'
-- ---

DROP TABLE IF EXISTS world;

CREATE TABLE world (
  name TEXT,
  continent TEXT,
  area BIGINT,
  population BIGINT,
  gdp BIGINT,
  capital TEXT,
  tld TEXT,
  flag TEXT
);

COPY world FROM '/Users/curtiscastro/Projects/References/SQL_Refresher/TestData/world.csv' DELIMITER ',' CSV HEADER;

-- ---
-- Table 'nobel'
--
-- ---

DROP TABLE IF EXISTS nobel;

CREATE TABLE nobel (
  yr BIGINT,
  subject TEXT,
  winner TEXT
);

COPY nobel FROM '/Users/curtiscastro/Projects/References/SQL_Refresher/TestData/nobel.csv' DELIMITER ',' CSV HEADER;

-- ---
-- INITIALIZE SERIALIZATION
-- ---

-- SELECT setval(pg_get_serial_sequence('auth', 'id'), coalesce(max(id)+1, 1), false) FROM auth;
-- SELECT setval(pg_get_serial_sequence('session', 'id'), coalesce(max(id)+1, 1), false) FROM session;

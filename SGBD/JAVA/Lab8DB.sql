drop table continents;
drop table countries;
drop table cities;

CREATE TABLE cities (
    id INTEGER,
    country VARCHAR2(64),
    name VARCHAR2(64),
    capital NUMBER,
    longitude VARCHAR2(64),
    latitude VARCHAR2(64)
);

CREATE TABLE countries (
    id INTEGER,
    name VARCHAR2(64),
    capitalName VARCHAR2(64),
    capitalLongitude VARCHAR2(64),
    capitalLatitude VARCHAR2(64),
    code VARCHAR2(64),
    continent VARCHAR2(64)
);

CREATE TABLE continents (
    id INTEGER,
    name VARCHAR2(32)
);

SELECT distinct continent from countries;
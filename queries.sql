{\rtf1\ansi\ansicpg1251\cocoartf2867
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- 1. Well and production data integration\
SELECT w.well_name, p.date, p.production\
FROM wells w\
JOIN production p ON w.well_id = p.well_id;\
\
-- 2. Average production per well\
SELECT w.well_name, AVG(p.production) AS avg_production\
FROM wells w\
JOIN production p ON w.well_id = p.well_id\
GROUP BY w.well_name;\
\
-- 3. Extraction by location\
SELECT w.location, SUM(p.production) AS total_production\
FROM wells w\
JOIN production p ON w.well_id = p.well_id\
GROUP BY w.location;\
\
-- 4. Data with reservoir\
SELECT w.well_name, r.reservoir_name, p.production\
FROM wells w\
JOIN production p ON w.well_id = p.well_id\
JOIN reservoirs r ON w.well_id = r.well_id;\
\
-- 5. The deepest well\
SELECT w.well_name, r.depth\
FROM wells w\
JOIN reservoirs r ON w.well_id = r.well_id\
ORDER BY r.depth DESC\
LIMIT 1;}
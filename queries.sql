-- 1. Объединение данных скважин и добычи
SELECT w.well_name, p.date, p.production
FROM wells w
JOIN production p ON w.well_id = p.well_id;

-- 2. Средняя добыча по каждой скважине
SELECT w.well_name, AVG(p.production) AS avg_production
FROM wells w
JOIN production p ON w.well_id = p.well_id
GROUP BY w.well_name;

-- 3. Добыча по локациям
SELECT w.location, SUM(p.production) AS total_production
FROM wells w
JOIN production p ON w.well_id = p.well_id
GROUP BY w.location;

-- 4. Данные с резервуаром
SELECT w.well_name, r.reservoir_name, p.production
FROM wells w
JOIN production p ON w.well_id = p.well_id
JOIN reservoirs r ON w.well_id = r.well_id;

-- 5. Самая глубокая скважина
SELECT w.well_name, r.depth
FROM wells w
JOIN reservoirs r ON w.well_id = r.well_id
ORDER BY r.depth DESC
LIMIT 1;

SELECT * FROM joined_plant_1;
SELECT * FROM joined_plant_2;

-- average dc power and ac power in a day
SELECT
	date_time,
	AVG(dc_power) AS avg_dc_power,
	AVG(ac_power) AS avg_dc_power
FROM joined_plant_1
GROUP BY date_time
ORDER BY date_time;

-- Kapan waktu produksi daya tertinggi dan terendah dalam sehari?
SELECT 
	MIN(dc_power)
FROM joined_plant_1;

SELECT 
	MAX(dc_power)
FROM joined_plant_1;

SELECT 
	DISTINCT(date_time),
	dc_power,
	ac_power,
	irradiation
FROM joined_plant_1
WHERE dc_power = 0
ORDER BY date_time;

SELECT 
	DISTINCT(date_time),
	dc_power,
	ac_power,
	irradiation
FROM joined_plant_1
WHERE dc_power = 14471.125;

SELECT 
	MIN(dc_power)
FROM joined_plant_2;

SELECT 
	MAX(dc_power)
FROM joined_plant_2;

SELECT 
	DISTINCT(date_time),
	dc_power,
	ac_power,
	irradiation
FROM joined_plant_2
WHERE dc_power = 0
ORDER BY date_time;

SELECT 
	DISTINCT(date_time),
	dc_power,
	ac_power,
	irradiation
FROM joined_plant_2
WHERE dc_power > 1420;

-- Bagaimana perbandingan performa antar inverter?
SELECT 
	inverter_id,
	AVG(dc_power) AS avg_dc_power,
	AVG(ac_power) AS avg_ac_power,
	AVG(ac_power/dc_power)*100 AS efisiensi
FROM joined_plant_1
WHERE dc_power != 0
GROUP BY inverter_id;

SELECT 
	inverter_id,
	AVG(dc_power) AS avg_dc_power,
	AVG(ac_power) AS avg_ac_power,
	AVG(ac_power/dc_power)*100 AS efisiensi
FROM joined_plant_2
WHERE dc_power != 0
GROUP BY inverter_id;

-- Bagaimana tren total_yield dan daily_yield dari waktu ke waktu?
SELECT 
	date_time,
	AVG(daily_yield) AS avg_daily_yield,
	AVG(total_yield) AS avg_total_yield
FROM joined_plant_1
GROUP BY date_time
ORDER BY date_time;

SELECT 
	date_time,
	AVG(daily_yield) AS avg_daily_yield,
	AVG(total_yield) AS avg_total_yield
FROM joined_plant_2
GROUP BY date_time
ORDER BY date_time;

-- Inverter mana yang paling efisien dan mana yang paling tidak efisien?
SELECT
	date_time,
	AVG(dc_power),
	AVG(ac_power),
	(AVG(ac_power)/AVG(dc_power))*100 AS efisiensi
FROM joined_plant_1
GROUP BY date_time
HAVING AVG(dc_power) != 0
ORDER BY date_time;

SELECT
	date_time,
	AVG(dc_power),
	AVG(ac_power),
	(AVG(ac_power)/AVG(dc_power))*100 AS efisiensi
FROM joined_plant_2
GROUP BY date_time
HAVING AVG(dc_power) != 0
ORDER BY date_time;
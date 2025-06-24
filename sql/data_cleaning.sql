-- check table
SELECT * FROM plant_1;
SELECT * FROM plant_2;
SELECT * FROM sensor_1;
SELECT * FROM sensor_2;

-- change column type
ALTER TABLE plant_1
ALTER COLUMN date_time TYPE TIMESTAMP
USING TO_TIMESTAMP(date_time, 'DD-MM-YYYY HH24:MI:SS');

ALTER TABLE plant_2
ALTER COLUMN date_time TYPE TIMESTAMP
USING TO_TIMESTAMP(date_time, 'YYYY-MM-DD HH24:MI:SS');

ALTER TABLE sensor_1
ALTER COLUMN date_time TYPE TIMESTAMP
USING TO_TIMESTAMP(date_time, 'YYYY-MM-DD HH24:MI:SS');

ALTER TABLE sensor_2
ALTER COLUMN date_time TYPE TIMESTAMP
USING TO_TIMESTAMP(date_time, 'YYYY-MM-DD HH24:MI:SS');


-- change column name
ALTER TABLE plant_1
RENAME COLUMN source_key TO inverter_id;

ALTER TABLE plant_2
RENAME COLUMN source_key TO inverter_id;

ALTER TABLE sensor_1
RENAME COLUMN source_key TO sensor_id;

ALTER TABLE sensor_2
RENAME COLUMN source_key TO sensor_id;

-- join table
SELECT 
	plant_1.date_time,
	plant_1. plant_id,
	plant_1.inverter_id,
	plant_1.dc_power,
	plant_1.ac_power,
	plant_1.daily_yield,
	plant_1.total_yield,
	sensor_1.sensor_id,
	sensor_1.ambient_temperature,
	sensor_1.module_temperature,
	sensor_1.irradiation
FROM plant_1
LEFT JOIN sensor_1
	ON plant_1.date_time = sensor_1.date_time;

SELECT 
	plant_2.date_time,
	plant_2. plant_id,
	plant_2.inverter_id,
	plant_2.dc_power,
	plant_2.ac_power,
	plant_2.daily_yield,
	plant_2.total_yield,
	sensor_2.sensor_id,
	sensor_2.ambient_temperature,
	sensor_2.module_temperature,
	sensor_.irradiation
FROM plant_2
LEFT JOIN sensor_2
	ON plant_2.date_time = sensor_2.date_time;

-- create new table
CREATE TABLE joined_plant_1 AS 
SELECT 
	plant_1.date_time,
	plant_1.plant_id,
	plant_1.inverter_id,
	plant_1.dc_power,
	plant_1.ac_power,
	plant_1.daily_yield,
	plant_1.total_yield,
	sensor_1.sensor_id,
	sensor_1.ambient_temperature,
	sensor_1.module_temperature,
	sensor_1.irradiation
FROM plant_1
LEFT JOIN sensor_1
	ON plant_1.date_time = sensor_1.date_time;


CREATE TABLE joined_plant_2 AS
SELECT 
	plant_2.date_time,
	plant_2.plant_id,
	plant_2.inverter_id,
	plant_2.dc_power,
	plant_2.ac_power,
	plant_2.daily_yield,
	plant_2.total_yield,
	sensor_2.sensor_id,
	sensor_2.ambient_temperature,
	sensor_2.module_temperature,
	sensor_2.irradiation
FROM plant_2
LEFT JOIN sensor_2
	ON plant_2.date_time = sensor_2.date_time;


-- CLEANING
-- check null value
SELECT * 
FROM joined_plant_1
WHERE sensor_id IS NULL;
-- terdapat 4 baris nilai null di table joined_plant_1. nilai null akan dihapus
DELETE FROM joined_plant_1
WHERE sensor_id IS NULL

SELECT * 
FROM joined_plant_2
WHERE irradiation is NULL;
-- joined_plant_2 is clean

-- validation data in table joined_plant_1
SELECT 
	MIN(date_time) AS min_date, 
	MAX(date_time) AS max_date,
	MIN(dc_power) AS min_dc,
	MAX(dc_power) AS max_dc,
	MIN(ac_power) AS min_ac,
	MAX(ac_power) AS max_ac,
	MIN(daily_yield) AS min_daily,
	MAX(daily_yield) AS max_daily,
	MIN(total_yield) AS min_total,
	MAX(total_yield) AS max_total,
	MIN(ambient_temperature) AS min_ambient,
	MAX(ambient_temperature) AS max_ambient,
	MIN(module_temperature) AS min_module,
	MAX(module_temperature) AS max_module,
	MIN(irradiation) AS min_irradiation,
	MAX(irradiation) AS max_irradiation
FROM joined_plant_1;


SELECT 
	*
FROM joined_plant_1;

-- validation data in table joined_plant_2
SELECT 
	MIN(date_time) AS min_date, 
	MAX(date_time) AS max_date,
	MIN(dc_power) AS min_dc,
	MAX(dc_power) AS max_dc,
	MIN(ac_power) AS min_ac,
	MAX(ac_power) AS max_ac,
	MIN(daily_yield) AS min_daily,
	MAX(daily_yield) AS max_daily,
	MIN(total_yield) AS min_total,
	MAX(total_yield) AS max_total,
	MIN(ambient_temperature) AS min_ambient,
	MAX(ambient_temperature) AS max_ambient,
	MIN(module_temperature) AS min_module,
	MAX(module_temperature) AS max_module,
	MIN(irradiation) AS min_irradiation,
	MAX(irradiation) AS max_irradiation
FROM joined_plant_2;
	
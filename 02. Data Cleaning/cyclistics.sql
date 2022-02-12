-- 1. Import datasets
-- 1.1 create a database for our case study: cyclistic 
CREATE DATABASE cyclistic;
USE cyclistic;

-- 1.2 create table for each month
CREATE TABLE Jan_21 (
	ride_id VARCHAR(100),
	rideable_type VARCHAR(100),	
	started_at DATETIME,	
	ended_at DATETIME,	
	start_station_name VARCHAR(100),
	start_station_id VARCHAR(100),	
	end_station_name VARCHAR(100),	
	end_station_id VARCHAR(100),	
	start_lat DECIMAL(10,8),	
	start_lng DECIMAL(11,8),	
	end_lat	DECIMAL(10,8),
	end_lng	DECIMAL(11,8),
	member_casual VARCHAR(100)
);


CREATE TABLE Feb_21 (
	ride_id VARCHAR(100),
	rideable_type VARCHAR(100),	
	started_at DATETIME,	
	ended_at DATETIME,	
	start_station_name VARCHAR(100),
	start_station_id VARCHAR(100),	
	end_station_name VARCHAR(100),	
	end_station_id VARCHAR(100),	
	start_lat DECIMAL(10,8),	
	start_lng DECIMAL(11,8),	
	end_lat	DECIMAL(10,8),
	end_lng	DECIMAL(11,8),
	member_casual VARCHAR(100)
);


CREATE TABLE Mar_21 (
	ride_id VARCHAR(100),
	rideable_type VARCHAR(100),	
	started_at DATETIME,	
	ended_at DATETIME,	
	start_station_name VARCHAR(100),
	start_station_id VARCHAR(100),	
	end_station_name VARCHAR(100),	
	end_station_id VARCHAR(100),	
	start_lat DECIMAL(10,8),	
	start_lng DECIMAL(11,8),	
	end_lat	DECIMAL(10,8),
	end_lng	DECIMAL(11,8),
	member_casual VARCHAR(100)
);

CREATE TABLE Apr_21 (
	ride_id VARCHAR(100),
	rideable_type VARCHAR(100),	
	started_at DATETIME,	
	ended_at DATETIME,	
	start_station_name VARCHAR(100),
	start_station_id VARCHAR(100),	
	end_station_name VARCHAR(100),	
	end_station_id VARCHAR(100),	
	start_lat DECIMAL(10,8),	
	start_lng DECIMAL(11,8),	
	end_lat	DECIMAL(10,8),
	end_lng	DECIMAL(11,8),
	member_casual VARCHAR(100)
);

CREATE TABLE May_21 (
	ride_id VARCHAR(100),
	rideable_type VARCHAR(100),	
	started_at DATETIME,	
	ended_at DATETIME,	
	start_station_name VARCHAR(100),
	start_station_id VARCHAR(100),	
	end_station_name VARCHAR(100),	
	end_station_id VARCHAR(100),	
	start_lat DECIMAL(10,8),	
	start_lng DECIMAL(11,8),	
	end_lat	DECIMAL(10,8),
	end_lng	DECIMAL(11,8),
	member_casual VARCHAR(100)
);

CREATE TABLE Jun_21 (
	ride_id VARCHAR(100),
	rideable_type VARCHAR(100),	
	started_at DATETIME,	
	ended_at DATETIME,	
	start_station_name VARCHAR(100),
	start_station_id VARCHAR(100),	
	end_station_name VARCHAR(100),	
	end_station_id VARCHAR(100),	
	start_lat DECIMAL(10,8),	
	start_lng DECIMAL(11,8),	
	end_lat	DECIMAL(10,8),
	end_lng	DECIMAL(11,8),
	member_casual VARCHAR(100)
);

CREATE TABLE Jul_21 (
	ride_id VARCHAR(100),
	rideable_type VARCHAR(100),	
	started_at DATETIME,	
	ended_at DATETIME,	
	start_station_name VARCHAR(100),
	start_station_id VARCHAR(100),	
	end_station_name VARCHAR(100),	
	end_station_id VARCHAR(100),	
	start_lat DECIMAL(10,8),	
	start_lng DECIMAL(11,8),	
	end_lat	DECIMAL(10,8),
	end_lng	DECIMAL(11,8),
	member_casual VARCHAR(100)
);


CREATE TABLE Aug_21 (
	ride_id VARCHAR(100),
	rideable_type VARCHAR(100),	
	started_at DATETIME,	
	ended_at DATETIME,	
	start_station_name VARCHAR(100),
	start_station_id VARCHAR(100),	
	end_station_name VARCHAR(100),	
	end_station_id VARCHAR(100),	
	start_lat DECIMAL(10,8),	
	start_lng DECIMAL(11,8),	
	end_lat	DECIMAL(10,8),
	end_lng	DECIMAL(11,8),
	member_casual VARCHAR(100)
);

CREATE TABLE Sep_21 (
	ride_id VARCHAR(100),
	rideable_type VARCHAR(100),	
	started_at DATETIME,	
	ended_at DATETIME,	
	start_station_name VARCHAR(100),
	start_station_id VARCHAR(100),	
	end_station_name VARCHAR(100),	
	end_station_id VARCHAR(100),	
	start_lat DECIMAL(10,8),	
	start_lng DECIMAL(11,8),	
	end_lat	DECIMAL(10,8),
	end_lng	DECIMAL(11,8),
	member_casual VARCHAR(100)
);

CREATE TABLE Oct_21 (
	ride_id VARCHAR(100),
	rideable_type VARCHAR(100),	
	started_at DATETIME,	
	ended_at DATETIME,	
	start_station_name VARCHAR(100),
	start_station_id VARCHAR(100),	
	end_station_name VARCHAR(100),	
	end_station_id VARCHAR(100),	
	start_lat DECIMAL(10,8),	
	start_lng DECIMAL(11,8),	
	end_lat	DECIMAL(10,8),
	end_lng	DECIMAL(11,8),
	member_casual VARCHAR(100)
);

CREATE TABLE Nov_21 (
	ride_id VARCHAR(100),
	rideable_type VARCHAR(100),	
	started_at DATETIME,	
	ended_at DATETIME,	
	start_station_name VARCHAR(100),
	start_station_id VARCHAR(100),	
	end_station_name VARCHAR(100),	
	end_station_id VARCHAR(100),	
	start_lat DECIMAL(10,8),	
	start_lng DECIMAL(11,8),	
	end_lat	DECIMAL(10,8),
	end_lng	DECIMAL(11,8),
	member_casual VARCHAR(100)
);

CREATE TABLE Dec_21 (
	ride_id VARCHAR(100),
	rideable_type VARCHAR(100),	
	started_at DATETIME,	
	ended_at DATETIME,	
	start_station_name VARCHAR(100),
	start_station_id VARCHAR(100),	
	end_station_name VARCHAR(100),	
	end_station_id VARCHAR(100),	
	start_lat DECIMAL(10,8),	
	start_lng DECIMAL(11,8),	
	end_lat	DECIMAL(10,8),
	end_lng	DECIMAL(11,8),
	member_casual VARCHAR(100)
);


-- 1.3 Load the data 
-- insert Jan_21 dataset to Jan_21 Table 
LOAD DATA INFILE '/datasets/202101-divvy-tripdata.csv'
INTO TABLE Jan_21
FIELDS TERMINATED BY ','
IGNORE 1 ROWS
(@ride_id, @rideable_type, @started_at, @ended_at, @start_station_name, @start_station_id, @end_station_name, @end_station_id, @start_lat, @start_lng, @end_lat, @end_lng, @member_casual)
SET
ride_id = NULLIF(@ride_id, ''),	
rideable_type = NULLIF(@rideable_type, ''),	
started_at = NULLIF(@started_at, ''),	
ended_at = NULLIF(@ended_at, ''),	
start_station_name = NULLIF(@start_station_name, ''),	
start_station_id = NULLIF(@start_station_id, ''),	
end_station_name = NULLIF(@end_station_name, ''),	
end_station_id = NULLIF(@end_station_id, ''),	
start_lat = NULLIF(@start_lat, ''),	
start_lng = NULLIF(@start_lng, ''),	
end_lat = NULLIF(@end_lat, ''),	
end_lng = NULLIF(@end_lng, ''),	
member_casual = NULLIF(@member_casual, '')
;

-- insert Feb_21 dataset to Feb_21 Table 
LOAD DATA INFILE '/datasets/202102-divvy-tripdata.csv'
INTO TABLE Feb_21
FIELDS TERMINATED BY ','
IGNORE 1 ROWS
(@ride_id, @rideable_type, @started_at, @ended_at, @start_station_name, @start_station_id, @end_station_name, @end_station_id, @start_lat, @start_lng, @end_lat, @end_lng, @member_casual)
SET
ride_id = NULLIF(@ride_id, ''),	
rideable_type = NULLIF(@rideable_type, ''),	
started_at = NULLIF(@started_at, ''),	
ended_at = NULLIF(@ended_at, ''),	
start_station_name = NULLIF(@start_station_name, ''),	
start_station_id = NULLIF(@start_station_id, ''),	
end_station_name = NULLIF(@end_station_name, ''),	
end_station_id = NULLIF(@end_station_id, ''),	
start_lat = NULLIF(@start_lat, ''),	
start_lng = NULLIF(@start_lng, ''),	
end_lat = NULLIF(@end_lat, ''),	
end_lng = NULLIF(@end_lng, ''),	
member_casual = NULLIF(@member_casual, '')
;

-- insert Mar_21 dataset to Mar_21 Table 
LOAD DATA INFILE '/datasets/202103-divvy-tripdata.csv'
INTO TABLE Mar_21
FIELDS TERMINATED BY ','
IGNORE 1 ROWS
(@ride_id, @rideable_type, @started_at, @ended_at, @start_station_name, @start_station_id, @end_station_name, @end_station_id, @start_lat, @start_lng, @end_lat, @end_lng, @member_casual)
SET
ride_id = NULLIF(@ride_id, ''),	
rideable_type = NULLIF(@rideable_type, ''),	
started_at = NULLIF(@started_at, ''),	
ended_at = NULLIF(@ended_at, ''),	
start_station_name = NULLIF(@start_station_name, ''),	
start_station_id = NULLIF(@start_station_id, ''),	
end_station_name = NULLIF(@end_station_name, ''),	
end_station_id = NULLIF(@end_station_id, ''),	
start_lat = NULLIF(@start_lat, ''),	
start_lng = NULLIF(@start_lng, ''),	
end_lat = NULLIF(@end_lat, ''),	
end_lng = NULLIF(@end_lng, ''),	
member_casual = NULLIF(@member_casual, '')
;

-- insert Apr_21 dataset to Apr_21 Table 
LOAD DATA INFILE '/datasets/202104-divvy-tripdata.csv'
INTO TABLE Apr_21
FIELDS TERMINATED BY ','
IGNORE 1 ROWS
(@ride_id, @rideable_type, @started_at, @ended_at, @start_station_name, @start_station_id, @end_station_name, @end_station_id, @start_lat, @start_lng, @end_lat, @end_lng, @member_casual)
SET
ride_id = NULLIF(@ride_id, ''),	
rideable_type = NULLIF(@rideable_type, ''),	
started_at = NULLIF(@started_at, ''),	
ended_at = NULLIF(@ended_at, ''),	
start_station_name = NULLIF(@start_station_name, ''),	
start_station_id = NULLIF(@start_station_id, ''),	
end_station_name = NULLIF(@end_station_name, ''),	
end_station_id = NULLIF(@end_station_id, ''),	
start_lat = NULLIF(@start_lat, ''),	
start_lng = NULLIF(@start_lng, ''),	
end_lat = NULLIF(@end_lat, ''),	
end_lng = NULLIF(@end_lng, ''),	
member_casual = NULLIF(@member_casual, '')
;

-- insert May_21 dataset to May_21 Table 
LOAD DATA INFILE '/datasets/202105-divvy-tripdata.csv'
INTO TABLE May_21
FIELDS TERMINATED BY ','
IGNORE 1 ROWS
(@ride_id, @rideable_type, @started_at, @ended_at, @start_station_name, @start_station_id, @end_station_name, @end_station_id, @start_lat, @start_lng, @end_lat, @end_lng, @member_casual)
SET
ride_id = NULLIF(@ride_id, ''),	
rideable_type = NULLIF(@rideable_type, ''),	
started_at = NULLIF(@started_at, ''),	
ended_at = NULLIF(@ended_at, ''),	
start_station_name = NULLIF(@start_station_name, ''),	
start_station_id = NULLIF(@start_station_id, ''),	
end_station_name = NULLIF(@end_station_name, ''),	
end_station_id = NULLIF(@end_station_id, ''),	
start_lat = NULLIF(@start_lat, ''),	
start_lng = NULLIF(@start_lng, ''),	
end_lat = NULLIF(@end_lat, ''),	
end_lng = NULLIF(@end_lng, ''),	
member_casual = NULLIF(@member_casual, '')
;

-- insert Jun_21 dataset to Jun_21 Table 
LOAD DATA INFILE '/datasets/202106-divvy-tripdata.csv'
INTO TABLE Jun_21
FIELDS TERMINATED BY ','
IGNORE 1 ROWS
(@ride_id, @rideable_type, @started_at, @ended_at, @start_station_name, @start_station_id, @end_station_name, @end_station_id, @start_lat, @start_lng, @end_lat, @end_lng, @member_casual)
SET
ride_id = NULLIF(@ride_id, ''),	
rideable_type = NULLIF(@rideable_type, ''),	
started_at = NULLIF(@started_at, ''),	
ended_at = NULLIF(@ended_at, ''),	
start_station_name = NULLIF(@start_station_name, ''),	
start_station_id = NULLIF(@start_station_id, ''),	
end_station_name = NULLIF(@end_station_name, ''),	
end_station_id = NULLIF(@end_station_id, ''),	
start_lat = NULLIF(@start_lat, ''),	
start_lng = NULLIF(@start_lng, ''),	
end_lat = NULLIF(@end_lat, ''),	
end_lng = NULLIF(@end_lng, ''),	
member_casual = NULLIF(@member_casual, '')
;

-- insert Jul_21 dataset to Jul_21 Table 
LOAD DATA INFILE '/datasets/202107-divvy-tripdata.csv'
INTO TABLE Jul_21
FIELDS TERMINATED BY ','
IGNORE 1 ROWS
(@ride_id, @rideable_type, @started_at, @ended_at, @start_station_name, @start_station_id, @end_station_name, @end_station_id, @start_lat, @start_lng, @end_lat, @end_lng, @member_casual)
SET
ride_id = NULLIF(@ride_id, ''),	
rideable_type = NULLIF(@rideable_type, ''),	
started_at = NULLIF(@started_at, ''),	
ended_at = NULLIF(@ended_at, ''),	
start_station_name = NULLIF(@start_station_name, ''),	
start_station_id = NULLIF(@start_station_id, ''),	
end_station_name = NULLIF(@end_station_name, ''),	
end_station_id = NULLIF(@end_station_id, ''),	
start_lat = NULLIF(@start_lat, ''),	
start_lng = NULLIF(@start_lng, ''),	
end_lat = NULLIF(@end_lat, ''),	
end_lng = NULLIF(@end_lng, ''),	
member_casual = NULLIF(@member_casual, '')
;

-- insert Aug_21 dataset to Aug_21 Table 
LOAD DATA INFILE '/datasets/202108-divvy-tripdata.csv'
INTO TABLE Aug_21
FIELDS TERMINATED BY ','
IGNORE 1 ROWS
(@ride_id, @rideable_type, @started_at, @ended_at, @start_station_name, @start_station_id, @end_station_name, @end_station_id, @start_lat, @start_lng, @end_lat, @end_lng, @member_casual)
SET
ride_id = NULLIF(@ride_id, ''),	
rideable_type = NULLIF(@rideable_type, ''),	
started_at = NULLIF(@started_at, ''),	
ended_at = NULLIF(@ended_at, ''),	
start_station_name = NULLIF(@start_station_name, ''),	
start_station_id = NULLIF(@start_station_id, ''),	
end_station_name = NULLIF(@end_station_name, ''),	
end_station_id = NULLIF(@end_station_id, ''),	
start_lat = NULLIF(@start_lat, ''),	
start_lng = NULLIF(@start_lng, ''),	
end_lat = NULLIF(@end_lat, ''),	
end_lng = NULLIF(@end_lng, ''),	
member_casual = NULLIF(@member_casual, '')
;

-- insert Sep_21 dataset to Sep_21 Table 
LOAD DATA INFILE '/datasets/202109-divvy-tripdata.csv'
INTO TABLE Sep_21
FIELDS TERMINATED BY ','
IGNORE 1 ROWS
(@ride_id, @rideable_type, @started_at, @ended_at, @start_station_name, @start_station_id, @end_station_name, @end_station_id, @start_lat, @start_lng, @end_lat, @end_lng, @member_casual)
SET
ride_id = NULLIF(@ride_id, ''),	
rideable_type = NULLIF(@rideable_type, ''),	
started_at = NULLIF(@started_at, ''),	
ended_at = NULLIF(@ended_at, ''),	
start_station_name = NULLIF(@start_station_name, ''),	
start_station_id = NULLIF(@start_station_id, ''),	
end_station_name = NULLIF(@end_station_name, ''),	
end_station_id = NULLIF(@end_station_id, ''),	
start_lat = NULLIF(@start_lat, ''),	
start_lng = NULLIF(@start_lng, ''),	
end_lat = NULLIF(@end_lat, ''),	
end_lng = NULLIF(@end_lng, ''),	
member_casual = NULLIF(@member_casual, '')
;

-- insert Oct_21 dataset to Oct_21 Table 
LOAD DATA INFILE '/datasets/202110-divvy-tripdata.csv'
INTO TABLE Oct_21
FIELDS TERMINATED BY ','
IGNORE 1 ROWS
(@ride_id, @rideable_type, @started_at, @ended_at, @start_station_name, @start_station_id, @end_station_name, @end_station_id, @start_lat, @start_lng, @end_lat, @end_lng, @member_casual)
SET
ride_id = NULLIF(@ride_id, ''),	
rideable_type = NULLIF(@rideable_type, ''),	
started_at = NULLIF(@started_at, ''),	
ended_at = NULLIF(@ended_at, ''),	
start_station_name = NULLIF(@start_station_name, ''),	
start_station_id = NULLIF(@start_station_id, ''),	
end_station_name = NULLIF(@end_station_name, ''),	
end_station_id = NULLIF(@end_station_id, ''),	
start_lat = NULLIF(@start_lat, ''),	
start_lng = NULLIF(@start_lng, ''),	
end_lat = NULLIF(@end_lat, ''),	
end_lng = NULLIF(@end_lng, ''),	
member_casual = NULLIF(@member_casual, '')
;

-- insert Nov_21 dataset to Nov_21 Table 
LOAD DATA INFILE '/datasets/202111-divvy-tripdata.csv'
INTO TABLE Nov_21
FIELDS TERMINATED BY ','
IGNORE 1 ROWS
(@ride_id, @rideable_type, @started_at, @ended_at, @start_station_name, @start_station_id, @end_station_name, @end_station_id, @start_lat, @start_lng, @end_lat, @end_lng, @member_casual)
SET
ride_id = NULLIF(@ride_id, ''),	
rideable_type = NULLIF(@rideable_type, ''),	
started_at = NULLIF(@started_at, ''),	
ended_at = NULLIF(@ended_at, ''),	
start_station_name = NULLIF(@start_station_name, ''),	
start_station_id = NULLIF(@start_station_id, ''),	
end_station_name = NULLIF(@end_station_name, ''),	
end_station_id = NULLIF(@end_station_id, ''),	
start_lat = NULLIF(@start_lat, ''),	
start_lng = NULLIF(@start_lng, ''),	
end_lat = NULLIF(@end_lat, ''),	
end_lng = NULLIF(@end_lng, ''),	
member_casual = NULLIF(@member_casual, '')
;

-- insert Dec_21 dataset to Dec_21 Table 
LOAD DATA INFILE '/datasets/202112-divvy-tripdata.csv'
INTO TABLE Dec_21
FIELDS TERMINATED BY ','
IGNORE 1 ROWS
(@ride_id, @rideable_type, @started_at, @ended_at, @start_station_name, @start_station_id, @end_station_name, @end_station_id, @start_lat, @start_lng, @end_lat, @end_lng, @member_casual)
SET
ride_id = NULLIF(@ride_id, ''),	
rideable_type = NULLIF(@rideable_type, ''),	
started_at = NULLIF(@started_at, ''),	
ended_at = NULLIF(@ended_at, ''),	
start_station_name = NULLIF(@start_station_name, ''),	
start_station_id = NULLIF(@start_station_id, ''),	
end_station_name = NULLIF(@end_station_name, ''),	
end_station_id = NULLIF(@end_station_id, ''),	
start_lat = NULLIF(@start_lat, ''),	
start_lng = NULLIF(@start_lng, ''),	
end_lat = NULLIF(@end_lat, ''),	
end_lng = NULLIF(@end_lng, ''),	
member_casual = NULLIF(@member_casual, '')
;


-- 1.4 Check the overall structure of the tables 
DESCRIBE Jan_21;
DESCRIBE Feb_21;
DESCRIBE Mar_21;
DESCRIBE Apr_21;
DESCRIBE May_21;
DESCRIBE Jun_21;
DESCRIBE Jul_21;
DESCRIBE Aug_21;
DESCRIBE Sep_21;
DESCRIBE Oct_21;
DESCRIBE Nov_21;
DESCRIBE Dec_21;

-- 2. Combine datasets
-- 2.1 create a new table - all_trips
CREATE TABLE all_trips (
	ride_id VARCHAR(100),
	rideable_type VARCHAR(100),	
	started_at DATETIME,	
	ended_at DATETIME,	
	start_station_name VARCHAR(100),
	start_station_id VARCHAR(100),	
	end_station_name VARCHAR(100),	
	end_station_id VARCHAR(100),	
	start_lat DECIMAL(10,8),	
	start_lng DECIMAL(11,8),	
	end_lat	DECIMAL(10,8),
	end_lng	DECIMAL(11,8),
	member_casual VARCHAR(100)
);

-- 2.2 Merging all datasets into one - all_trips table
INSERT INTO all_trips
 SELECT * FROM Jan_21
 UNION ALL
 SELECT * FROM Feb_21
 UNION ALL
 SELECT * FROM Mar_21
 UNION ALL
 SELECT * FROM Apr_21
  UNION ALL
 SELECT * FROM May_21
  UNION ALL
 SELECT * FROM Jun_21
  UNION ALL
 SELECT * FROM Jul_21
  UNION ALL
 SELECT * FROM Aug_21
  UNION ALL
 SELECT * FROM Sep_21
  UNION ALL
 SELECT * FROM Oct_21
  UNION ALL
 SELECT * FROM Nov_21
  UNION ALL
 SELECT * FROM Dec_21;
   
   
-- 3. Prepare dataset 
-- 3.1 seperate columns for year, month, day of week etc. This will be useful for data analysis.
CREATE TABLE all_trips_2
	SELECT 
		*,
		YEAR(started_at) as year,
		MONTH(started_at) as month,
		WEEK(started_at) as week,
		dayofweek(started_at) as day_of_week,
		DAY(started_at) as day,
		DATE_FORMAT(started_at, "%Y-%m-%d") as YMD,
		DATE_FORMAT(started_at, "%H:%i:%s") as ToD,
		(ended_at - started_at)/60 as duration_in_min
	FROM cyclistic.all_trips
	ORDER BY started_at;
 
 
-- 4. Clean dataset 
-- 4.1 clean the dataset - remove rows with ride length < 0
CREATE TABLE all_trips_3
	SELECT *
	FROM cyclistic.all_trips_2 
	WHERE
    duration_in_min > 0;


-- 4.2 clean the dataset - remove incomplete rows when start_station_name is ''
CREATE TABLE all_trips_4
	SELECT *
	FROM cyclistic.all_trips_3 
	WHERE
    start_station_name IS NOT NULL;
 
 
-- 4.3 clean the dataset - remove incomplete rows when end_station_name is ''
CREATE TABLE all_trips_5
	SELECT *
	FROM cyclistic.all_trips_4 
	WHERE
    end_station_name IS NOT NULL;
    
    
-- 4.4 check if there are duplicate IDs
SELECT COUNT(ride_id) as duplicate_count
FROM 
	cyclistic.all_trips_5
GROUP BY 
	ride_id
HAVING COUNT(ride_id) > 1;
-- The above code returned no results, no duplicates are recorded in the cleaned dataset. 


-- 5. Understand dataset
-- 5.1 check rideable type
SELECT 
	rideable_type, 
    count(rideable_type) as count
FROM
	cyclistic.all_trips_5
GROUP BY 
	rideable_type;    
-- the above vode retutned 3 types of bikes - classic, electric and docked bikes. Mostly used bikes are classic, then electric then docked.


-- 5.2 check when each rideable type was added to the dataset
SELECT 
	year,
    month, 
    rideable_type,
    count(rideable_type) as count
FROM
	cyclistic.all_trips_5
GROUP BY
	year,
    month,
    rideable_type;
-- the above code showed that all three types existed in each month.


-- 5.3 list unique station names
SELECT
	start_station_name,
	count(start_station_name) as count
FROM
	cyclistic.all_trips_5
GROUP BY
	start_station_name;
    
    
-- 5.4 list unique station names used each month
SELECT 
    month, 
    start_station_name,
    count(start_station_name) as count
FROM
	cyclistic.all_trips_5
GROUP BY
    month,
    start_station_name;
-- the above code shows the number of rides per station name per month
-- the result showed that there station names had less than 10 rides in a month. This could mean station names are added or removed during the month


-- 5.5 list station names that has less than 10 rides
SELECT 
    month, 
    start_station_name,
    count(start_station_name) as count
FROM
	cyclistic.all_trips_5
GROUP BY
    month,
    start_station_name
HAVING count(start_station_name) <10;
-- the above list should be noted during data analysis

DESCRIBE cyclistic.all_trips_5;

-- 6. Save the dataset
-- 6.1 extract the clean data to csv
SELECT 
	ride_id,
	rideable_type,
	started_at,
	ended_at,
	start_station_name,
	start_station_id,
	end_station_name,
	end_station_id,
	start_lat,
	start_lng,
	end_lat,
	end_lng,
	member_casual,
	year,
	month,
	week,
	day_of_week,
	day,
	YMD,
	ToD,
	duration_in_min
FROM 
	cyclistic.all_trips_5
INTO OUTFILE 
	'/datasets/all_trips_clean_data.csv' 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';


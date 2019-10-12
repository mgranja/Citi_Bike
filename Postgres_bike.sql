

CREATE TABLE bikes
(
tripduration INT,
 starttime DATE,
 stoptime DATE,
 start_station_id NUMERIC,
 start_station_name TEXT,
 start_lat NUMERIC,
 start_lon NUMERIC,
 end_station_id NUMERIC,
 end_station_name TEXT,
 end_lat NUMERIC,
 end_lon NUMERIC,
 bikeid BIGINT,
 usertype TEXT,
 birth_year INT,
 gender INT,
age INT
)

create table clean_bikes as 
sELECT * 
FROM
   bikes
where age < 66; 



create table TEMP1 as 
SELECT
   gender_2,usertype,
   COUNT (gender_2)
FROM
   bikes
GROUP BY
   gender_2,usertype;
   
create table Customers as 
select *
from bikes
where usertype = 'Customer';



select start_station_id, start_station_name,
count(bikeid)
from customers
group by start_station_id, start_station_name
order by count(bikeid)desc;

select *
from clean_bikes
where stoptime >'12/31/2018'


Update clean_bikes
	Set quarter = CASE 
	when date_part('month', starttime) in (1, 2, 3) then 'QTR1'
	when date_part('month', starttime) in (4, 5, 6) then 'QTR2'
	when date_part('month', starttime) in (7, 8, 9) then 'QTR3'
	when date_part('month', starttime) in (10, 11,12) then 'QTR4' 
	END 


select quarter,
count(bikeid)
from clean_bikes
group by quarter
order by count(bikeid)desc;


select *
from clean_bikes
where stoptime >'12/31/2018'

create table QTR2 as 
select *
from clean_bikes
where quarter = 'QTR2';


create table summary as 
SELECT
   gender_2,usertype,
COUNT(gender_2)
FROM
   clean_bikes
GROUP BY
   gender_2,usertype;
   

SELECT
   bikeid,
COUNT(bikeid)
FROM
   clean_bikes
GROUP BY
   bikeid
order by count DESC; 








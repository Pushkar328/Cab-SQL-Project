use trips;
1. total trips?;
Ans. 2161
select count(distinct tripid) from merged_trips_details;

2. total drivers?;
Ans. 30
select * from trips;
select count(distinct driverid) from trips;

3.total earnings?;
Ans. 751343
select sum(fare) from trips;

4. total Completed trips?;
	Ans. 983
select * from merged_trips_details;
select sum(end_ride) from merged_trips_details;

5.total searches?;
Ans. 2161
select sum(searches),sum(searches_got_estimate),sum(searches_for_quotes),sum(searches_got_quotes),
sum(customer_not_cancelled),sum(driver_not_cancelled),sum(otp_entered),sum(end_ride)
from merged_trips_details;

6. total searches which got estimate?
Ans. 1758
Use Question no. 4 Syntax;

7. total driver cancelled?
Ans. 1021
SELECT
    COUNT(*) - SUM(driver_not_cancelled) AS total_driver_canceled
FROM
   merged_trips_details;
   
   8. average distance per trip?
   Ans. 14.3927
   SELECT
    AVG(distance) AS average_distance_per_trip
FROM
    trips;

9. average fare per trip?
Ans. 764.3367
select sum(fare)/count(*) from trips;

10. which is the most used payment method?
Ans. Credit Card
SELECT
    faremethod,
    COUNT(*) AS usage_count
FROM
    trips
GROUP BY
    faremethod
ORDER BY
    usage_count DESC
LIMIT 1;

11. which two locations had the most trips?
Ans. Shanti Nagar and Yelahanka
SELECT
    loc_from,
    loc_to,
    COUNT(*) AS trip_count
FROM
    trips
GROUP BY
    loc_from, loc_to
ORDER BY
    trip_count DESC
LIMIT 2;

12. which driver , customer pair had more orders?
Ans. driveid=17, cust id=96, trip_count=4
SELECT
    driverid,
    custid,
    COUNT(*) AS trip_count
FROM
    trips
GROUP BY
    driverid, custid
ORDER BY
    trip_count DESC
LIMIT 1;

13. which area got highest trips in which duration?
Ans. Ramanagaram in  23-24 duration
SELECT
    loc_from,
    duration,
    COUNT(*) AS trip_count
FROM
    trips
GROUP BY
    loc_from, duration
ORDER BY
    trip_count DESC;

14. which area got the highest fares, cancellations,trips?
Ans. Bangalore South has highest fares, Ramanagaram is a area with most trips, Gandhi Nagar is a area with most cancellation
SELECT
    loc_from,
    SUM(fare) AS total_fare
FROM
    trips
GROUP BY
    loc_from
ORDER BY
    total_fare DESC
LIMIT 1;
SELECT
    loc_from,
    COUNT(*) AS trip_count
FROM
    trips
GROUP BY
    loc_from
ORDER BY
    trip_count DESC
LIMIT 1;
ALTER TABLE trips ADD COLUMN end_ride INTEGER;
SELECT
    loc_from,
    COUNT(*) - SUM(end_ride) AS total_cancellations
FROM
    trips
GROUP BY
    loc_from
ORDER BY
    total_cancellations DESC
LIMIT 1;

15. which duration got the highest trips and fares?
Ans. Mahadevapura has highest trips and fares
SELECT
    duration,
    COUNT(*) AS trip_count
FROM
    trips
GROUP BY
    duration
ORDER BY
    trip_count DESC
LIMIT 1;
SELECT
    duration,
    SUM(fare) AS total_fare
FROM
    trips
GROUP BY
    duration
ORDER BY
    total_fare DESC
LIMIT 1;

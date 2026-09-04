create database ola;
use ola ;

-- SQL Questions:
-- 1. Retrieve all successful bookings:

CREATE VIEW Successful_Booking AS
SELECT * FROM ola_bookings
WHERE Booking_Status = 'success';

-- 1. Retrieve all successful bookings:
SELECT * FROM Successful_Booking;

-- 2. Find the average ride distance for each vehicle type:

CREATE VIEW average_ride_distance AS
SELECT Vehicle_Type, AVG(Ride_Distance) AS avg_distance
FROM ola_bookings
GROUP BY Vehicle_Type;

-- 2. Find the average ride distance for each vehicle type:
SELECT * FROM average_ride_distance;

-- 3. Get the total number of Canceled rides by customers:

CREATE VIEW Canceled_rides_by_customers AS
SELECT COUNT(*) FROM ola_bookings
WHERE Booking_Status = 'Canceled by Driver';

-- 3. Get the total number of cancelled rides by customers:
SELECT * FROM Canceled_rides_by_customers ;

-- 4. List the top 5 customers who booked the highest number of rides:

CREATE VIEW Top_5_Customers AS
SELECT Customer_ID , count(Booking_ID) as total_rides
FROM ola_bookings
GROUP BY customer_id 
ORDER BY total_rides DESC LIMIT 5 ;

-- 4. List the top 5 customers who booked the highest number of rides:
SELECT * FROM Top_5_Customers ;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:

CREATE VIEW Rides_Cancelled_By_Drivers_P_C_Issues AS
SELECT COUNT(*) FROM ola_bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
SELECT * FROM Rides_Cancelled_By_Drivers_P_C_Issues ;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

CREATE VIEW  MIN_MAX_Driver_Ratings_For_Prime_Sedan AS
 SELECT MAX(Driver_Ratings) as Max_Rating,
 MIN(Driver_Ratings) as Min_Rating 
 FROM OLA_BOOKINGS where Vehicle_Type = 'Prime sedan';
 
-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT * FROM MIN_MAX_Driver_Ratings_For_Prime_Sedan ; 

-- 7. Retrieve all rides where payment was made using UPI:
CREATE VIEW UPI_Payment AS
SELECT * FROM OLA_BOOKINGS 
WHERE Payment_Method = 'UPI' ;

-- 7. Retrieve all rides where payment was made using UPI:
SELECT * FROM UPI_Payment ;

-- 8. Find the average customer rating per vehicle type:

CREATE VIEW avg_customer_rating AS
SELECT vehicle_type , AVG(Customer_Rating) AS Avg_Customer_Ratings
FROM ola_bookings
GROUP BY vehicle_type ;

-- 8. Find the average customer rating per vehicle type:
SELECT * FROM avg_customer_rating ;

-- 9. Calculate the total booking value of rides completed successfully:

CREATE VIEW Total_Successfully_Booking_Value AS 
SELECT SUM(Booking_Value) AS Total_successfully_value
FROM ola_bookings
WHERE booking_status = 'Success';


-- 9. Calculate the total booking value of rides completed successfully:
SELECT * FROM Total_Successfully_Booking_Value ;

-- 10. List all incomplete rides along with the reason:

CREATE VIEW Incomplete_rides_reason AS
SELECT booking_ID , Incomplete_rides_reason
FROM ola_bookings
WHERE Incomplete_rides = 'Yes';


-- 10. List all incomplete rides along with the reason:
SELECT * FROM Incomplete_rides_reason ;











-- 1. Retrieve all successful bookings:
SELECT * FROM Successful_Booking;

-- 2. Find the average ride distance for each vehicle type:
SELECT * FROM average_ride_distance;

-- 3. Get the total number of cancelled rides by customers:
SELECT * FROM Canceled_rides_by_customers ;

-- 4. List the top 5 customers who booked the highest number of rides:
SELECT * FROM Top_5_Customers ;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
SELECT * FROM Rides_Cancelled_By_Drivers_P_C_Issues ;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT * FROM MIN_MAX_Driver_Ratings_For_Prime_Sedan ; 

-- 7. Retrieve all rides where payment was made using UPI:
SELECT * FROM UPI_Payment ;


-- 8. Find the average customer rating per vehicle type:
SELECT * FROM avg_customer_rating ;

-- 9. Calculate the total booking value of rides completed successfully:
SELECT * FROM Total_Successfully_Booking_Value ;

-- 10. List all incomplete rides along with the reason:
SELECT * FROM Incomplete_rides_reason ;


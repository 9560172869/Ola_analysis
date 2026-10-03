Create database Ola;
use Ola;

-- 1. Retrieve all successful bookings:  

Create View Sucessful_Bookings AS
Select * From booking 
Where Booking_Status = 'Success';

-- 2. Find the average ride distance for each vehicle type:   

Create View Ride_distance_for_each_Vehicle as
 Select Vehicle_Type, AVG(Ride_Distance) as avg_distance 
 From booking
 group by Vehicle_Type;
 
-- 3. Get the total number of cancelled rides by customers:

Create View Cancelled_ride_by_Customers as 
select Count(*)
From booking
Where Booking_status = 'Canceled by Customer';

-- 4. List the top 5 customers who booked the highest number of rides:

Select Customer_ID, COUNT(Booking_ID) as total_rides
from booking
group by Customer_ID
order by total_rides desc limit 5;


-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:

Select Count(*) 
From booking
Where Canceled_Rides_by_Driver = 'Personal & Car related issue';

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

Select MAX(Driver_Ratings) as Max_rating,
MIN(Driver_Ratings) as Min_Rating
from booking
Where Vehicle_Type = 'Prime Sedan';

-- 7. Retrieve all rides where payment was made using UPI:

Select * 
From booking
where Payment_Method = 'UPI';

-- 8. Find the average customer rating per vehicle type:

Select Vehicle_Type, avg(Customer_Rating) as avg_customer_rating
From booking
Group by Vehicle_Type;
-- 9. Calculate the total booking value of rides completed successfully:

Select Sum(Booking_Value) as total_sucessful_value
from booking
where Booking_Value = 'Success';

-- 10. List all incomplete rides along with the reason: 

Select Booking_ID, Incomplete_Rides_Reason
From booking
Where Incomplete_Rides = 'Yes';	
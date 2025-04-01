-- Query 1 (Aggregation): Average price per hotel category
SELECT h.category, AVG(r.price) AS avg_price
FROM Hotel h
JOIN Room r ON h.hotel_id = r.hotel_id
GROUP BY h.category;

-- Query 2 (Nested): Available rooms in Ottawa
SELECT room_id, price
FROM Room
WHERE hotel_id IN (
    SELECT hotel_id FROM Hotel WHERE address LIKE '%Ottawa%'
) AND available = TRUE;

-- Query 3: Find all bookings for customer John Doe
SELECT b.booking_id, r.room_id, b.start_date, b.end_date
FROM Booking b
JOIN Customer c ON b.customer_id = c.customer_id
WHERE c.full_name = 'John Doe';

-- Query 4: Total revenue per hotel
SELECT h.hotel_id, SUM(r.price) AS total_revenue
FROM Renting rt
JOIN Room r ON rt.room_id = r.room_id
JOIN Hotel h ON r.hotel_id = h.hotel_id
GROUP BY h.hotel_id;
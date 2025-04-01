-- View 1: Available rooms per area
CREATE VIEW available_rooms_per_area AS
SELECT h.address AS area, COUNT(r.room_id) AS available_rooms
FROM Hotel h
JOIN Room r ON h.hotel_id = r.hotel_id
WHERE r.available = TRUE
GROUP BY h.address;

-- View 2: Aggregated capacity per hotel
CREATE VIEW hotel_capacity AS
SELECT h.hotel_id, SUM(r.capacity) AS total_capacity
FROM Hotel h
JOIN Room r ON h.hotel_id = r.hotel_id
GROUP BY h.hotel_id;
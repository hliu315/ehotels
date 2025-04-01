-- Insert 5 hotel chains
INSERT INTO HotelChain (central_address, email, phone) VALUES
('123 Ottawa St', 'chain1@email.com', '613-111-1111'),
('456 Toronto St', 'chain2@email.com', '416-222-2222'),
('789 Montreal St', 'chain3@email.com', '514-333-3333'),
('101 Vancouver St', 'chain4@email.com', '604-444-4444'),
('202 Calgary St', 'chain5@email.com', '403-555-5555');

-- Insert 8 hotels per chain (example for chain 1)
INSERT INTO Hotel (chain_id, category, address, email, phone) VALUES
(1, 5, 'Ottawa Downtown', 'hotel1a@email.com', '613-123-4567'),
(1, 4, 'Ottawa Suburb', 'hotel1b@email.com', '613-234-5678'),
(1, 3, 'Toronto Downtown', 'hotel1c@email.com', '416-345-6789'),
(1, 5, 'Montreal Downtown', 'hotel1d@email.com', '514-456-7890'),
(1, 2, 'Vancouver Downtown', 'hotel1e@email.com', '604-567-8901'),
(1, 4, 'Calgary Downtown', 'hotel1f@email.com', '403-678-9012'),
(1, 3, 'Quebec City Downtown', 'hotel1g@email.com', '418-789-0123'),
(1, 5, 'Halifax Downtown', 'hotel1h@email.com', '902-890-1234');

-- Insert 5 rooms per hotel (example for hotel 1)
INSERT INTO Room (hotel_id, price, amenities, capacity, sea_view, mountain_view) VALUES
(1, 200.00, ARRAY['TV', 'AC'], 2, TRUE, FALSE),
(1, 300.00, ARRAY['TV', 'AC', 'Fridge'], 4, TRUE, FALSE),
(1, 150.00, ARRAY['TV'], 1, FALSE, TRUE),
(1, 250.00, ARRAY['TV', 'Fridge'], 3, FALSE, TRUE),
(1, 400.00, ARRAY['TV', 'AC', 'Fridge', 'Jacuzzi'], 2, TRUE, TRUE),

(2, 200.00, ARRAY['TV', 'AC'], 2, TRUE, FALSE),
(2, 300.00, ARRAY['TV', 'AC', 'Fridge'], 4, TRUE, FALSE),
(2, 150.00, ARRAY['TV'], 1, FALSE, TRUE),
(2, 250.00, ARRAY['TV', 'Fridge'], 3, FALSE, TRUE),
(2, 400.00, ARRAY['TV', 'AC', 'Fridge', 'Jacuzzi'], 2, TRUE, TRUE),

(3, 200.00, ARRAY['TV', 'AC'], 2, TRUE, FALSE),
(3, 300.00, ARRAY['TV', 'AC', 'Fridge'], 4, TRUE, FALSE),
(3, 150.00, ARRAY['TV'], 1, FALSE, TRUE),
(3, 250.00, ARRAY['TV', 'Fridge'], 3, FALSE, TRUE),
(3, 400.00, ARRAY['TV', 'AC', 'Fridge', 'Jacuzzi'], 2, TRUE, TRUE),

(4, 200.00, ARRAY['TV', 'AC'], 2, TRUE, FALSE),
(4, 300.00, ARRAY['TV', 'AC', 'Fridge'], 4, TRUE, FALSE),
(4, 150.00, ARRAY['TV'], 1, FALSE, TRUE),
(4, 250.00, ARRAY['TV', 'Fridge'], 3, FALSE, TRUE),
(4, 400.00, ARRAY['TV', 'AC', 'Fridge', 'Jacuzzi'], 2, TRUE, TRUE),

(5, 200.00, ARRAY['TV', 'AC'], 2, TRUE, FALSE),
(5, 300.00, ARRAY['TV', 'AC', 'Fridge'], 4, TRUE, FALSE),
(5, 150.00, ARRAY['TV'], 1, FALSE, TRUE),
(5, 250.00, ARRAY['TV', 'Fridge'], 3, FALSE, TRUE),
(5, 400.00, ARRAY['TV', 'AC', 'Fridge', 'Jacuzzi'], 2, TRUE, TRUE);

-- Insert customers
INSERT INTO Customer (full_name, address, id_type, id_number) VALUES
('John Doe', '100 Customer St', 'SIN', '123456789'),
('Jane Smith', '200 Client Ave', 'Driver License', 'DL987654');

-- Insert employees (include a manager for each hotel)
INSERT INTO Employee (hotel_id, full_name, address, sin, role) VALUES
(1, 'Alice Johnson', '300 Employee Rd', 'SIN111111', 'Manager'),
(1, 'Bob Brown', '400 Staff St', 'SIN222222', 'Receptionist');

-- Insert bookings and rentings
INSERT INTO Booking (customer_id, room_id, start_date, end_date) VALUES
(1, 1, '2025-02-14', '2025-02-20');

INSERT INTO Renting (booking_id, customer_id, room_id, employee_id, check_in_date) VALUES
(1, 1, 1, 1, '2025-02-14');
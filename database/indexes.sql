CREATE INDEX idx_hotel_chain ON Hotel(chain_id);
CREATE INDEX idx_room_price ON Room(price);
CREATE INDEX idx_booking_dates ON Booking(start_date, end_date);
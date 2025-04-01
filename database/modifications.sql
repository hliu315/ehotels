-- Trigger 1: Prevent double booking
CREATE OR REPLACE FUNCTION check_room_available()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM Booking
        WHERE room_id = NEW.room_id
        AND NOT (NEW.end_date <= start_date OR NEW.start_date >= end_date))
    THEN
        RAISE EXCEPTION 'Room % is already booked for the selected dates.', NEW.room_id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER prevent_double_booking
BEFORE INSERT ON Booking
FOR EACH ROW EXECUTE FUNCTION check_room_available();

-- Trigger 2: Ensure each hotel has exactly one manager
CREATE OR REPLACE FUNCTION check_hotel_manager()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.role = 'Manager' AND EXISTS (
        SELECT 1 FROM Employee
        WHERE hotel_id = NEW.hotel_id AND role = 'Manager')
    THEN
        RAISE EXCEPTION 'Hotel % already has a manager.', NEW.hotel_id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER enforce_single_manager
BEFORE INSERT OR UPDATE ON Employee
FOR EACH ROW EXECUTE FUNCTION check_hotel_manager();

CREATE TABLE HotelChain (
    chain_id SERIAL PRIMARY KEY,
    central_address VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20) NOT NULL
);

CREATE TABLE Hotel (
    hotel_id SERIAL PRIMARY KEY,
    chain_id INT NOT NULL REFERENCES HotelChain(chain_id) ON DELETE CASCADE,
    category INT CHECK (category BETWEEN 1 AND 5),
    address VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20) NOT NULL
);

CREATE TABLE Room (
    room_id SERIAL PRIMARY KEY,
    hotel_id INT NOT NULL REFERENCES Hotel(hotel_id) ON DELETE CASCADE,
    price DECIMAL(10,2) CHECK (price > 0),
    amenities TEXT[],
    capacity INT CHECK (capacity > 0),
    sea_view BOOLEAN DEFAULT FALSE,
    mountain_view BOOLEAN DEFAULT FALSE,
    extendable BOOLEAN DEFAULT FALSE,
    problems TEXT,
    available BOOLEAN DEFAULT TRUE
);

CREATE TABLE Customer (
    customer_id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    id_type VARCHAR(50) NOT NULL,
    id_number VARCHAR(100) UNIQUE NOT NULL,
    registration_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE Employee (
    employee_id SERIAL PRIMARY KEY,
    hotel_id INT NOT NULL REFERENCES Hotel(hotel_id) ON DELETE CASCADE,
    full_name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    sin VARCHAR(30) UNIQUE NOT NULL,
    role VARCHAR(100) NOT NULL
);

CREATE TABLE Booking (
    booking_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES Customer(customer_id) ON DELETE CASCADE,
    room_id INT NOT NULL REFERENCES Room(room_id) ON DELETE CASCADE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    CHECK (start_date < end_date)
);

CREATE TABLE Renting (
    renting_id SERIAL PRIMARY KEY,
    booking_id INT REFERENCES Booking(booking_id) ON DELETE SET NULL,
    customer_id INT NOT NULL REFERENCES Customer(customer_id) ON DELETE CASCADE,
    room_id INT NOT NULL REFERENCES Room(room_id) ON DELETE CASCADE,
    employee_id INT NOT NULL REFERENCES Employee(employee_id) ON DELETE CASCADE,
    check_in_date DATE NOT NULL,
    check_out_date DATE,
    payment_status BOOLEAN DEFAULT FALSE
);
-- SQL Script to delete all 10 old records and insert 5 completely new employee records into emp_tbl

-- 1. Clear existing data and reseed Identity column
DELETE FROM emp_tbl;
DBCC CHECKIDENT ('emp_tbl', RESEED, 0);

-- 2. Insert 5 brand new employee records (None of the old 10 employees)
INSERT INTO emp_tbl (Name, Gender, Email, City, Address, Mobile, Image, Password) VALUES
('Harshil Dave', 'Male', 'harshil.dave@gmail.com', 'Ahmedabad', '12 Shivalik Business Park, Satellite', '9879512301', '~/images/emp1.jpg', '123'),
('Tanvi Desai', 'Female', 'tanvi.desai@gmail.com', 'Surat', '45 Riverfront Heights, Vesu', '9724185296', '~/images/emp2.jpg', '123'),
('Chirag Panchal', 'Male', 'chirag.panchal@gmail.com', 'Vadodara', '78 Sayaji Park Avenue, Akota', '9638527410', '~/images/emp3.jpg', '123'),
('Kavita Makwana', 'Female', 'kavita.makwana@gmail.com', 'Rajkot', '302 Crystal Mall Road, University Road', '9408162534', '~/images/emp4.jpg', '123'),
('Meet Bhatt', 'Male', 'meet.bhatt@gmail.com', 'Ahmedabad', '504 Iscon Platinum, Bopal', '9925041783', '~/images/emp5.jpg', '123');

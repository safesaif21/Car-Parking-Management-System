/*This entire code works perfectly on MS SQL Sercer*/

INSERT INTO Parking_Lot VALUES
(1),
(2);
INSERT INTO Parking_Block VALUES
(1,1),
(1,2),
(2,1);
INSERT INTO Parking_Stall VALUES
(1,1,1,'L'),
(1,1,2,'S'),
(1,1,3,'S'),
(1,1,4,'S'),
(1,1,5,'L'),
(1,2,1,'L'),
(1,2,2,'S'),
(1,2,3,'S'),
(1,2,4,'S'),
(1,2,5,'L'),
(2,1,1,'L'),
(2,1,2,'S'),
(2,1,3,'S'),
(2,1,4,'S'),
(2,1,5,'L');
INSERT INTO Customer_Vehicle VALUES
('SP640A','V743AB12345532E21','Honda Civic','Silver', 'S'),
('ABC123', 'A123BC4567891011','Toyota Corolla', 'White', 'S'),
('ER342W', 'B903DF7867291115', 'Tesla Model Y', 'Gray', 'L'),
('2RICH4U','Z1738KJ026741990', 'Maserati Ghibli', 'Red', 'S'),
('GENIAS','A5838PL026745590', 'Toyota Corolla', 'Red', 'S'),
('123456','F321AS0321345678', 'Hyundai Kona', 'White', 'L'),
('123ple','C512DK0267455903', 'Lamborghini', 'Yellow', 'S'),
('abcdef','O583DP0426745590', 'Nissan GT-R', 'Blue', 'S');
INSERT INTO Customer_Parks_In_Stall VALUES
(1,2,2,'SP640A'),
(1,1,1,'123456'),
(1,1,2,'123ple'),
(1,1,3,'abcdef'),
(1,1,4,'ABC123'),
(1,1,5,'ER342W'),
(2,1,5,'2RICH4U'),
(2,1,4,'GENIAS');
INSERT INTO Pass VALUES
(1000,40.00,'M','2023-02-13 10:47:00','2023-03-13 10:47:00','SP640A'),
(1001,5.00,'D','2023-02-17 20:38:00','2023-02-18 20:38:00','ABC123'),
(1002,40.00,'M','2023-03-01 11:11:00','2023-04-01 11:11:00','ER342W'),
(1003, 300, 'Y', '2022-12-30 09:12:20', '2022-12-30 09:12:20', 'abcdef');
INSERT INTO Receipt VALUES
(1000,1,'2023-02-13 10:47:32'),
(1001,2,'2023-02-17 20:38:10'),
(1002,3,'2023-03-01 11:11:11'),
(1003,4, '2022-12-30 09:12:20');
INSERT INTO Employee VALUES
(1,'Joe','Smith','joesmith223@gmail.com',17.00),
(2,'Dwight','Shrute','shrutemaster443gmail.com', 17.00);
INSERT INTO TICKET VALUES
(1,'Did not pay for pass', 120.00,'2022-12-03 13:04:03', '2023-01-03 13:04:03', 'abcdef', 1, 2, 2, 1, 4),
(2,'Did not pay for pass and is parked in the wrong sized stall',150.00,'2023-03-04 12:28:43','2023-04-04 12:28:43','2RICH4U',0,2,2,1,5),
(3,'Did not pay for pass', 120.00,'2023-03-04 12:30:03', '2023-04-04 12:30:03','GENIAS',1,2,2,1,4),
(4,'Parked in restricted area', 100.00, '2023-03-04 12:30:03', '2023-05-20 12:45:43','abcdef', 1, 2, 2, 1, 4);

SELECT * FROM Parking_Lot;
SELECT * FROM Parking_Block;
SELECT * FROM Parking_Stall;
SELECT * FROM customer_vehicle;
SELECT * FROM customer_parks_in_stall;
SELECT * FROM pass;
SELECT * FROM receipt;
SELECT * FROM employee;
SELECT * FROM ticket;
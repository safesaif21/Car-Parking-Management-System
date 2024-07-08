/* 1. Query displaying the PassId, Endtime, Vehicle Model and Colour for all vehicles that currently have a pass */
SELECT PassID, EndTime, Customer_Vehicle.Model, Customer_Vehicle.Colour
FROM Pass 
JOIN Customer_Vehicle ON Pass.LicensePlate = Customer_Vehicle.LicensePlate;

/* 2. Query updating the customer's license plate from its old one to its new one */
UPDATE Customer_Vehicle 
SET LicensePlate = 'SP640A'
WHERE LicensePlate = 'BE SAFE';

/* 3. Query showing all the tickets assigned by a specific employee */
SELECT E.FirstName, E.LastName, T.TicketID, T.LicensePlate, T.Reason, T.RecordedTime, T.FineAmount, T.Paid
FROM Ticket T, Employee E
WHERE T.EmployeeID = E.EmployeeID AND E.EmployeeID = 2;

/* 4. Query showing the number vacant stalls in parking lot with id 1 grouped by stall size */
SELECT COUNT(StallID) AS NumberOfVacantStalls, StallSize
FROM parking_Stall
WHERE ParkingLotID = 1 
  AND ParkingLotID != ANY (SELECT ParkingLotID FROM Customer_Parks_In_Stall)
  AND BlockID != ANY (SELECT BlockID FROM Customer_Parks_In_Stall)
  AND StallID != ANY (SELECT StallID FROM Customer_Parks_In_Stall)
GROUP BY StallSize;

/* 5. Query deleting a customer from the customer vehicle table if they have a pass and the system date is greater than the EndTime on their pass */
DELETE FROM Customer_Vehicle 
WHERE LicensePlate = ANY (SELECT LicensePlate 
                          FROM Pass 
                          WHERE SYSDATE() > EndTime);

/* 6. Query displaying the license plate of all customer cars who have not paid their ticket fees yet */
SELECT LicensePlate 
FROM Customer_Vehicle 
WHERE LicensePlate = (SELECT LicensePlate 
                      FROM Ticket 
                      WHERE Paid = 0);

/* 7. Query calculating the total amount of money owed from unpaid tickets */
SELECT SUM(FineAmount) AS AmountOwed
FROM Ticket
WHERE Paid = 0;

/* 8. Query calculating the total expected income to be made from Pass and ticket prices */
SELECT SUM(T.FineAmount) + SUM(P.Cost) AS ExpectedIncome
FROM Ticket T, Pass P;

/* 9. Query showing the licensePlate, stallSize, and VehicleSize of all cars currently parked in a stall */
SELECT DISTINCT Customer_Parks_In_Stall.LicensePlate, Parking_Stall.StallSize, Size
FROM Customer_Parks_In_Stall
JOIN Parking_Stall ON Parking_Stall.StallID = Customer_Parks_In_Stall.StallID
  AND Parking_Stall.BlockID = Customer_Parks_In_Stall.BlockID
  AND Parking_Stall.ParkingLotID = Customer_Parks_In_Stall.ParkingLotID
JOIN Customer_Vehicle ON Customer_Parks_In_Stall.LicensePlate = Customer_Vehicle.LicensePlate;

/* 10. Query updating the tickets paid attribute to true */
UPDATE Ticket 
SET PAID = 1
WHERE TicketID = 2;

/* 11. Query creating a view called CustomerOverView which displays relevant information a customer could inquire about */
CREATE VIEW CustomerOverView AS
SELECT C.LicensePlate, C.Model, P.TypeOfPass, R.PurchaseTime, P.EndTime, C.Size AS VehicleSize
FROM Customer_Vehicle C
JOIN Pass P ON C.LicensePlate = P.LicensePlate
JOIN Receipt R ON P.PassID = R.PassID;

SELECT * FROM CustomerOverView;

/* 12. Query creating a view called CustomerHasThreeOrMoreTickets which displays the license plate of a customer who has more than or equal to three tickets */
CREATE VIEW CustomerHasThreeOrMoreTickets AS
SELECT LicensePlate
FROM Ticket
GROUP BY LicensePlate
HAVING COUNT(LicensePlate) >= 3;

SELECT * FROM CustomerHasThreeOrMoreTickets;

/* 13. Query tripling the fees for the ticket payment when a ticket has not been paid before its due time */
UPDATE Ticket 
SET FineAmount = (FineAmount * 3)
WHERE Paid = 0 
  AND SYSDATE() > DueTime;

/* 14. Query creating a view called Transactions which helps to view relevant data regarding all pass transactions */
CREATE VIEW Transactions AS
SELECT Pass.PassID, Receipt.ReceiptID, Receipt.PurchaseTime, Pass.Cost
FROM Pass
JOIN Receipt ON Pass.PassID = Receipt.PassID;

SELECT * FROM Transactions;

/* 15. Query displaying the license plates of all customer vehicles that have monthly passes */
SELECT CV.LicensePlate
FROM Customer_Vehicle CV
JOIN Pass P ON CV.LicensePlate = P.LicensePlate 
WHERE P.TypeOfPass = 'M';

/* 16. Query displaying how many cars are parked in each parking block */
SELECT PS.ParkingLotID, PS.BlockID, COUNT(CPIS.LicensePlate) AS NumOfParkedCars, COUNT(PS.StallID) AS NumOfSpots
FROM Parking_Stall PS
JOIN Customer_Parks_In_Stall CPIS ON PS.ParkingLotID = CPIS.ParkingLotID 
  AND PS.BlockID = CPIS.BlockID 
  AND PS.StallID = CPIS.StallID
GROUP BY PS.ParkingLotID, PS.BlockID;

/* 17. Query showing the total number of parking stalls in each block */
SELECT ParkingLotID, BlockID, COUNT(StallID) AS TotalNumOfSpots
FROM Parking_Stall
GROUP BY ParkingLotID, BlockID;

/* 18. Query deleting tickets off database that's expiry date has been more than a month ago and has been paid */
DELETE FROM Ticket
WHERE DueTime < SYSDATE() - INTERVAL 30 DAY 
  AND PAID = 1;

/* 19. Query creating a view for Ministry of Transportation to view the relevant information needed */
CREATE VIEW UnpaidTickets AS
SELECT CV.LicensePlate, CV.VIN, CV.Model, CV.Colour, T.FineAmount, T.DueTime
FROM Customer_Vehicle CV
JOIN Ticket T ON CV.LicensePlate = T.LicensePlate
WHERE T.Paid = 0 
  AND SYSDATE() > T.DueTime;

SELECT * FROM UnpaidTickets;

/* 20. Query creating a view for customers to see who to contact */
CREATE VIEW ContactStaff AS 
SELECT FirstName, LastName, Email
FROM Employee;

SELECT * FROM ContactStaff;


/* 21. Query displaying ParkingLotID, BlockID */
SELECT ParkingLotID, BlockID
FROM Parking_Block;

/* 22. Query showing total number of parking stalls in each block */
SELECT ParkingLotID, BlockID, COUNT(StallID) AS TotalNumOfSpots
FROM Parking_Stall
GROUP BY ParkingLotID, BlockID;

/* 23. Query displaying all records from parking_stall table */
SELECT * FROM parking_stall;

/* 24. Query displaying all records from customer_parks_in_stall table */
SELECT * FROM customer_parks_in_stall;

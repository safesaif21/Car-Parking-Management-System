-- Everything works on MS SQL except for 'Bool' as there is no BOOL value in MSSQL but replaced with Tinyint
CREATE DATABASE CustomerVehicleDB;

CREATE TABLE Parking_Lot(
	ParkingLotID INT PRIMARY KEY
);
CREATE TABLE Parking_Block(

	ParkingLotID INT,
	BlockID INT,
    PRIMARY KEY (ParkingLotID, BlockID),
    FOREIGN KEY (ParkingLotID) REFERENCES Parking_Lot(ParkingLotID) ON DELETE CASCADE
);
CREATE TABLE Parking_Stall(

	ParkingLotID INT,
    BlockID INT,
    StallID INT,
    StallSize VARCHAR(1),
    PRIMARY KEY (ParkingLotID, BlockID, StallID),
    FOREIGN KEY (ParkingLotID, BlockID) REFERENCES Parking_Block(ParkingLotID, BlockID) ON DELETE CASCADE
);
CREATE TABLE Customer_Vehicle(

	LicensePlate VARCHAR(7) PRIMARY KEY,
    VIN CHAR(17) UNIQUE,
    Model VARCHAR(30),
    Colour VARCHAR(30),
    Size Char(1)
);
CREATE TABLE Customer_Parks_In_Stall(

	ParkingLotID INT,
    BlockID INT,
    StallID INT,
    LicensePlate VARCHAR(7),
    PRIMARY KEY(ParkingLotID,BlockID,StallID,LicensePlate),
    FOREIGN KEY (ParkingLotID,BlockID,StallID) REFERENCES Parking_Stall(ParkingLotID,BlockID,StallID) ON DELETE CASCADE,
    FOREIGN KEY (LicensePlate) REFERENCES Customer_Vehicle(LicensePlate) ON DELETE CASCADE
);
CREATE TABLE Pass(
	
    PassID INT PRIMARY KEY,
    Cost NUMERIC(5,2),
    typeOfPass CHAR,
    startTime DATETIME,
    endTime DATETIME,
    LicensePlate VARCHAR(7),
    FOREIGN KEY (LicensePlate) REFERENCES Customer_Vehicle(LicensePlate) ON DELETE CASCADE
);
CREATE TABLE Receipt(
	
    PassID INT,
    ReceiptID INT UNIQUE,
    PurchaseTime DATETIME,
	PRIMARY KEY (PassID, ReceiptID),
    FOREIGN KEY (PassID) REFERENCES Pass(PassID) ON DELETE CASCADE
);
CREATE TABLE Employee(
	
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(30),
    LastName VARCHAR(30),
	Email VARCHAR(100),
	Salary NUMERIC(4,2)
);
CREATE TABLE Ticket(

	TicketID INT PRIMARY KEY,
    Reason VARCHAR(250),
    FineAmount NUMERIC(5,2),
    RecordedTime DATETIME,
    DueTime DATETIME,
    LicensePlate VARCHAR(7),
    Paid TINYINT,
    EmployeeID INT,
    ParkingLotID INT,
    BlockID INT,
    StallID INT,
    FOREIGN KEY (LicensePlate) REFERENCES Customer_Vehicle(LicensePlate) ON DELETE CASCADE,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID) ON DELETE CASCADE,
    FOREIGN KEY (ParkingLotID,BlockID,StallID) REFERENCES Parking_Stall(ParkingLotID,BlockID,StallID) ON DELETE CASCADE
);
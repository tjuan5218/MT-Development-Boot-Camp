DROP TABLE IF EXISTS 
    GuestClasses,
    Classes,
    RoomStays,
    Rooms,
    SupplyServiceSales,
    Guests,
    GuestStatus,
    TavernServices,
    ServiceStatus,
    Services,
    SupplyOrder,
    SupplyInventory,
    Supplies,
    BasementRats,
    Taverns,
    Locations,
    UserRoles,
    Users,
    Roles
;
    
/* Tables based on first example schema shown in class */

CREATE TABLE Roles (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50),
    Description VARCHAR(200)
);

INSERT INTO Roles VALUES 
    ('Owner', 'owner of tavern'),
    ('Stranger', 'stranger that visited tavern'),
    ('Drunk', 'town drunk'),
    ('Regular', 'regular attendee of tavern'),
    ('Bartender' , 'bartender of tavern')
;


CREATE TABLE Users (
    ID INT IDENTITY(1,1),
    Name VARCHAR(50),
    Birthday DATE,
);

ALTER TABLE Users ADD PRIMARY KEY (ID);

INSERT INTO Users VALUES 
    ('Moe', '1999-01-01'),
    ('Monroe', '1999-08-24'),
    ('Marry', '1999-07-25'),
    ('Monty', '1974-11-22'),
    ('Morty', '2000-10-08')
;


CREATE TABLE UserRoles (
    ID INT IDENTITY(1,1),
    UserID INT,
    RoleID INT
);

ALTER TABLE UserRoles ADD 
    PRIMARY KEY (ID),
    FOREIGN KEY (UserID) REFERENCES Users(ID),
    FOREIGN KEY (RoleID) REFERENCES Roles(ID)
;

INSERT INTO UserRoles VALUES 
    (1,1),
    (2,2),
    (3,3),
    (4,4),
    (5,5)
;


CREATE TABLE Locations (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100)
);

INSERT INTO Locations VALUES 
    ('Medford, NJ'),
    ('Marlton, NJ'),
    ('Trenton, NJ'),
    ('Union, NJ'),
    ('Atlantic City, NJ')
;


CREATE TABLE Taverns (
    ID INT IDENTITY(1,1),
    Name VARCHAR(100),
    FloorCount INT,
    OwnerID INT,
    LocationID INT
);

ALTER TABLE Taverns ADD 
    PRIMARY KEY (ID),
    FOREIGN KEY (OwnerID) REFERENCES Users(ID),
    FOREIGN KEY (LocationID) REFERENCES Locations(ID)
;

INSERT INTO Taverns VALUES 
    ('Moe''s Tavern', 2, 1, 1),
    ('Moe''s Tavern', 2, 1, 2),
    ('Moe''s Tavern', 2, 1, 3),
    ('Moe''s Tavern', 2, 1, 4),
    ('Moe''s Tavern', 2, 1, 5)
;


CREATE TABLE BasementRats (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50),
    TavernID INT FOREIGN KEY REFERENCES Taverns(ID)
);

INSERT INTO BasementRats VALUES 
    ('Barry', 1),
    ('Murray', 2),
    ('Harry', 3),
    ('Alice', 4),
    ('Marry', 5),
    ('Barry', 5),
    ('Murray', 4),
    ('Harry', 1),
    ('Alice', 2),
    ('Marry', 3)
;


/* Types of supplies with name and unit */
CREATE TABLE Supplies (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50),
    Unit VARCHAR(50)
);

INSERT INTO Supplies VALUES 
    ('Strong Ale', 'Ounce'),
    ('Bread', 'Loaf'),
    ('Cheese', 'Wheel'),
    ('Cheese', 'Slice'),
    ('Pie', 'Slice')
;


/* Current supply inventory for all taverns linked by supply and tavern ID */
CREATE TABLE SupplyInventory (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    SupplyID INT FOREIGN KEY REFERENCES Supplies(ID),
    TavernID INT FOREIGN KEY REFERENCES Taverns(ID),
    Amount INT,
    UpdateDate DATE
);

INSERT INTO SupplyInventory VALUES 
    (1,1, 3, '2022-02-22'),
    (1,2, 3, '2022-02-22'),
    (1,3, 3, '2022-02-22'),
    (1,4, 3, '2022-02-22'),
    (1,5, 3, '2022-02-22'),
    (2,1, 3, '2022-02-22'),
    (2,2, 3, '2022-02-22'),
    (2,3, 3, '2022-02-22'),
    (2,4, 3, '2022-02-22'),
    (2,5, 3, '2022-02-22')
;

/* Supply orders for all taverns linked by supply and tavern ID */
CREATE TABLE SupplyOrder (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    SupplyID INT FOREIGN KEY REFERENCES Supplies(ID),
    TavernID INT FOREIGN KEY REFERENCES Taverns(ID),
    Cost DECIMAL(5,2),
    Amount INT,
    OrderDate DATE
);

INSERT INTO SupplyOrder VALUES 
    (1,2,19.5, 3, '2022-02-22'),
    (2,2,19.5, 3, '2022-02-22'),
    (3,2,19.5, 3, '2022-02-22'),
    (4,2,19.5, 3, '2022-02-22'),
    (5,2,19.5, 3, '2022-02-22'),
    (1,2,19.5, 3, '2022-02-22'),
    (2,2,19.5, 3, '2022-02-22'),
    (3,2,19.5, 3, '2022-02-22'),
    (4,2,19.5, 3, '2022-02-22'),
    (5,2,19.5, 3, '2022-02-22')
;


/* Types of services */
CREATE TABLE Services (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50)
);

INSERT INTO Services VALUES 
    ('Food'),
    ('Drink'),
    ('Inn'),
    ('Entertainment'),
    ('Stables')
;

/* Types of service status */
CREATE TABLE ServiceStatus (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50)
);

INSERT INTO ServiceStatus VALUES 
    ('Active'),
    ('Inactive'),
    ('Out of Stock'),
    ('Discontinued'),
    ('Out of Season'),
    ('Vacant'),
    ('Being Cleaned')
;


/* Services offered by all taverns linked by service, tavern, and status
   ID */
CREATE TABLE TavernServices (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    ServiceID INT FOREIGN KEY REFERENCES Services(ID),
    TavernID INT FOREIGN KEY REFERENCES Taverns(ID),
    StatusID INT FOREIGN KEY REFERENCES ServiceStatus(ID)
);

INSERT INTO TavernServices VALUES 
    (1, 1, 1),
    (1, 2, 1),
    (1, 3, 1),
    (1, 4, 1),
    (1, 5, 1)
;

/* Types of statuses that a guest can have. One per guest */
CREATE TABLE GuestStatus (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50)
);

INSERT INTO GuestStatus VALUES
    ('Healthy'),
    ('Sick'),
    ('Hungry'),
    ('Thirsty'),
    ('Poisoned'),
    ('Drunk')
;

/* Guests that have attended any of the taverns in system. */
CREATE TABLE Guests (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50),
    Birthday DATE,
    Cakeday DATE,
    Status INT FOREIGN KEY REFERENCES GuestStatus(ID)
);

INSERT INTO Guests VALUES 
    ('Tommy', '2022-02-28', '2022-02-28', 6),
    ('Tommy', '2022-02-27', '2022-02-27', 6),
    ('Rick', '2022-02-28', '2022-02-28', 6),
    ('Harry', '2022-02-28', '2022-02-28', 6),
    ('Dawn', '2022-02-28', '2022-02-28', 6),
    ('Dorothy', '2022-02-28', '2022-02-28', 6),
    ('Sarah', '1999-12-26', '2022-02-28', 1)
;

/* Supply or service sales linked with the relevant supply or service, tavern,
   and guest with also the sale date, amount sold, and total cost*/
CREATE TABLE SupplyServiceSales(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    SupplyID INT FOREIGN KEY REFERENCES Supplies(ID),
    ServiceID INT FOREIGN KEY REFERENCES Services(ID),
    TavernID INT FOREIGN KEY REFERENCES Taverns(ID),
    GuestID INT FOREIGN KEY REFERENCES Guests(ID),
    SaleDate DATE,
    Amount INT,
    Cost DECIMAL (7,2)
);

INSERT INTO SupplyServiceSales VALUES 
    (NULL, 1, 1, 2, '2022-02-22', 5, 10),
    (NULL, 1, 2, 2, '2022-02-22', 5, 10),
    (NULL, 1, 3, 2, '2022-02-22', 5, 10),
    (NULL, 1, 4, 2, '2022-02-22', 5, 10),
    (NULL, 1, 5, 2, '2022-02-22', 5, 10),
    (1, NULL, 1, 1, '2022-02-28', 3, 6),
    (1, NULL, 1, 2, '2022-02-28', 3, 6),
    (1, NULL, 1, 3, '2022-02-28', 3, 6),
    (1, NULL, 1, 4, '2022-02-28', 3, 6),
    (1, NULL, 1, 5, '2022-02-28', 3, 6),
    (NULL, 3, 1, 6, '2022-03-02', 1, 110),
    (NULL, 3, 2, 5, '2022-03-02', 1, 90),
    (NULL, 3, 3, 4, '2022-03-02', 1, 80),
    (NULL, 3, 4, 3, '2022-03-02', 1, 80),
    (NULL, 3, 5, 2, '2022-03-02', 1, 70)
;

/* Tavern Rooms linked with a service status and tavern */
CREATE TABLE Rooms (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Status INT FOREIGN KEY REFERENCES ServiceStatus(ID),
    TavernID INT FOREIGN KEY REFERENCES Taverns(ID)
);

INSERT INTO Rooms VALUES
    (6,1),
    (6,2),
    (6,3),
    (6,4),
    (6,5)
;

/* Room Stays linked with the relevant sale, room, and guest as well as the
   nightly rate and reservation date */
CREATE TABLE RoomStays (
    ID INT IDENTITY (1,1) PRIMARY KEY,
    SaleID INT FOREIGN KEY REFERENCES SupplyServiceSales(ID),
    RoomID INT FOREIGN KEY REFERENCES Rooms(ID),
    GuestID INT FOREIGN KEY REFERENCES Guests(ID),
    Rate DECIMAL (7,2),
    ResDate DATE
);


INSERT INTO RoomStays VALUES 
    (11, 1, 6, 110.00, '2022-03-02'),
    (12, 2, 5, 90, '2022-03-02'),
    (13, 3, 4, 80, '2022-03-02'),
    (14, 4, 3, 80, '2022-03-02'),
    (15, 5, 2, 70, '2022-03-02')
;

/* Types of classes that a guest can be. Can be multiple for a single guest */
CREATE TABLE Classes (
    ID INT IDENTITY (1,1) PRIMARY KEY,
    Name VARCHAR(50)
);

INSERT INTO Classes VALUES
    ('Fighter'),
    ('Archer'),
    ('Healer'),
    ('Mage'),
    ('Rogue')
;


/* Linking table for the classes of all guests */
CREATE TABLE GuestClasses (
    GuestID INT FOREIGN KEY REFERENCES Guests(ID),
    ClassID INT FOREIGN KEY REFERENCES Classes(ID),
    Level INT
);

INSERT INTO GuestClasses VALUES
    (1, 1, 1),
    (2, 2, 1),
    (3, 3, 1),
    (4, 4, 1),
    (5, 5, 11)
;

DROP TABLE IF EXISTS BasementRats;

/* Faulty insertions to demonstrate constraints
INSERT INTO GuestClasses VALUES (1, 6, 1);
INSERT INTO Guests VALUES ('Joey', '2022-02-28', '2022-02-28', 7);
INSERT INTO TavernServices VALUES (1, 100, 1);
INSERT INTO SupplyOrder VALUES (10, 1, 19.5, 3, '2022-02-28');
INSERT INTO Taverns VALUES ('Big Al''s', 1, 10, 1);
*/

/* Assignment 3 queries */
SELECT * FROM Guests WHERE Birthday < '2000-01-01'

SELECT * FROM RoomStays WHERE Rate > 100.00

SELECT DISTINCT [Name] FROM Guests

SELECT * FROM Guests Order BY [Name] ASC

SELECT TOP 10 * FROM SupplyServiceSales ORDER BY Cost DESC

SELECT * FROM Classes 
    UNION 
SELECT * FROM GuestStatus 
    UNION 
SELECT * FROM ServiceStatus
    UNION 
SELECT * FROM Services 
    UNION 
SELECT * FROM Locations

SELECT GuestID, ClassID, Level,
    CASE 
        WHEN [Level] <= 10 THEN 'Lvl 1-10'
        WHEN [Level] <= 20 THEN 'Lvl 11-20'
    END AS 'Level Grouping'
FROM GuestClasses 
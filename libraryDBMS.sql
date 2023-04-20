create database LibraryDBMS;
use LibraryDBMS;

CREATE TABLE Branch (
  branchID INT NOT NULL UNIQUE KEY AUTO_INCREMENT,
  address VARCHAR(255) NOT NULL,
  openHour TIME NOT NULL,
  closeHour TIME NOT NULL,
  openD ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday') NOT NULL,
  adminID INT NOT NULL UNIQUE,
  PRIMARY KEY (branchID)
);

CREATE TABLE Admin (
  adminID INT NOT NULL UNIQUE KEY AUTO_INCREMENT,
  title VARCHAR(10) NOT NULL,
  lName VARCHAR(50) NOT NULL,
  fName VARCHAR(50) NOT NULL,
  age INT NOT NULL,
  sex ENUM('M', 'F') NOT NULL,
  email VARCHAR(255) NOT NULL,
  branchID INT NOT NULL,
  PRIMARY KEY (adminID),
  FOREIGN KEY (branchID) REFERENCES Branch(branchID)
);

CREATE TABLE Staff (
  staffID INT NOT NULL UNIQUE KEY AUTO_INCREMENT,
  title VARCHAR(10) NOT NULL,
  lName VARCHAR(50) NOT NULL,
  fName VARCHAR(50) NOT NULL,
  age INT NOT NULL,
  sex ENUM('M', 'F') NOT NULL,
  email VARCHAR(255) NOT NULL,
  branchID INT NOT NULL,
  PRIMARY KEY (staffID),
  FOREIGN KEY (branchID) REFERENCES Branch(branchID)
);

CREATE TABLE Member (
  memberID INT NOT NULL UNIQUE KEY AUTO_INCREMENT,
  lName VARCHAR(50) NOT NULL,
  fName VARCHAR(50) NOT NULL,
  age INT NOT NULL,
  sex ENUM('M', 'F') NOT NULL,
  DOB DATE NOT NULL,
  email VARCHAR(255) NOT NULL,
  status BOOLEAN NOT NULL,
  hold BOOLEAN NOT NULL,
  PRIMARY KEY (memberID)
);

CREATE TABLE Book (
  isbn VARCHAR(13) NOT NULL UNIQUE,
  genre VARCHAR(50) NOT NULL,
  title VARCHAR(255) NOT NULL,
  branchID INT NOT NULL,
  status ENUM('Available', 'On Loan', 'Lost') NOT NULL,
  publishBy VARCHAR(255) NOT NULL,
  language VARCHAR(50) NOT NULL,
  shelf VARCHAR(50) NOT NULL,
  PRIMARY KEY (isbn),
  FOREIGN KEY (branchID) REFERENCES Branch(branchID)
);

CREATE TABLE Request (
  requestID INT NOT NULL UNIQUE KEY AUTO_INCREMENT,
  memberID INT NOT NULL,
  status ENUM('Pending', 'Approved', 'Denied') NOT NULL,
  staffID INT NOT NULL,
  date DATE NOT NULL,
  time TIME NOT NULL,
  branchID INT NOT NULL,
  PRIMARY KEY (requestID),
  FOREIGN KEY (memberID) REFERENCES Member(memberID),
  FOREIGN KEY (staffID) REFERENCES Staff(staffID),
  FOREIGN KEY (branchID) REFERENCES Branch(branchID)
);

CREATE TABLE Register (
  username VARCHAR(50) NOT NULL,
  password VARCHAR(50) NOT NULL,
  staffID INT NOT NULL,
  memberID INT NOT NULL,
  PRIMARY KEY (username),
  FOREIGN KEY (staffID) REFERENCES Staff(staffID),
  FOREIGN KEY (memberID) REFERENCES Member(memberID)
);

CREATE TABLE `Order` (
  orderID INT NOT NULL UNIQUE KEY AUTO_INCREMENT,
  requestID INT NOT NULL,
  borrowDate DATE NOT NULL,
  returnDate DATE NOT NULL,
  status ENUM('Pending', 'Active', 'Returned') NOT NULL,
  dueDate DATE NOT NULL,
  accuredFine DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (orderID),
  FOREIGN KEY (requestID) REFERENCES Request(requestID)
);

CREATE TABLE WrittenBy (
  isbn VARCHAR(13) NOT NULL,
  authorID INT NOT NULL,
  PRIMARY KEY (isbn, authorID),
  FOREIGN KEY (isbn) REFERENCES Book(isbn),
  FOREIGN KEY (authorID) REFERENCES Author(authorID)
);

CREATE TABLE Author (
  authorID INT PRIMARY KEY AUTO_INCREMENT,
  lName VARCHAR(255) NOT NULL,
  fName VARCHAR(255) NOT NULL
);

INSERT INTO Branch (branchID, address, openHour, closeHour, openD, adminID)
VALUES 
  (1, '123 Main St, Anytown, USA', '09:00:00', '17:00:00', 'Monday', 1),
  (2, '456 Oak Ave, Anytown, USA', '10:00:00', '18:00:00', 'Tuesday', 2),
  (3, '789 Elm Blvd, Anytown, USA', '11:00:00', '19:00:00', 'Wednesday', 3),
  (4, '1010 Pine Rd, Anytown, USA', '12:00:00', '20:00:00', 'Thursday', 4),
  (5, '1111 Maple Dr, Anytown, USA', '13:00:00', '21:00:00', 'Friday', 5);

INSERT INTO Admin (adminID, title, lName, fName, age, sex, email, branchID)
VALUES 
  (1, 'Ms.', 'Johnson', 'Jessica', 35, 'F', 'jessica.johnson@library.com', 1),
  (2, 'Mr.', 'Smith', 'John', 40, 'M', 'john.smith@library.com', 2),
  (3, 'Ms.', 'Garcia', 'Maria', 30, 'F', 'maria.garcia@library.com', 3),
  (4, 'Mr.', 'Brown', 'David', 45, 'M', 'david.brown@library.com', 4),
  (5, 'Ms.', 'Taylor', 'Emily', 25, 'F', 'emily.taylor@library.com', 5);

INSERT INTO Staff (staffID, title, lName, fName, age, sex, email, branchID)
VALUES 
  (1, 'Mr.', 'Lee', 'James', 25, 'M', 'james.lee@library.com', 1),
  (2, 'Ms.', 'Wang', 'Linda', 30, 'F', 'linda.wang@library.com', 2),
  (3, 'Mr.', 'Kim', 'David', 35, 'M', 'david.kim@library.com', 3),
  (4, 'Ms.', 'Chen', 'Sophie', 40, 'F', 'sophie.chen@library.com', 4),
  (5, 'Mr.', 'Liu', 'Michael', 45, 'M', 'michael.liu@library.com', 5);
  
  -- Insert data for Member table
INSERT INTO Member (memberID, lName, fName, age, sex, DOB, email, status, hold)
VALUES
  (1, 'Smith', 'John', 25, 'M', '1998-01-15', 'johnsmith@email.com', 1, 0),
  (2, 'Doe', 'Jane', 30, 'F', '1993-04-19', 'janedoe@email.com', 1, 0),
  (3, 'Williams', 'James', 42, 'M', '1981-07-27', 'jameswilliams@email.com', 0, 0),
  (4, 'Brown', 'Mary', 19, 'F', '2004-12-03', 'marybrown@email.com', 1, 1),
  (5, 'Garcia', 'Carlos', 55, 'M', '1968-11-01', 'carlosgarcia@email.com', 1, 0),
  (6, 'Chen', 'Samantha', 23, 'F', '1998-09-08', 'samanthachen@email.com', 0, 1),
  (7, 'Lee', 'David', 37, 'M', '1986-03-12', 'davidlee@email.com', 1, 0),
  (8, 'Nguyen', 'Thi', 28, 'F', '1995-06-25', 'thinguyen@email.com', 1, 0),
  (9, 'Gupta', 'Raj', 50, 'M', '1973-12-22', 'rajgupta@email.com', 0, 1),
  (10, 'Wang', 'Wei', 31, 'M', '1990-05-02', 'weiwang@email.com', 1, 1);

INSERT INTO Request (requestID, memberID, status, staffID, date, time, branchID) 
VALUES 
(1, 1, 'Pending', 1, '2023-04-19', '09:00:00', 1),
(2, 2, 'Approved', 2, '2023-04-18', '12:30:00', 2),
(3, 3, 'Denied', 3, '2023-04-17', '16:45:00', 3),
(4, 4, 'Pending', 4, '2023-04-16', '10:15:00', 4),
(5, 5, 'Approved', 5, '2023-04-15', '14:00:00', 5),
(6, 6, 'Pending', 1, '2023-04-14', '11:30:00', 1),
(7, 7, 'Denied', 2, '2023-04-13', '17:00:00', 2),
(8, 8, 'Approved', 3, '2023-04-12', '15:30:00', 3);

INSERT INTO Book (isbn, genre, title, branchID, status, publishBy, language, shelf)
VALUES 
('9781408894705', 'Fiction', 'The Testaments', 1, 'Available', 'Nan A. Talese', 'English', 'Fiction A-Z'),
('9780316341686', 'Fiction', 'The Girl Who Takes an Eye for an Eye', 2, 'On Loan', 'Alfred A. Knopf', 'English', 'Mystery & Thriller'),
('9780063021909', 'Fiction', 'The Midnight Library', 3, 'Available', 'Viking', 'English', 'Fiction A-Z'),
('9780743273565', 'Non-fiction', 'The Power of Now: A Guide to Spiritual Enlightenment', 4, 'Available', 'New World Library', 'English', 'Self-help'),
('9780767908184', 'Non-fiction', 'Blink: The Power of Thinking Without Thinking', 5, 'On Loan', 'Little, Brown and Company', 'English', 'Business & Economics');

-- Inserting data for the WrittenBy table
INSERT INTO WrittenBy (isbn, authorID) VALUES
('9781408894705', 1),
('9780316341686', 2),
('9780063021909', 3),
('9780743273565', 4),
('9780767908184', 5);



  



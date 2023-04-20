create database LibraryDBMS;
use LibraryDBMS;

CREATE TABLE Branch (
  branchID INT NOT NULL UNIQUE KEY AUTO_INCREMENT,
  address VARCHAR(255) NOT NULL,
  openHour TIME NOT NULL,
  closeHour TIME NOT NULL,
  openDay TEXT NOT NULL,
  PRIMARY KEY (branchID)
);

CREATE TABLE Admin (
  adminID INT NOT NULL UNIQUE KEY AUTO_INCREMENT,
  title VARCHAR(50) NOT NULL,
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
  title VARCHAR(50) NOT NULL,
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
  status ENUM('Active', 'Expired') NOT NULL,
  hold BOOLEAN NOT NULL,
  PRIMARY KEY (memberID)
);

CREATE TABLE Book (
  isbn VARCHAR(13) NOT NULL UNIQUE,
  genre VARCHAR(50) NOT NULL,
  title VARCHAR(255) NOT NULL,
  branchID INT NOT NULL,
  status ENUM('Available', 'On Loan', 'Lost') NOT NULL,
  publishedBy VARCHAR(255) NOT NULL,
  language VARCHAR(50) NOT NULL,
  shelf VARCHAR(50) NOT NULL,
  PRIMARY KEY (isbn),
  FOREIGN KEY (branchID) REFERENCES Branch(branchID)
);

CREATE TABLE Author (
  authorID INT PRIMARY KEY AUTO_INCREMENT,
  lName VARCHAR(255) NOT NULL,
  fName VARCHAR(255) NOT NULL
);

CREATE TABLE WrittenBy (
  isbn VARCHAR(13) NOT NULL,
  authorID INT NOT NULL,
  PRIMARY KEY (isbn, authorID),
  FOREIGN KEY (isbn) REFERENCES Book(isbn),
  FOREIGN KEY (authorID) REFERENCES Author(authorID)
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
  username VARCHAR(255) NOT NULL,
  password VARCHAR(50) NOT NULL,
  staffID INT ,
  memberID INT,
  PRIMARY KEY (username),
  FOREIGN KEY (staffID) REFERENCES Staff(staffID),
  FOREIGN KEY (memberID) REFERENCES Member(memberID)
);

CREATE TABLE `Order` (
  orderID INT NOT NULL UNIQUE KEY AUTO_INCREMENT,
  requestID INT NOT NULL,
  borrowDate DATE NOT NULL,
  returnDate DATE NOT NULL,
  status ENUM('Pending', 'Active', 'Returned', 'Overdue') NOT NULL,
  dueDate DATE NOT NULL,
  accuredFine DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (orderID),
  FOREIGN KEY (requestID) REFERENCES Request(requestID)
);


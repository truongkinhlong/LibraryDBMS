
create database LibraryDBMS;
use LibraryDBMS;

CREATE TABLE Branch (
  branchID VARCHAR(4) NOT NULL UNIQUE KEY,
  address VARCHAR(255) NOT NULL,
  openHour TIME NOT NULL,
  closeHour TIME NOT NULL,
  openDay TEXT NOT NULL,
  PRIMARY KEY (branchID)
);

CREATE TABLE Admin (
  adminID VARCHAR(4) NOT NULL UNIQUE KEY,
  title VARCHAR(50) NOT NULL,
  lName VARCHAR(50) NOT NULL,
  fName VARCHAR(50) NOT NULL,
  age INT NOT NULL,
  sex ENUM('M', 'F') NOT NULL,
  email VARCHAR(255) NOT NULL,
  PRIMARY KEY (adminID)
);

CREATE TABLE Manage (
  adminID VARCHAR(4) NOT NULL UNIQUE KEY,
  branchID VARCHAR(4) NOT NULL,
  PRIMARY KEY (adminID),
  FOREIGN KEY (branchID) REFERENCES Branch(branchID)
  );
  
CREATE TABLE Staff (
  staffID VARCHAR(4) NOT NULL UNIQUE KEY,
  title VARCHAR(50) NOT NULL,
  lName VARCHAR(50) NOT NULL,
  fName VARCHAR(50) NOT NULL,
  age INT NOT NULL,
  sex ENUM('M', 'F') NOT NULL,
  email VARCHAR(255) NOT NULL,
  PRIMARY KEY (staffID)
);

CREATE TABLE Hiring (
  staffID VARCHAR(4) NOT NULL UNIQUE KEY,
  adminID VARCHAR(4)NOT NULL,
  PRIMARY KEY (staffID),
  FOREIGN KEY (adminID) REFERENCES Admin(adminID)
);

CREATE TABLE primaryBranch (
  staffID VARCHAR(4) NOT NULL UNIQUE KEY,
  branchID VARCHAR(4) NOT NULL,
  PRIMARY KEY (staffID),
  FOREIGN KEY (branchID) REFERENCES Branch(branchID)
);

CREATE TABLE Member (
  memberID VARCHAR(4) NOT NULL UNIQUE KEY,
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
  status ENUM('Available', 'On Loan', 'Lost') NOT NULL,
  publishedBy VARCHAR(255) NOT NULL,
  language VARCHAR(50) NOT NULL,
  shelf VARCHAR(50) NOT NULL,
  PRIMARY KEY (isbn)
);

CREATE TABLE Offer (
 isbn VARCHAR(13) NOT NULL UNIQUE,
 branchID VARCHAR(4) NOT NULL,
  PRIMARY KEY (isbn),
  FOREIGN KEY (branchID) REFERENCES Branch(branchID)
  );
  
CREATE TABLE Author (
  authorID VARCHAR(4) PRIMARY KEY,
  lName VARCHAR(255) NOT NULL,
  fName VARCHAR(255) NOT NULL
);
CREATE TABLE WrittenBy (
  isbn VARCHAR(13) NOT NULL,
  authorID VARCHAR(4) NOT NULL,
  PRIMARY KEY (isbn, authorID),
  FOREIGN KEY (isbn) REFERENCES Book(isbn),
  FOREIGN KEY (authorID) REFERENCES Author(authorID)
);
CREATE TABLE Request (
  requestID VARCHAR(4) NOT NULL UNIQUE KEY,
  memberID VARCHAR(4) NOT NULL,
  status ENUM('Pending', 'Approved', 'Denied') NOT NULL,
  staffID VARCHAR(4) NOT NULL,
  date DATE NOT NULL,
  time TIME NOT NULL,
  branchID VARCHAR(4) NOT NULL,
  PRIMARY KEY (requestID),
  FOREIGN KEY (memberID) REFERENCES Member(memberID),
  FOREIGN KEY (staffID) REFERENCES Staff(staffID),
  FOREIGN KEY (branchID) REFERENCES Branch(branchID)
);
CREATE TABLE Register (
  username VARCHAR(255) NOT NULL,
  password VARCHAR(50) NOT NULL,
  staffID VARCHAR(4) ,
  memberID VARCHAR(4),
  PRIMARY KEY (username),
  FOREIGN KEY (staffID) REFERENCES Staff(staffID),
  FOREIGN KEY (memberID) REFERENCES Member(memberID)
);
CREATE TABLE `Order` (
  orderID VARCHAR(4) NOT NULL UNIQUE KEY,
  requestID VARCHAR(4) NOT NULL,
  isbn VARCHAR(13) NOT NULL UNIQUE,
  borrowDate DATE NOT NULL,
  returnDate DATE NOT NULL,
  status ENUM('Pending', 'Active', 'Returned', 'Overdue') NOT NULL,
  dueDate DATE NOT NULL,
  accuredFine DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (orderID),
  FOREIGN KEY (requestID) REFERENCES Request(requestID),
  FOREIGN KEY (isbn) REFERENCES Book(isbn)
);
INSERT INTO Branch (branchID, address, openHour, closeHour, openDay)
VALUES 
('B01', '123 Main St, Houston, USA', '09:00:00', '17:00:00', 'Mon-Fri'),
('B02', '456 Oak Ave, Houston, USA', '10:00:00', '18:00:00', 'Mon-Sat'),
('B03', '789 Elm Blvd, Houston, USA', '11:00:00', '19:00:00', 'Mon-Sun'),
('B04', '1010 Pine Rd, Houston, USA', '12:00:00', '20:00:00', 'Tue-Sun'),
('B05', '1111 Maple Dr, Houston, USA', '13:00:00', '21:00:00', 'Mon-Thu');
  
INSERT INTO Admin (adminID, title, lName, fName, age, sex, email)
VALUES 
('Ad01', 'General Manager', 'Johnson', 'Jessica', 35, 'F', 'jessica.johnson@library.com'),
('Ad02', 'General Manager', 'Smith', 'John', 40, 'M', 'john.smith@library.com'),
('Ad03', 'Executive Manager', 'Garcia', 'Maria', 30, 'F', 'maria.garcia@library.com'),
('Ad04', 'IT Manager', 'Brown', 'David', 45, 'M', 'david.brown@library.com'),
('Ad05', 'Bracnhes Manager', 'Taylor', 'Emily', 25, 'F', 'emily.taylor@library.com'),
('Ad06', 'General Manager', 'Henderson', 'Tammie', 43, 'F', 'tammie.henderson@library.com'),
('Ad07', 'General Manager', 'Jordan', 'Morgan', 34, 'F', 'j.morgan@library.com'),
('Ad08', 'Order Manager', 'Gonzales', 'Zelly', 33, 'F', 'zelly.gonzales@library.com'),
('Ad09', 'IT Manager', 'Marvis', 'Kenneth', 29, 'M', 'ken.marvis@library.com'),
('Ad10', 'Relation Manager', 'Nguyen', 'Tommy', 37, 'M', 'tommy.nguyen@library.com');

INSERT INTO Manage (adminID, branchID)
VALUES 
('Ad01', 'B01'),
('Ad02', 'B02'),
('Ad03', 'B03'),
('Ad04', 'B04'),
('Ad05', 'B05'),
('Ad06', 'B04'),
('Ad07', 'B04'),
('Ad08', 'B01'),
('Ad09', 'B01'),
('Ad10', 'B01');

INSERT INTO Staff (staffID, title, lName, fName, age, sex, email)
VALUES
('S01', 'Floor Staff', 'Lee', 'James', 25, 'M', 'james.lee@library.com'),
('S02', 'IT Staff', 'Wang', 'Linda', 30, 'F', 'linda.wang@library.com'),
('S03', 'Warehouse Staff', 'Kim', 'David', 35, 'M', 'david.kim@library.com'),
('S04', 'Floor Staff', 'Chen', 'Sophie', 40, 'F', 'sophie.chen@library.com'),
('S05', 'IT Staff', 'Liu', 'Michael', 45, 'M', 'michael.liu@library.com'),
('S06', 'Warehouse Staff', 'Andir', 'Holland', 29, 'M', 'holland.andir@library.com'),
('S07', 'Floor Staff', 'Smith', 'Key', 29, 'M', 'smith.key@library.com'),
('S08', 'IT Staff', 'Keyes', 'Vincent', 30, 'M', 'vincent.keyes@library.com'),
('S09', 'Warehouse Staff', 'Collins', 'Kayla', 40, 'F', 'kayla.collins@library.com'),
('S10', 'Floor Staff', 'Le', 'Hong', 45, 'F', 'hong.le@library.com'),
('S11', 'It Staff', 'Huan', 'Tran', 37, 'M', 'huan.tran@library.com'),
('S12', 'Warehouse Staff', 'Willy', 'Linda', 30, 'F', 'linda.willy@library.com'),
('S13', 'Floor Staff', 'Nguyen', 'Tracy', 20, 'F', 'tracy.nguyen@library.com'),
('S14', 'Warehouse Staff', 'Chen', 'Alec', 40, 'F', 'alec.chen@library.com'),
('S15', 'IT Staff', 'Tran', 'Derik', 45, 'M', 'derik.tran@library.com');

INSERT INTO Hiring(staffID, adminID)
VALUES
('S01', 'Ad01'),
('S02', 'Ad06'),
('S03', 'Ad06'),
('S04', 'Ad07'),
('S05', 'Ad03'),
('S06', 'Ad01'),
('S07', 'Ad01'),
('S08', 'Ad07'),
('S09', 'Ad07'),
('S10', 'Ad06'),
('S11', 'Ad07'),
('S12', 'Ad07'),
('S13', 'Ad06'),
('S14', 'Ad01'),
('S15', 'Ad06');

INSERT INTO primaryBranch (staffID, branchID)
VALUES
('S01', 'B01'),
('S02', 'B01'),
('S03', 'B01'),
('S04', 'B02'),
('S05', 'B02'),
('S06', 'B02'),
('S07', 'B03'),
('S08', 'B03'),
('S09', 'B03'),
('S10', 'B04'),
('S11', 'B04',
('S12', 'B04'),
('S13', 'B05'),
('S14', 'B05'),
('S15', 'B05');

INSERT INTO Member (memberID, lName, fName, age, sex, DOB, email, status, hold)
VALUES
('M01', 'Smith', 'John', 25, 'M', '1998-01-15', 'johnsmith@email.com', 'Active', 0),
('M02', 'Doe', 'Jane', 30, 'F', '1993-04-19', 'janedoe@email.com', 'Expired', 0),
('M03', 'Williams', 'James', 42, 'M', '1981-07-27', 'jameswilliams@email.com', 'Active', 0),
('M04', 'Brown', 'Mary', 19, 'F', '2004-12-03', 'marybrown@email.com', 'Active', 0),
('M05', 'Garcia', 'Carlos', 55, 'M', '1968-11-01', 'carlosgarcia@email.com', 'Active', 0),
('M06', 'Chen', 'Samantha', 23, 'F', '1998-09-08', 'samanthachen@email.com', 'Active', 0),
('M07', 'Lee', 'David', 37, 'M', '1986-03-12', 'davidlee@email.com', 'Expired', 0),
('M08', 'Nguyen', 'Thi', 28, 'F', '1995-06-25', 'thinguyen@email.com', 'Active', 0),
('M09', 'Gupta', 'Raj', 50, 'M', '1973-12-22', 'rajgupta@email.com', 'Active', 0),
('M10', 'Wang', 'Wei', 31, 'M', '1990-05-02', 'weiwang@email.com', 'Active', 0),
('M11', 'Smith', 'Andy', 35, 'M', '1987-05-12', 'asmith@email.com', 'Active', 0),
('M12', 'Johnson', 'Emily', 22, 'F', '2000-03-23', 'ejohnson@email.com', 'Active', 1),
('M13', 'Brown', 'Michael', 45, 'M', '1976-01-18', 'mbrown@email.com', 'Active', 0),
('M14', 'Garcia', 'Isabella', 28, 'F', '1994-11-05', 'igarcia@email.com', 'Expired', 1),
('M15', 'Lee', 'Andy', 19, 'M', '2003-08-20', 'dlee@email.com', 'Active', 0),
('M16', 'Hall', 'Sarah', 52, 'F', '1969-06-30', 'shall@email.com', 'Active', 0),
('M17', 'Scott', 'Jessica', 31, 'F', '1990-12-01', 'jscott@email.com', 'Expired', 1),
('M18', 'Davis', 'Robert', 43, 'M', '1978-09-08', 'rdavis@email.com', 'Active', 0),
('M19', 'Nguyen', 'Kim', 26, 'F', '1995-04-17', 'knguyen@email.com', 'Active', 1),
('M20', 'Adams', 'James', 60, 'M', '1962-11-15', 'jadams@email.com', 'Expired', 0),
('M21', 'Wilson', 'Olivia', 37, 'F', '1986-02-28', 'owilson@email.com', 'Active', 1),
('M22', 'Parker', 'William', 48, 'M', '1973-08-12', 'wparker@email.com', 'Active', 0),
('M23', 'Allen', 'Sophia', 25, 'F', '1996-09-10', 'sallen@email.com', 'Expired', 1),
('M24', 'Jackson', 'Daniel', 29, 'M', '1992-03-06', 'djackson@email.com', 'Active', 0),
('M25', 'Wright', 'Ava', 23, 'F', '1998-05-25', 'awright@email.com', 'Active', 0),
('M26', 'Lewis', 'Ethan', 36, 'M', '1985-12-09', 'elewis@email.com', 'Expired', 1),
('M27', 'Robinson', 'Emma', 32, 'F', '1989-11-02', 'erobinson@email.com', 'Active', 0),
('M28', 'Walker', 'Noah', 30, 'M', '1991-07-14', 'nwalker@email.com', 'Active', 0);

INSERT INTO Book (isbn, genre, title, status, publishedBy, language, shelf)
VALUES 
('9781408894705', 'Fiction', 'The Testaments', 'Available', 'Random House', 'English', 'Fiction A-Z');

INSERT INTO Book (isbn, genre, title, status, publishedBy, language, shelf)
VALUES 
('9780316341686', 'Fiction', 'The Girl Who Takes an Eye for an Eye', 'On Loan', 'Hachette Book Group', 'English', 'Mystery & Thriller'),
('9780063021909', 'Fiction', 'The Midnight Library',  'Available', 'Viking', 'English', 'Fiction A-Z'),
('9780743273565', 'Non-fiction', 'The Power of Now: A Guide to Spiritual Enlightenment', 'Available', 'New World Library', 'English', 'Self-help'),
('9780767908184', 'Non-fiction', 'Blink: The Power of Thinking Without Thinking', 'On Loan', 'Little, Brown and Company', 'English', 'Business & Economics'),
('9780061120084', 'Fiction', 'To Kill A Mockingbird', 'On Loan', 'HarperCollins', 'English', 'Fiction'),
('9780451527741', 'Fiction', '1984', 'On Loan', 'Signet Classic', 'English', 'Fiction'),
('9780743273566', 'Fiction','The Great Gasby', 'Available', 'Scribner', 'English', 'Fiction'),
('9780141439518', 'Fiction','Pride and Prejudice', 'On Loan', 'Penguin Classics', 'English', 'Fiction'),
('9780316769488', 'Fiction','The Catcher in the Rye', 'Available', 'Back Bay Books', 'English', 'Fiction'),
('9780060883287', 'Fiction','One Hundred Years of Solitude', 'Available', 'Harper Perennial', 'English', 'Fiction'),
('9780547928210', 'Fantasy','The Hobbit', 'Available', 'Mariner Books', 'English', 'Fantasy'),
('9780544003415', 'Fantasy','The Lord of the Rings', 'Available', 'Mariner Books', 'English', 'Fantasy'),
('9780747532743', 'Fantasy','Harry Potter and the Philosophers Stone', 'Available', 'Bloomsbury Publishing', 'English', 'Fantasy'),
('9780307277671', 'Thriller','The Da Vinci Code', 'Available', 'Anchor Books', 'English', 'Thriller'),
('9780199216819', 'Evolutionary Biology','The Selfish Gene', 'Available', 'Oxford University Press', 'English', 'Science'),
('9780061231327', 'Physics/Cosmology','A Brief History of Time', 'Available', 'Bantam Books', 'English', 'Science'),
('9780226104034', 'History / Philosophy of Science','The Structure of Scientific Revolutions', 'Available', 'University of Chicago Press', 'English', 'Science'),
('9780231137108', 'Anthropology / Archaeology / History','Guns, Germs, and Steel', 'Available', 'W.W. Norton & Company', 'English', 'Science'),
('9780521186627', 'Neuroscience','Principles of Neural Science', 'Available', 'McGraw-Hill', 'English', 'Science'),
('9780805301020', 'Cell Biology','Molecular Biology of the Cell', 'Available', 'Garland Science', 'English', 'Science'),
('9780878939640', 'Evolutionary Biology','Evolution: The Story of Life', 'Available', 'Sinauer Associates', 'English', 'Science'),
('9780199699326', 'Criminology', 'The Oxford Handbook of Criminology', 'Available', 'Oxford University Press', 'English', 'Science'),
('9780387943804', 'Physics', 'The Feynman Lectures on Physics', 'Available', 'Addison-Wesley', 'English', 'Science'),
('9789810230318', 'Physics / Cosmology / String Theory', 'The Elegant Universe: Superstrings, Hidden...', 'Available', 'W.W. Norton & Company', 'English', 'Science');


INSERT INTO Offer (isbn, branchID)
VALUES 
('9781408894705', 'B01'),
('9780316341686', 'B02'),
('9780063021909', 'B03'),
('9780743273565', 'B04'),
('9780767908184', 'B05'),
('9780061120084', 'B01'),
('9780451527741', 'B01'),
('9780743273566', 'B03'),
('9780141439518', 'B04'),
('9780316769488', 'B05'),
('9780060883287', 'B01'),
('9780547928210', 'B02'),
('9780544003415', 'B02'),
('9780747532743', 'B02'),
('9780307277671', 'B05'),
('9780199216819', 'B03'),
('9780061231327', 'B03'),
('9780226104034', 'B02'),
('9780231137108', 'B04'),
('9780521186627', 'B05'),
('9780805301020', 'B01'),
('9780878939640', 'B02'),
('9780199699326', 'B02'),
('9780387943804', 'B02'),
('9789810230318', 'B05');

INSERT INTO WrittenBy (isbn, authorID) 
VALUES
('9780060883287', 'A01'),
('9780061120084', 'A02'),
('9780061231327', 'A03'),
('9780063021909', 'A04'),
('9780141439518', 'A05'),
('9780199216819', 'A06'),
('9780199699326', 'A07'),
('9780226104034', 'A08'),
('9780231137108', 'A09'),
('9780307277671', 'A10'),
('9780316341686', 'A11'),
('9780316769488', 'A12'),
('9780387943804', 'A13'),
('9780451527741', 'A14'),
('9780521186627', 'A15'),
('9780544003415', 'A16'),
('9780547928210', 'A17'),
('9780743273565', 'A18'),
('9780743273566', 'A19'),
('9780747532743', 'A20'),
('9780767908184', 'A21'),
('9780805301020', 'A22'),
('9780878939640', 'A23'),
('9781408894705', 'A24'),
('9789810230318', 'A25');

INSERT INTO Author (authorID, lName, fName)
VALUES 
  ('A01', 'García Márquez', 'Gabriel'),
  ('A02', 'Lee', 'Harper'),
  ('A03', 'Hawking', 'Stephen'),
  ('A04', 'Haig', 'Matt'),
  ('A05', 'Austen', 'Jane'),
  ('A06', 'Dawkins', 'Richard'),
  ('A07', 'Maguire', 'Mike'),
  ('A08', 'Kuhn', 'Thomas S.'),
  ('A09', 'Diamond', 'Jared'),
  ('A10', 'Brown', 'Dan'),
  ('A11', 'Lagercrantz', 'David'),
  ('A12', 'Salinger', 'J.D.'),
  ('A13', 'Feynman', 'Richard P.'),
  ('A14', 'Orwell', 'George'),
  ('A15', 'Kandel', 'Eric R.'),
  ('A16', 'Tolkien', 'J.R.R.'),
  ('A17', 'Tolkien', 'J.R.R.'),
  ('A18', 'Tolle', 'Eckhart'),
  ('A19', 'Fitzgerald', 'F. Scott'),
  ('A20', 'Rowling', 'J.K.'),
  ('A21', 'Gladwell', 'Malcolm'),
  ('A22', 'Alberts', 'Bruce'),
  ('A23', 'Douglas Palmer', 'Douglas'),
  ('A24', 'Atwood', 'Margaret'),
  ('A25', 'Greene', 'Brian');
  
INSERT INTO Register (username, password, staffID, memberID)
VALUES
('J.Lee.25', 'StaffJames25', 'S01', NULL),
('L.Wang.30', 'StaffLinda30', 'S02', NULL),
('D.Kim.35', 'StaffDavid35', 'S03', NULL),
('S.Chen.40', 'StaffSophie40', 'S04', NULL),
('M.Liu.45', 'StaffMichael45', 'S05', NULL),
('H.Andir.29', 'StaffHolland29', 'S06', NULL),
('K.Smith.29', 'StaffKey29', 'S07', NULL),
('V.Keyes.30', 'StaffVincent30', 'S08', NULL),
('K.Collins.40', 'StaffKayla40', 'S09', NULL),
('H.Le.45', 'StaffHong45', 'S10', NULL),
('T.Huan.37', 'StaffTran37', 'S11', NULL),
('L.Willy.30', 'StaffLinda30', 'S12', NULL),
('T.Nguyen.20', 'StaffTracy20', 'S13', NULL),
('A.Chen.40', 'StaffAlec40', 'S14', NULL),
('D.Tran.45', 'StaffDerik45', 'S15', NULL),
('Smith.John.123', 'MemberJohn25', NULL, 'M01'),
('Doe.Jane.456', 'MemberJane30', NULL, 'M02'),
('Williams.James.789', 'MemberJames42', NULL, 'M03'),
('Brown.Mary.234', 'MemberMary19', NULL, 'M04'),
('Garcia.Carlos.567', 'MemberCarlos55', NULL, 'M05'),
('Chen.Samantha.890', 'MemberSamantha23', NULL, 'M06'),
('Lee.David.123', 'MemberDavid37', NULL, 'M07'),
('Nguyen.Thi.456', 'MemberThi28', NULL, 'M08'),
('Gupta.Raj.789', 'MemberRaj50', NULL, 'M09'),
('Wang.Wei.234', 'MemberWei31', NULL, 'M10'),
('Smith.Andy.567', 'MemberAndy35', NULL, 'M11'),
('Johnson.Emily.890', 'MemberEmily22', NULL, 'M12'),
('Brown.Michael.123', 'MemberMichael45', NULL, 'M13'),
('Garcia.Isabella.456', 'MemberIsabella28', NULL, 'M14'),
('Lee.Andy.789', 'MemberAndy19', NULL, 'M15'),
('Hall.Sarah.234', 'MemberSarah52', NULL, 'M16'),
('Scott.Jessica.567', 'MemberJessica31', NULL, 'M17'),
('Davis.Robert.890', 'MemberRobert43', NULL, 'M18'),
('Nguyen.Kim.123', 'MemberKim26', NULL, 'M19'),
('Adams.James.456', 'MemberJames60', NULL, 'M20'),
('Wilson.Olivia.789', 'MemberOlivia37', NULL, 'M21'),
('Parker.William.234', 'MemberWilliam48', NULL, 'M22'),
('Allen.Sophia.567', 'MemberSophia25', NULL, 'M23'),
('Jackson.Daniel.890', 'MemberDaniel29', NULL, 'M24'),
('Wright.Ava.123', 'MemberAva23', NULL, 'M25'),
('Lewis.Ethan.456', 'MemberEthan36', NULL, 'M26'),
('Robinson.Emma.789', 'MemberEmma32', NULL, 'M27'),
('Walker.Noah.234', 'MemberNoah30', NULL, 'M28');

INSERT INTO Request(requestID, memberID, status, staffID, date, time, branchID)
VALUES
('R01', 'M02', 'Approved', 'S03', "2023-01-20", 13.10, 'B05'),
('R02', 'M13', 'Pending', 'S01', "2023-01-21", 15.27, 'B05'),
('R03', 'M03', 'Approved', 'S02', "2023-01-22", 10.49, 'B02'),
('R04', 'M05', 'Denied', 'S02', "2023-02-02", 16.12, 'B03'),
('R05', 'M10', 'Approved', 'S01', "2023-02-10", 9.43, 'B01'),
('R06', 'M07', 'Approved', 'S03', "2023-01-03", 13.36, 'B05'),
('R07', 'M03', 'Pending', 'S02', "2023-03-11", 11.43, 'B04'),
('R08', 'M04', 'Approved', 'S03', "2023-03-21", 12.11, 'B05'),
('R09', 'M17', 'Denied', 'S01', "2023-03-22", 11.54, 'B01'),
('R10', 'M09', 'Approved', 'S01', "2023-03-23", 15.08, 'B04'),
('R11', 'M10', 'Pending', 'S02', "2023-04-04", 14.49, 'B02'),
('R12', 'M08', 'Denied', 'S01', "2023-04-13", 12.49, 'B04'),
('R13', 'M10', 'Approved', 'S03', "2023-04-14", 15.41, 'B01'),
('R14', 'M03', 'Denied', 'S03', "2023-04-14", 13.53, 'B02'),
('R15', 'M25', 'Approved', 'S02', "2023-04-20", 11.43, 'B04'),
('R16', 'M01', 'Approved', 'S03', "2023-04-21", 9.10, 'B03');

INSERT INTO `Order`(orderID, requestID, isbn, borrowDate, returnDate, status, dueDate, accuredFine)
VALUES
('C01', 'R01', '9780743273565', "2023-01-20", "2023-01-29", 'Returned', "2023-01-27", 20),
('C02', 'R03', '9780061231327', "2023-01-22", "2023-01-23", 'Returned', "2023-01-29", 0),
('C03', 'R05', '9780199216819', "2023-02-10", "2023-02-24", 'Returned', "2023-02-17", 70),
('C04', 'R06', '9780387943804', "2023-03-01", "2023-03-08", 'Returned', "2023-03-08", 0),
('C05', 'R08', '9780521186627', "2023-03-21", "2023-03-24", 'Returned', "2023-03-28", 00),
('C06', 'R10', '9780743273566', "2023-03-23", "2023-03-31", 'Returned', "2023-03-30", 10),
('C07', 'R13', '9780316341686', "2023-04-14", "2023-04-20", 'Pending', "2023-04-21", 0),
('C08', 'R15', '9780767908184', "2023-04-20", "2023-04-27", 'Active', "2023-04-27", 0),
('C09', 'R16', '9780451527741', "2023-04-21", "2023-04-28", 'Active', "2023-04-28", 0);
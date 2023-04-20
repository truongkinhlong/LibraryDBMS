use LibraryDBMS;

INSERT INTO Branch (branchID, address, openHour, closeHour, openDay)
VALUES 
  (1, '123 Main St, Anytown, USA', '09:00:00', '17:00:00', 'Mon-Fri'),
  (2, '456 Oak Ave, Anytown, USA', '10:00:00', '18:00:00', 'Mon-Sat'),
  (3, '789 Elm Blvd, Anytown, USA', '11:00:00', '19:00:00', 'Mon-Sun'),
  (4, '1010 Pine Rd, Anytown, USA', '12:00:00', '20:00:00', 'Tue-Sun'),
  (5, '1111 Maple Dr, Anytown, USA', '13:00:00', '21:00:00', 'Mon-Thu');

INSERT INTO Admin (adminID, title, lName, fName, age, sex, email, branchID)
VALUES 
(1, 'General Manager', 'Johnson', 'Jessica', 35, 'F', 'jessica.johnson@library.com', 1),
(2, 'General Manager', 'Smith', 'John', 40, 'M', 'john.smith@library.com', 2),
(3, 'Executive Manager', 'Garcia', 'Maria', 30, 'F', 'maria.garcia@library.com', 3),
(4, 'IT Manager', 'Brown', 'David', 45, 'M', 'david.brown@library.com', 4),
(5, 'Bracnhes Manager', 'Taylor', 'Emily', 25, 'F', 'emily.taylor@library.com', 5);

INSERT INTO Staff (staffID, title, lName, fName, age, sex, email, branchID)
VALUES 
(1, 'Floor Staff', 'Lee', 'James', 25, 'M', 'james.lee@library.com', 1),
(2, 'Floor Staff', 'Wang', 'Linda', 30, 'F', 'linda.wang@library.com', 2),
(3, 'Floor Staff', 'Kim', 'David', 35, 'M', 'david.kim@library.com', 3),
(4, 'Warehouse Staff', 'Chen', 'Sophie', 40, 'F', 'sophie.chen@library.com', 4),
(5, 'Inventory Staff', 'Liu', 'Michael', 45, 'M', 'michael.liu@library.com', 5);
  
INSERT INTO Member (memberID, lName, fName, age, sex, DOB, email, status, hold)
VALUES
  (1, 'Smith', 'John', 25, 'M', '1998-01-15', 'johnsmith@email.com', 'Active', 0),
  (2, 'Doe', 'Jane', 30, 'F', '1993-04-19', 'janedoe@email.com', 'Active', 0),
  (3, 'Williams', 'James', 42, 'M', '1981-07-27', 'jameswilliams@email.com', 'Expired', 0),
  (4, 'Brown', 'Mary', 19, 'F', '2004-12-03', 'marybrown@email.com', 'Active', 1),
  (5, 'Garcia', 'Carlos', 55, 'M', '1968-11-01', 'carlosgarcia@email.com', 'Active', 0),
  (6, 'Chen', 'Samantha', 23, 'F', '1998-09-08', 'samanthachen@email.com', 'Expired', 1),
  (7, 'Lee', 'David', 37, 'M', '1986-03-12', 'davidlee@email.com', 'Active', 0),
  (8, 'Nguyen', 'Thi', 28, 'F', '1995-06-25', 'thinguyen@email.com', 'Active', 0),
  (9, 'Gupta', 'Raj', 50, 'M', '1973-12-22', 'rajgupta@email.com', 'Expired', 1),
  (10, 'Wang', 'Wei', 31, 'M', '1990-05-02', 'weiwang@email.com', 'Active', 1);

INSERT INTO Book (isbn, genre, title, branchID, status, publishedBy, language, shelf)
VALUES 
('9781408894705', 'Fiction', 'The Testaments', 1, 'Available', 'Random House', 'English', 'Fiction A-Z'),
('9780316341686', 'Fiction', 'The Girl Who Takes an Eye for an Eye', 2, 'On Loan', 'Hachette Book Group', 'English', 'Mystery & Thriller'),
('9780063021909', 'Fiction', 'The Midnight Library', 3, 'Available', 'Viking', 'English', 'Fiction A-Z'),
('9780743273565', 'Non-fiction', 'The Power of Now: A Guide to Spiritual Enlightenment', 4, 'Available', 'New World Library', 'English', 'Self-help'),
('9780767908184', 'Non-fiction', 'Blink: The Power of Thinking Without Thinking', 5, 'On Loan', 'Little, Brown and Company', 'English', 'Business & Economics')

INSERT INTO Author (authorID, lName, fName) 
VALUES
(1, 'Mary', 'Johnson'),
(2, 'Joe', 'Miller'),
(3, 'Huller', 'Godness'),
(4, 'Zic', 'Embias'),
(5, 'Luke', 'Geo');

INSERT INTO WrittenBy (isbn, authorID) 
VALUES
('9781408894705', 1),
('9780316341686', 2),
('9780063021909', 3),
('9780743273565', 4),
('9780767908184', 5);

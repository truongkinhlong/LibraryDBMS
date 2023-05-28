SELECT
	o.orderID,
    r.requestID,
    br.address AS LibraryAddress,
    s.staffID,
    s.fName AS staffFristName,
    s.lName AS staffLastName,
    m.memberID,
    m.fName AS memberFristName,
    m.lName AS memberLastName,
    r.date AS requestDate,
    r.time AS requestTime,
    b.isbn AS bookISBN,
    b.title AS bookTitle,
    o.borrowDate,
    o.dueDate,
    o.returnDate,
    o.status AS orderStatus,
    o.accuredFine
FROM `Order` o
INNER JOIN Request r on o.requestID = r.requestID
INNER JOIN Book b on o.isbn = b.isbn
INNER JOIN Member m on r.memberID = m.memberID
INNER JOIN Staff s on r.staffID = s.staffID
INNER JOIN Branch br on r.branchID = br.branchID;
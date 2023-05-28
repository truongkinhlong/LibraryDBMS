SELECT 
    m.adminID,
    a.fName AS adminFristName,
    a.lName AS adminLastName,
    a.title AS title,
    m.branchID,
    b.address AS branchAddress
FROM 
    Manage m
    INNER JOIN Admin a ON m.adminID = a.adminID 
    INNER JOIN Branch b on m.branchID = b.branchID
    
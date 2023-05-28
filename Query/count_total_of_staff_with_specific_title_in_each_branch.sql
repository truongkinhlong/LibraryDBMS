SELECT 
    
    p.branchID,
    b.address AS branchAddress,
    s.title as staffTitle,
    COUNT(*) AS numberOfEmployee
    
FROM 
    primaryBranch p
    INNER JOIN Staff s ON p.staffID = s.staffID 
    INNER JOIN Branch b on p.branchID = b.branchID
GROUP BY p.branchID, s.title;
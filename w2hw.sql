# 1
SELECT COUNT(b.title)
FROM tbl_book b, tbl_book_copies bc, tbl_library_branch lb
WHERE b.title = 'The Lost Tribe' AND b.bookId = bc.bookId AND
      bc.branchId = lb.branchId AND lb.branchName = 'Sharpstown';

#2
SELECT COUNT(b.title)
FROM tbl_book b, tbl_book_copies bc, tbl_library_branch lb
WHERE b.title = 'The Lost Tribe' AND b.bookId = bc.bookId AND
      bc.branchId = lb.branchId
GROUP BY lb.branchName;

#3
SELECT b.name
FROM tbl_borrower b, tbl_book_loans bl
WHERE NOT EXISTS (SELECT * 
                  FROM bl
			      WHERE b.cardNo = bl.cardNo);
				  
#4
SELECT b.title, bo.name, bo.address
FROM tbl_book b, tbl_borrower bo, tbl_book_loans bl, tbl_library_branch lb
WHERE lb.branchName = 'Sharpstown' AND bo.cardNo = bl.cardNo AND bl.branchId = lb.branchId AND
      bl.bookId = b.bookId AND bl.dueDate BETWEEN '07/05/2019' AND '07/05/2019 23:59:59';
	  
#5
SELECT lb.branchName, COUNT(bl.bookId)
FROM tbl_library_branch lb, tbl_book_loans bl
GROUP BY lb;

#6
SELECT b.name, b.address, COUNT (bl.bookId)
FROM tbl_borrower b, tbl_book_loans bl
WHERE b.cardNo = bl.cardNo AND COUNT(bl.bookId) >= 5;

#7
SELECT b.bookTitle, COUNT(b.bookTitle)
FROM tbl_author a, tbl_book b, tbl_book_copies bc, tbl_library_branch lb
WHERE a.authorName = 'Stephen King' AND lb.branchName = 'Central' AND a.authorId = b.authId AND
      AND b.bookId = bc.bookId AND bc.branchId = lb.branchId;
	  
#8
SELECT e.fname, e.minit, e.lname
FROM Department d, Employee e, Project p, Works_on w
WHERE e.dno = d.dNumber AND w.essn = e.ssn AND w.pno = p.pNumber AND d.dNumber = 5 AND 
      AND p.pName = 'ProductX' AND w.hours >= 10;
      
#9
SELECT p.pName, SUM(w.hours)
FROM Project p, Works_on w
WHERE p.pNumber = w.pNo
GROUP BY p.pNumber;

#10


#11
SELECT e.fname, e.minit, fe.lname
FROM Employee e
WHERE NOT EXISTS (SELECT *
                  FROM Employee e, Works_on w
				  WHERE e.ssn = w.essn
				  );
				  
#12

#13
SELECT E.fname, E.minit, E.lname
FROM Employee E, Department D

#14
SELECT E.fname, E.minit, E.lname, E.ssn, E.bdate, E.address, E.sex, E.salary, E.superssn, E.dno
FROM Employee e
WHERE e.salary > (SELECT AVG(E.salary)
                  FROM Employee e)
ORDER BY e.salary DESC;

#15
SELECT E.fname, E.minit, E.lname, E.ssn, E.bdate, E.address, E.sex, E.salary, E.superssn, E.dno
FROM Employee e
WHERE e.salary > (SELECT AVG(E.salary)
                  FROM Employee e)
GROUP By
ORDER BY e.salary ASC;
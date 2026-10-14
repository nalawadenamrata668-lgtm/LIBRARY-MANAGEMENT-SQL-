CREATE DATABASE library_manage;




CREATE TABLE BOOK(
 BOOK_ID INT PRIMARY KEY,
 TITLE VARCHAR(50) NOT NULL,
 AUTHOR VARCHAR(30) NOT NULL,
 CATEGORY VARCHAR(20) NOT NULL,
 PRICE INT
);

CREATE TABLE MEMBER(
MEMBER_ID INT PRIMARY KEY,
MEMBER_NAME VARCHAR(10) NOT NULL,
DEPARTMENT VARCHAR(10),
JOIN_DATE DATE
);

CREATE TABLE ISSUE(
ISSUE_ID INT PRIMARY KEY,
BOOK_ID INT NOT NULL,
MEMBER_ID INT NOT NULL,
ISSUE_DATE DATE NOT NULL,
RETURN_DATE DATE
FOREIGN KEY (BOOK_ID) REFERENCES BOOK(BOOK_ID),
FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER(MEMBER_ID)
);

INSERT INTO BOOK VALUES
(101,'DBMS Concepts','Korth','CS',550),
(102,'Python Basics','John','Programming',400),
(103, 'Data Structures', 'Lipschutz', 'CS', 600),
(104, 'Web Design', 'Anita', 'IT', 350),
(105, 'Machine Learning' ,'Tom' ,'AI' ,750);

INSERT INTO MEMBER VALUES
(1, 'Aditi', 'CSE', '2025-01-10'),
(2, 'Rahul', 'AIML', '2025-02-15'),
(3 ,'Sneha' ,'CSE' ,'2025-03-20'),
(4, 'Amit', 'ENTC', '2025-04-05'),
(5, 'Priya' ,'AIML' ,'2025-05-12');

INSERT INTO ISSUE VALUES
(1, 101, 1, '2026-09-01', '2026-09-10'),
(2 ,102 ,2 ,'2026-09-05', NULL),
(3 ,103, 1, '2026-09-08', NULL),
(4 ,105 ,3, '2026-09-10' ,'2026-09-18'),
(5 ,104, 4, '2026-09-12' ,NULL);

SELECT * FROM BOOK;
SELECT * FROM MEMBER;
SELECT * FROM ISSUE;

-- 1. Display books whose prices are between ₹400 and ₹700.
SELECT * FROM BOOK
WHERE PRICE BETWEEN 400 AND 700

-- 2. Display books belonging to either the CS or AI category.
SELECT * FROM BOOK 
WHERE CATEGORY IN ('CS','AI');

-- 3. Find the average price of all books.
SELECT AVG(PRICE) AS AVG_PRICE FROM BOOK;

-- 4. Count the number of members in each department.
SELECT DEPARTMENT, COUNT(*) AS PRESENT_MEMBER FROM MEMBER
GROUP BY DEPARTMENT;

-- 5. Display categories having more than one book.
SELECT CATEGORY FROM BOOK
GROUP BY CATEGORY
HAVING COUNT(*) >1;

-- 6. Display the names of members who have not returned their books.

SELECT DISTINCT M.MEMBER_NAME
FROM MEMBER M
INNER JOIN ISSUE I
ON M.MEMBER_ID = I.MEMBER_ID
WHERE I.RETURN_DATE IS NULL;


-- 7. Display the member names along with the titles of books they have borrowed.
SELECT DISTINCT M.MEMBER_NAME,B.TITLE FROM MEMBER M
INNER JOIN ISSUE I
ON M.MEMBER_ID = I.MEMBER_ID
INNER JOIN BOOK B
ON B.BOOK_ID = I.BOOK_ID


-- 8. Display book titles and member names for all issued books, sorted by issue date.
SELECT I.ISSUE_DATE,B.TITLE,M.MEMBER_NAME FROM BOOK B
INNER JOIN ISSUE I
ON B.BOOK_ID=I.BOOK_ID
INNER JOIN MEMBER M
ON M.MEMBER_ID = I.MEMBER_ID
ORDER BY issue_date ASC

-- 9.Display all books whose prices are greater than the average book price.
SELECT * FROM BOOK
WHERE PRICE >(SELECT AVG(PRICE) FROM BOOK)

--  10. Increase the price of all books in the CS category by 5%.
UPDATE BOOK
SET PRICE = PRICE * 1.05
WHERE CATEGORY = 'CS';
SELECT * FROM BOOK

-- 11. Display all members who have not borrowed any book.
SELECT *
FROM MEMBER
WHERE MEMBER_ID NOT IN (
    SELECT MEMBER_ID
    FROM ISSUE
);

-- 12. Display the number of times each book has been issued,
--including books that have
--never been issued.
SELECT B.TITLE, COUNT(I.ISSUE_ID) AS ISSUE_COUNT
FROM BOOK B
LEFT JOIN ISSUE I
ON B.BOOK_ID = I.BOOK_ID
GROUP BY B.BOOK_ID, B.TITLE;

-- 13. Display the names of members who have borrowed books from the AI category.
SELECT M.MEMBER_NAME
FROM BOOK B
INNER JOIN ISSUE I
ON B.BOOK_ID = I.BOOK_ID
INNER JOIN MEMBER M
ON M.MEMBER_ID = I.MEMBER_ID
WHERE B.CATEGORY = 'AI';

--14. Display the most expensive book.
SELECT *
FROM BOOK
WHERE PRICE = (SELECT MAX(PRICE) FROM BOOK);

--15. Display the number of books issued to each member.
SELECT M.MEMBER_NAME, COUNT(I.ISSUE_ID) AS TOTAL_BOOKS
FROM MEMBER M
LEFT JOIN ISSUE I
ON M.MEMBER_ID = I.MEMBER_ID
GROUP BY M.MEMBER_ID, M.MEMBER_NAME;
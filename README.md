# LIBRARY-MANAGEMENT-SQL-
# Library Management System — SQL Practice

## Table Structure

### BOOK

| BOOK_ID | TITLE | AUTHOR | CATEGORY | PRICE |
|---|---|---|---|---:|
| 101 | DBMS Concepts | Korth | CS | 550 |
| 102 | Python Basics | John | Programming | 400 |
| 103 | Data Structures | Lipschutz | CS | 600 |
| 104 | Web Design | Anita | IT | 350 |
| 105 | Machine Learning | Tom | AI | 750 |

### MEMBER

| MEMBER_ID | MEMBER_NAME | DEPARTMENT | JOIN_DATE |
|---|---|---|---|
| 1 | Aditi | CSE | 2025-01-10 |
| 2 | Rahul | AIML | 2025-02-15 |
| 3 | Sneha | CSE | 2025-03-20 |
| 4 | Amit | ENTC | 2025-04-05 |
| 5 | Priya | AIML | 2025-05-12 |

### ISSUE

| ISSUE_ID | BOOK_ID | MEMBER_ID | ISSUE_DATE | RETURN_DATE |
|---|---|---|---|---|
| 1 | 101 | 1 | 2026-09-01 | 2026-09-10 |
| 2 | 102 | 2 | 2026-09-05 | NULL |
| 3 | 103 | 1 | 2026-09-08 | NULL |
| 4 | 105 | 3 | 2026-09-10 | 2026-09-18 |
| 5 | 104 | 4 | 2026-09-12 | NULL |

## SQL Query Questions

### Easy to Medium Level

1. Display books whose prices are between ₹400 and ₹700.
2. Display books belonging to either the CS or AI category.
3. Find the average price of all books.
4. Count the number of members in each department.
5. Display categories having more than one book.
6. Display the names of members who have not returned their books.
7. Display the member names along with the titles of books they have borrowed.
8. Display book titles and member names for all issued books, sorted by issue date.
9. Display all books whose prices are greater than the average book price.
10. Increase the price of all books in the CS category by 5%.
11. Display all members who have not borrowed any book.
12. Display the number of times each book has been issued, including books that have never been issued.
13. Display the names of members who have borrowed books from the AI category.
14. Display the most expensive book.
15. Display the number of books issued to each member.

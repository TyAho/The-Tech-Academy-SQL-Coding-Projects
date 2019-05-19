USE [LibraryManagement1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES )
		DROP TABLE  tbl_LIBRARY_BRANCH,tbl_BOOKS, tbl_BOOK_AUTHORS, tbl_BOOK_COPIES, tbl_BOOK_LOANS, tbl_BORROWER, tbl_PUBLISHER;

CREATE TABLE tbl_LIBRARY_BRANCH (
BranchID VARCHAR(50) PRIMARY KEY NOT NULL,
BranchName VARCHAR (50) NOT NULL,
Address VARCHAR(50) NOT NULL
);

SELECT*FROM tbl_LIBRARY_BRANCH

CREATE TABLE tbl_PUBLISHER (
PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
Address VARCHAR(300) NOT NULL,
Phone VARCHAR(300) NOT NULL
);


CREATE TABLE tbl_BOOKS (
BookID INT PRIMARY KEY NOT NULL,
Title VARCHAR(200)  NOT NULL,
PublisherName VARCHAR(50) NOT NULL
FOREIGN KEY (PublisherName) REFERENCES tbl_PUBLISHER(PublisherName)
);


CREATE TABLE tbl_BOOK_AUTHORS (
BookID VARCHAR(50) NOT NULL,
AuthorName VARCHAR(50)  NOT NULL
);

CREATE TABLE tbl_BOOK_COPIES (
BookID VARCHAR(50),
BranchID VARCHAR(50),
Number_Of_Copies VARCHAR(50)
FOREIGN KEY (BranchID) REFERENCES tbl_LIBRARY_BRANCH(BranchID)
);

CREATE TABLE tbl_BOOK_LOANS (
BookID INT NOT NULL,
BranchID VARCHAR(50) NOT NULL,
CardNo VARCHAR(50) NOT NULL, 
DateOut VARCHAR(200) NOT NULL,
DateDue VARCHAR(200) NOT NULL
FOREIGN KEY (BookID) REFERENCES tbl_BOOKS(BookID)
);

CREATE TABLE tbl_BORROWER (
CardNo VARCHAR(50) PRIMARY KEY NOT NULL, 
Name VARCHAR(50) NOT NULL,
Address VARCHAR(300) NOT NULL,
Phone VARCHAR(300) NOT NULL
);

/***************************************
Table for library branch
******************************************/
INSERT INTO tbl_LIBRARY_BRANCH 
(BranchID, BranchName, Address)
VALUES
(1, 'Sharpstown', 45678),
(2, 'Central', 34276),
(3, 'Lakeview', 25478),
(4,'Southern', 98675)
;

/***************************************
Table for Publisher
*****************************************/
INSERT INTO tbl_PUBLISHER
(PublisherName, Address, Phone)
VALUES
('Aero', 24566, '354-865-8843'),
('Simon',14533, '432-345-6879'),
('Harper', 21544, '543-879-6754'),
('Elmer', 45367, '345-543-7456'),
('Garfunkel', 32412, '542-754-7543'),
('Arthur', 12538, '348-385-3187'),
('Jeremy', 17306, '194-123-4536'),
('Doug', 16397, '163-675-9076'),
('Don', 17428, '174-087-4534'),
('Crystal', 17398 , '143-565-8978'),
('Bell', 12321, '534-976-4635'),
('Water', 14232, '765-969-4322'),
('Jim', 13423, '534-756-3423'),
('Dom', 13563, '543-3213-5432'),
('Ronald', 16487, '869-432-7575'),
('Donald', 14239, '604-988-0999'),
('Magnolia', 13422, '685-645-6453'),
('Gold', 57480, '465-968-6857'),
('Silver', 24795,'342-654-8976'),
('Angel', 45324, '453-976-8685'),
('Arnold', 64938, '868-352-4534'),
('Darnold', 16387, '352-756-5412'),
('Arial', 13211, '346-094-1232'),
('Daniel', 15324, '456-902-4534'),
('Danielle', 12764, '487-905-3322'), 
('Robert', 14123, '564-989-4352'),
('Abe', 13456, '435-787-909'),
('John', 12452, '786-867-6437'),
('Jack', 17574, '536-654-7712'),
('Josh', 15275, '982-532-1100'),
('Orange', 64832, '869-463-5290'),
('Black', 67523, '639-124-8890'),
('Grey', 14386, '896-854-0909'),
('Blue', 53271, '666-443-2212'),
('Green', 75840, '543-231-8860'),
('Red', 12345, '758-532-7654'),
('George', 88965, '645-6323-9985'),
('Carl', 66473, '890-354-2234'),
('Gerald', 77234, '854-647-3327'),
('Jonah', 77584,'654-321-7767')
;
/**********************************
Table for books
************************************/
SELECT* FROM tbl_BOOKS
INSERT INTO tbl_BOOKS
(BookID, Title, PublisherName)
VALUES
(15, 'The Lost Tribe', 'Aero'),
(16, 'The Stand', 'Simon'),
(17, 'The Lost Hero', 'Harper'), 
(18, 'Fahrenheit 451', 'Elmer'),
(19, 'The Great Gatsby', 'Garfunkel'),
(20, 'It', 'Arthur'),
(21, 'Nineteen Eighty-Four', 'Jeremy'),
(22, 'Lolita', 'Doug'),
(23, 'Catch-22', 'Don'),
(24,'The Shining', 'Crystal'),
(25, 'Beloved', 'Bell'),
(26, 'The Lord of the Rings', 'Water'),
(27,'One Hundred Years of Solitude', 'Jim'),
(28,'Misery', 'Dom'),
(29, 'Brave New World', 'Ronald'),
(30,'Invisible Man', 'Donald'),
(31, 'On the Road', 'Magnolia'),
(32, 'Christine', 'Gold'),
(33, 'Pride and Prejudice', 'Silver'),
(34, 'Lord of the Flies', 'Angel' ),
(35, 'Anna Karenina', 'Arnold'),
(36,'Under the Dome', 'Darnold'),
(37,'Animal Farm', 'Arial'),
(38,'A Passage to India', 'Daniel'),
(39,'In Search of Lost Time', 'Danielle'),
(40, 'Doctor Sleep', 'Robert'),
(41, 'Wuthering Heights', 'Abe'),
(42, 'The Color Purple', 'John'),
(43, 'Winnie-the-Pooh', 'Jack'),
(44, 'Needful Things', 'Josh'),
(45, 'Heart of Darkness', 'Orange'),
(46, 'War and Peace', 'Black'),
(47,'Of Mice and Men', 'Grey'),
(48, 'The Tommyknockers','Blue'),
(49, 'Moby-Dick', 'Green'),
(50, 'Great Expectations', 'Red'), 
(51,'The Sun Also Rises','George'),    
(52,'Dreamcatcher','Carl'),
(53,'Rebecca','Gerald'),
(54,'The Stranger','Jonah'),
(55,'Of Mice and Men', 'Grey'),
(56, 'The Lost Tribe', 'Aero'),
(57, 'The Lost Tribe', 'Aero'),
(58, 'The Lost Tribe', 'Aero')
;


/************************************
Table for authors
**************************************/
INSERT INTO tbl_BOOK_AUTHORS
(BookID, AuthorName)
VALUES
(15, 'Mark W. Lee'),
(16, 'Stephen King'),
(17, 'Rick Riordan'),
(18, ' Ray Bradbury'),
(19, 'F. Scott Fitzgerald'),
(20, 'Stephen King'),
(21, 'George Orwell'),
(22, 'Vladimir Nabokov'),
(23, 'Joseph Heller'),
(24, 'Stephen King'),
(25, 'Toni Morrison'),
(26, 'J. R. R. Tolkien'),
(27, 'Gabriel García Márquez'),
(28, 'Stephen King'),
(29, 'Aldous Huxley'),
(30, 'Ralph Ellison'),
(31, 'Margaret Mitchell'),
(32, 'Stephen King'),
(33, 'Jane Austen'),
(34, 'William Golding'),
(35, 'Leo Tolstoy'),
(36, 'Stephen King'),
(37, 'George Orwell'),
(38, 'E. M. Forster'),
(39, 'Marcel Proust'),
(40, 'Stephen King'),
(41, 'Emily Brontë'),
(42, 'Alice Walker'),
(43, 'Salman Rushdie'),
(44, 'Stephen King'),
(45, 'A. A. Milne'),
(46, 'Leo Tolstoy'),
(47, 'John Steinbeck'),
(48, 'Stephen King'),
(49, 'Herman Melville'),
(50, 'Charles Dickens'),
(51, 'Ernest Hemingway'),
(52, 'Stephen King'),
(53, 'Daphne du Maurier'),
(54, 'Albert Camus'),
(55, 'John Steinbeck'),
(56, 'Mark W. Lee'),
(57, 'Mark W. Lee'),
(58, 'Mark W. Lee')
;


/***********************************
Actual book copies
***********************************/
SELECT* FROM tbl_BOOK_COPIES
INSERT INTO tbl_BOOK_COPIES
(BookID, BranchID, Number_Of_Copies)
VALUES
(15, 1, 3),
(16, 2, 2),
(17, 3, 2),
(18, 4,4),
(19, 1, 2),
(20, 2, 3),
(21, 3, 2),
(22, 4, 3),
(23, 1, 2),
(24, 2, 2),
(25, 3, 3),
(26, 4, 4),
(27, 1, 2),
(28, 2, 3),
(29, 3, 2),
(30, 4, 3),
(31, 1, 2),
(32, 2, 5),
(33, 3, 3),
(34, 4, 2),
(35, 1, 2),
(36, 2, 2),
(37, 3, 3),
(38, 4, 5),
(39, 1, 4),
(40, 2, 6),
(41, 3, 4),
(42, 4, 2),
(43, 1, 3),
(44, 2, 2),
(45, 3, 3),
(46, 4, 4),
(47, 1, 3),
(48, 2, 4),
(49, 3, 3),
(50, 4, 2),
(51, 1, 3),
(52, 2, 4),
(53, 3, 2),
(54, 4, 5),
(55, 1, 2),
(56, 2, 3),
(57, 3, 2),
(58, 4, 4)
;
/********************************
Table for book loans
***********************************/
SELECT* FROM tbl_BOOK_LOANS
INSERT INTO tbl_BOOK_LOANS
(BookID, BranchID, CardNO, DateOut, DateDue)
VALUES
(15, 1, 123, '4/5/2019', '4/12/2019'),
(20, 2, 123, '4/8/2019', '4/15/2019'),
(22, 4, 123, '4/10/2019', '4/17/2019'),
(25, 3, 123, '4/11/2019', '4/18/2019'),
(27, 1, 123, '4/13/2019', '4/20/2019'),
(30, 4, 123, '4/15/2019', '4/22/2019'),
(42, 4, 125, '4/12/2019', '4/19/2019'),
(38, 4, 131, '4/19/2019', '4/26/2019'),
(35, 1, 140, '4/18/2019', '4/25/2019'),
(50, 4, 138, '4/22/2019', '4/29/2019'),
(21, 3, 162, '4/25/2019', '5/1/2019'),
(23, 1, 145, '4/23/2019', '4/30/2019'),
(29, 3, 152, '5/2/2019', '5/9/2019'),
(26, 4, 152, '5/3/2019', '5/10/2019'),
(52, 2, 152, '5/5/2019', '5/12/2019'),
(47, 1, 152, '5/8/2019', '5/15/2019'),
(43, 1, 152, '5/10/2019', '5/17/2019'),
(51, 1, 152, '5/11/2019', '5/18/2019'),
(17, 3, 152, '5/3/2019', '5/10/2019'),
(21, 3, 162, '4/25/2019', '5/1/2019'),
(23, 1, 123, '4/15/2019', '4/22/2019'),
(34, 4, 123, '4/11/2019', '4/18/2019'),
(26, 4, 138, '4/22/2019', '4/29/2019'),
(29, 3, 145, '4/23/2019', '4/30/2019'),
(31, 1, 123, '4/8/2019', '4/15/2019'),
(33, 3, 131, '4/19/2019', '4/26/2019'),
(48, 2, 145, '4/23/2019', '4/30/2019'),
(44, 2, 138, '4/22/2019', '4/29/2019'),
(41, 3, 123, '4/10/2019', '4/17/2019'),
(40, 2, 152, '5/8/2019', '5/15/2019'),
(35, 1, 152, '5/5/2019', '5/12/2019'),
(32, 2, 152, '5/8/2019', '5/15/2019'),
(19, 1, 123, '4/15/2019', '4/22/2019'),
(22, 4, 131, '4/19/2019', '4/26/2019'),
(24, 2, 138, '4/22/2019', '4/29/2019'),
(26, 4, 145, '4/23/2019', '4/30/2019'),
(51, 1, 131, '4/19/2019', '4/26/2019'),
(20, 2, 125, '4/12/2019', '4/19/2019'),
(16, 2, 152, '5/2/2019', '5/9/2019'),
(34, 4, 152, '5/2/2019', '5/9/2019'),
(38, 4, 125, '4/12/2019', '4/19/2019'),
(43, 1, 152, '5/3/2019', '5/10/2019'),
(49, 3, 138, '4/22/2019', '4/29/2019'),
(50, 4, 123, '4/10/2019', '4/17/2019'),
(46, 4, 131, '4/19/2019', '4/26/2019'),
(25, 3, 162, '4/25/2019', '5/1/2019'),
(22, 4, 140, '4/18/2019', '4/25/2019'),
(15, 1, 162, '4/25/2019', '5/1/2019'),
(18, 4, 123, '4/15/2019', '4/22/2019'),
(17, 3, 145, '4/23/2019', '4/30/2019'),
(42, 4, 131, '4/19/2019', '4/26/2019'),
(54, 1, 136, '0', '0')
;
/**********************************
Table for borrowers
***********************************/
INSERT INTO tbl_BORROWER
(CardNo, Name, Address, Phone)
VALUES
(123, 'Tom Smith', '34312 SE 224th AVE', '354-889-4343'),
(125, 'Rebecca Miller', '67533 NE 132nd CIR', '134-673-4432'),
(131, 'Jim Johnson', '43213 NW 121st AVE', '545-342-7765'),
(140, 'Lisa Brown', '24322 SE 142nd AVE', '323-533-7876'),
(138, 'Josh Howard', '24212 SW 231st CIR', '532-656-7541'),
(162, 'Jordan Reeves', '11234, SE 321st AVE', '321-453-5409'),
(145, 'Cassandra Maxwell', '45321, NW 222nd AVE', '231-434-6675'),
(152, 'Leon James', '43213, SW 182nd CIR', '532-574-9984'),
(136, 'John Walker', '23165, NE 352nd AVE', '264-864-8864')
;




/***************************
Query 1
*******************************/
Select * FROM tbl_LIBRARY_BRANCH, tbl_BOOK_COPIES, tbl_BOOKS
WHERE Title = 'The Lost Tribe'  AND tbl_LIBRARY_BRANCH.BranchID = 1

SELECT bs.Title, lb.BranchName, bc.Number_of_Copies
FROM dbo.tbl_BOOK_COPIES bc
INNER JOIN dbo.tbl_BOOKS bs ON bc.BookID = bs.BookID
INNER JOIN dbo.tbl_LIBRARY_BRANCH lb ON bc.BranchID = lb.BranchID
WHERE bs.Title = 'The Lost Tribe' AND lb.BranchName = 'Sharpstown'
/*********************
query 2
*************************/
SELECT bf.Title, ld.BranchName, bd.Number_of_Copies
FROM dbo.tbl_BOOK_COPIES bd
INNER JOIN dbo.tbl_BOOKS bf ON bd.BookID = bf.BookID
INNER JOIN dbo.tbl_LIBRARY_BRANCH ld ON bd.BranchID = ld.BranchID
WHERE bf.Title = 'The Lost Tribe' Group By [BranchName], [Title], [Number_Of_Copies]
ORDER BY COUNT (ld.BranchID) DESC
;

/***********************************
query 3 Look back at and redo
************************************/
SELECT bd.Name, bc.DateOut, bc.DateDue
FROM dbo.tbl_BORROWER bd
INNER JOIN dbo.tbl_BOOK_LOANS bc ON bd.CardNo = bc.CardNo
WHERE bc.DateDue = '0'

SELECT * FROM tbl_BORROWER
SELECT * FROM tbl_BOOK_LOANS
/**************************************
query 4
*****************************************/
SELECT bf.BranchName, ld.DateDue, bd.Title, bc.Name, bc.Address
FROM dbo.tbl_BOOKS bd 
INNER JOIN dbo.tbl_BOOK_LOANS ld ON bd.BookID = ld.BookID
INNER JOIN dbo.tbl_LIBRARY_BRANCH bf ON ld.BranchID = bf.BranchID
INNER JOIN dbo.tbl_BORROWER bc ON ld.CardNo = bc.CardNo 
WHERE bf.BranchName = 'Sharpstown' AND ld.DateDue = '5/18/2019' AND bc.Address = '43213, SW 182nd CIR'

SELECT * FROM tbl_LIBRARY_BRANCH, tbl_BOOK_LOANS,  tbl_BORROWER, tbl_BOOKS
WHERE tbl_LIBRARY_BRANCH.BranchName =  'Sharpstown' AND tbl_BOOK_LOANS.DateDue = '5/17/2019'

/*************************************
query 5
*****************************************/
SELECT bf.BranchName, ld.CardNo, bc.Number_Of_Copies
FROM dbo.tbl_BOOK_LOANS ld
INNER JOIN dbo.tbl_LIBRARY_BRANCH bf ON ld.BranchID = bf.BranchID
INNER JOIN dbo.tbl_BOOK_COPIES bc ON ld.BookID = bc.BookID
/******************************************
query 6
******************************************/
SELECT bf.Name, bf.Address, ld.Number_Of_Copies, ld.BookID ,bc.BranchID, bc.CardNo 
FROM dbo.tbl_BOOK_LOANS bc
INNER JOIN dbo.tbl_BORROWER bf ON bc.CardNo = bf.CardNo
INNER JOIN dbo.tbl_BOOK_COPIES ld ON ld.BookID = bc.BookID
WHERE bf.Name = 'Tom Smith' OR  bf.Name = 'Jim Johnson' OR bf.Name = 'Josh Howard' OR bf.Name = 'Leon James'
GROUP BY bc.CardNo, bf.Name, bf.Address, ld.Number_Of_Copies, ld.BookID, bc.BranchID, bc.CardNo 
/*********************************
query 7
**********************************/
SELECT bc.AuthorName, ld.BranchName, bg.Number_Of_Copies, bf.Title 
FROM dbo.tbl_BOOK_COPIES bg
INNER JOIN dbo.tbl_BOOK_AUTHORS bc ON bg.BookID = bc.BookID
INNER JOIN dbo.tbl_LIBRARY_BRANCH ld ON bg.BranchID = ld.BranchID
INNER JOIN dbo.tbl_BOOKS bf ON bf.BookID = bc.BookID
WHERE bc.AuthorName = 'Stephen King'
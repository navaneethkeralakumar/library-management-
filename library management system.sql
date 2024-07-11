Create database Library;
use Library;
CREATE TABLE Branch (
    Branch_no int PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(100),
    Contact_no int
);
INSERT INTO branch VALUES(1, 101, '123 Main St', '123456789'),
 (2, 102, '456 Elm St', '987654321');
 
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(50),
    Position VARCHAR(50),
    Salary int,
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);
INSERT INTO Employee VALUES (101, 'John Doe', 'Manager', 60000, 1),
       (102, 'Jane Smith', 'Librarian', 45000, 1),
       (103, 'Michael Johnson', 'Assistant', 35000, 2),
       (104, 'Emily Davis', 'Assistant', 38000, 2);
       INSERT INTO Employee VALUES  (105, 'Michael clark', 'supervisor', 3500, 2),
       (106, 'Emily Davis', 'Assistant', 38000, 2),
       (107, 'shawn marsh', 'librarian', 3500, 2);
       INSERT INTO Employee VALUES  (108, 'steve smith', 'supervisor', 350000, 2);
      
CREATE TABLE Books (
    ISBN bigint primary key,
    Book_title VARCHAR(100),
    Category VARCHAR(50),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(50),
    Publisher VARCHAR(50)
);
INSERT INTO Books VALUES ('9780141439556', 'Pride and Prejudice', 'Classic Fiction', 10.99, 'yes', 'Jane Austen', 'Penguin Books'),
       ('9780061122415', 'To Kill a Mockingbird', 'Classic Fiction', 12.50, 'yes', 'Harper Lee', 'Harper Perennial Modern Classics'),
       ('9780545010221', 'Harry Potter and the Sorcerer''s Stone', 'Fantasy', 15.75, 'yes', 'J.K. Rowling', 'Scholastic'),
       ('9781982117894', 'Educated: A Memoir', 'Biography', 18.25, 'yes', 'Tara Westover', 'Random House'),
       ('9780399590504', 'Where the Crawdads Sing', 'Mystery', 20.00, 'yes', 'Delia Owens', 'G.P. Putnam''s Sons');
       insert into books values('9780141436794', 'world war II', 'history', 10.97, 'yes', 'Jerin john', 'dc Books');
       insert into books values('9780141436710', 'world war I', 'history', 27.8, 'yes', 'Jerin john', 'dc Books');
       insert into books values('9780141436700', 'shoe dog', 'business', 29.8, 'yes', 'phil knight', 'nike');
CREATE TABLE Customer (
    Customer_Id Int primary key,
    Customer_name VARCHAR(50),
    Customer_address VARCHAR(100),
    Reg_date DATE
);
INSERT INTO Customer VALUES (201, 'Alice Johnson', '789 Oak St', '2020-05-15'),
       (202, 'Bob Smith', '456 Pine St', '2021-02-20'),
       (203, 'Charlie Brown', '321 Cedar St', '2022-03-10');
       insert into customer values(205,'grame smith','456 nyc','2000-12-19');
       
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(100),
    Issue_date DATE,
    Isbn_book bigint,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

INSERT INTO IssueStatus VALUES (301, 201, 'Pride and Prejudice', '2023-04-01', '9780141439556'),
       (302, 202, 'To Kill a Mockingbird', '2023-05-12', '9780061122415'),
       (303, 203, 'Harry Potter and the Sorcerer''s Stone', '2023-06-20', '9780545010221'),
       (304, 201, 'Educated: A Memoir', '2023-05-28', '9781982117894');
       
    CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(100),
    Return_date DATE,
    Isbn_book2 bigint,
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
    
);
INSERT INTO ReturnStatus VALUES (401, 201, 'Pride and Prejudice', '2023-04-15', '9780141439556'),
       (402, 202, 'To Kill a Mockingbird', '2023-06-01', '9780061122415');
       
select Book_title,category,rental_price from books;      

select emp_name,salary from employee order by salary desc;

select books.book_title,customer.customer_name from issuestatus join books on issuestatus.isbn_book = books.isbn
join customer on issuestatus.issued_cust = customer.customer_id; 

select category,count(*) as totalbooks from books group by category;

select emp_name,position from employee where salary > 50000;

select customer_name from customer where reg_date < '2022-01-01' 
and customer_id not in (select issued_cust from issuestatus);

select branch_no,count(*) AS TOTALEMPLOYE from employee group by branch_no;

select customer.customer_name from issuestatus join customer on issuestatus.issued_cust = customer.customer_id
where issue_date between '2023-06-01' and '2023-06-30';

select book_title from books where category = 'history';

select branch_no,count(*) as no_of_employees from employee group by branch_no having count(*)>5;

select employee.emp_name,branch.branch_address from branch join employee on branch.manager_id = employee.emp_id;

select distinct customer.customer_name from issuestatus join books on issuestatus.isbn_book = books.isbn
join customer on issued_cust = customer.customer_id where books.rental_price > 25;




       
       
       
-- Create a table for authors
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

-- Create a table for books
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author_id INT,
    publish_year INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Create a table for book loans
CREATE TABLE BookLoans (
    loan_id INT PRIMARY KEY,
    book_id INT,
    loan_date DATE,
    return_date DATE,
    borrower_name VARCHAR(50),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Insert sample data into Authors table
INSERT INTO Authors (author_id, first_name, last_name)
VALUES
(1, 'George', 'Orwell'),
(2, 'Jane', 'Austen');

-- Insert sample data into Books table
INSERT INTO Books (book_id, title, author_id, publish_year)
VALUES
(1, '1984', 1, 1949),
(2, 'Pride and Prejudice', 2, 1813);

-- Insert sample data into BookLoans table
INSERT INTO BookLoans (loan_id, book_id, loan_date, return_date, borrower_name)
VALUES
(1, 1, '2024-01-15', '2024-01-25', 'John Doe'),
(2, 2, '2024-01-18', '2024-01-28', 'Jane Doe');

-- -----------------------------------------------------
-- Database Schema for Library Management System
-- -----------------------------------------------------

-- Create the LibraryManagement schema
CREATE SCHEMA IF NOT EXISTS `LibraryManagement`;
USE `LibraryManagement`;

-- -----------------------------------------------------
-- Table `authors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `authors`;
CREATE TABLE IF NOT EXISTS `authors` (
  `author_id` INT NOT NULL AUTO_INCREMENT,
  `author_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`author_id`)
);

-- -----------------------------------------------------
-- Table `genres`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `genres`;
CREATE TABLE IF NOT EXISTS `genres` (
  `genre_id` INT NOT NULL AUTO_INCREMENT,
  `genre_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`genre_id`)
);

-- -----------------------------------------------------
-- Table `books`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `book_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NOT NULL,
  `publication_year` YEAR NULL,
  `author_id` INT NULL,
  `genre_id` INT NULL,
  PRIMARY KEY (`book_id`),
  FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`),
  FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`)
);

-- -----------------------------------------------------
-- Table `users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`user_id`)
);

-- -----------------------------------------------------
-- Table `borrowed_books`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `borrowed_books`;
CREATE TABLE IF NOT EXISTS `borrowed_books` (
  `borrow_id` INT NOT NULL AUTO_INCREMENT,
  `book_id` INT NULL,
  `user_id` INT NULL,
  `borrow_date` DATE NULL,
  `return_date` DATE NULL,
  PRIMARY KEY (`borrow_id`),
  FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
);

-- -----------------------------------------------------
-- Indexes for better performance
-- -----------------------------------------------------
CREATE INDEX `idx_books_author` ON `books` (`author_id`);
CREATE INDEX `idx_books_genre` ON `books` (`genre_id`);
CREATE INDEX `idx_borrowed_books_book` ON `borrowed_books` (`book_id`);
CREATE INDEX `idx_borrowed_books_user` ON `borrowed_books` (`user_id`);

-- -----------------------------------------------------
-- Test Data Insertion
-- -----------------------------------------------------

-- Insert test data into authors
INSERT INTO `authors` (`author_name`) VALUES
('J.K. Rowling'),
('George R.R. Martin');

-- Insert test data into genres
INSERT INTO `genres` (`genre_name`) VALUES
('Fantasy'),
('Science Fiction');

-- Insert test data into books
INSERT INTO `books` (`title`, `publication_year`, `author_id`, `genre_id`) VALUES
('Harry Potter and the Philosopher''s Stone', 1997, 1, 1),
('A Game of Thrones', 1996, 2, 1);

-- Insert test data into users
INSERT INTO `users` (`username`, `email`) VALUES
('john_doe', 'john.doe@email.com'),
('jane_smith', 'jane.smith@email.com');

-- Insert test data into borrowed_books
INSERT INTO `borrowed_books` (`book_id`, `user_id`, `borrow_date`, `return_date`) VALUES
(1, 1, '2024-01-15', '2024-02-15'),
(2, 2, '2024-01-20', NULL);

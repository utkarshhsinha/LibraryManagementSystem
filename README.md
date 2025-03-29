# Library Management System

## Overview

The **Library Management System** is a web-based application that allows users to manage books efficiently. It provides features to **add, search, update, and delete books** using a structured interface built with **JSP, Servlets, and JDBC**. The system is designed to be user-friendly, scalable, and maintainable.

## Technologies Used

- **Frontend:** JSP, HTML, CSS, Bootstrap
- **Backend:** Java Servlets, JDBC
- **Database:** MySQL
- **Build Tool:** Maven
- **Server:** Apache Tomcat

## Project Structure

```
LibraryManagementSystem/
│── src/
│   ├── main/java/
│   │   ├── com/library/dao/
│   │   │   ├── BookDAO.java
│   │   ├── com/library/model/
│   │   │   ├── Book.java
│   │   ├── com/library/servlets/
│   │   │   ├── AddBookServlet.java
│   │   │   ├── DeleteBookServlet.java
│   │   │   ├── SearchBookServlet.java
│   │   │   ├── UpdateBookServlet.java
│   │   │   ├── ViewBooksServlet.java
│   ├── main/webapp/
│   │   ├── META-INF/
│   │   ├── WEB-INF/
│   │   ├── addBook.jsp
│   │   ├── search.jsp
│   │   ├── update.jsp
│   │   ├── delete.jsp
│   │   ├── books.jsp
│   │   ├── index.jsp
│── pom.xml
│── README.md
│── LibraryManagementSystem.iml
│── target/
```

## Database Schema

Table: **books**  
| Column | Data Type | Constraints |
|-------------|--------------|-------------------------|
| id | INT | PRIMARY KEY, AUTO_INCREMENT |
| title | VARCHAR(255) | NOT NULL |
| author | VARCHAR(255) | NOT NULL |
| genre | VARCHAR(100) | |
| availability | VARCHAR(50) | |

## Features

✔ **Add a Book** – Users can add new books to the system.  
✔ **Search a Book** – Search for books by **ID or title**.  
✔ **Update Book Details** – Modify book information (title, author, genre, availability).  
✔ **Delete a Book** – Remove a book from the system using **ID or title**.  
✔ **View All Books** – Displays a list of all available books.

## Installation & Setup

1. Clone the repository.
2. Import the project into **Eclipse/IntelliJ** as a Maven project.
3. Set up the database in MySQL:

   ```sql
   CREATE DATABASE library_db;
   USE library_db;

   CREATE TABLE books (
       id INT PRIMARY KEY AUTO_INCREMENT,
       title VARCHAR(255) NOT NULL,
       author VARCHAR(255) NOT NULL,
       genre VARCHAR(100),
       availability VARCHAR(50)
   );
   ```

4. Configure **DBConnection.java** with your database credentials.
5. Run the application on **Apache Tomcat**.

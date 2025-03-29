package com.library.servlets;

import com.library.dao.BookDAO;
import com.library.model.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addBook")
public class AddBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            System.out.println("[DEBUG] Received request to add a new book");

            String title = request.getParameter("title");
            String author = request.getParameter("author");
            String genre = request.getParameter("genre") != null ? request.getParameter("genre") : "Unknown";
            String availability = request.getParameter("availability") != null ? request.getParameter("availability") : "Available";

            System.out.println("[DEBUG] Extracted Parameters - Title: " + title + ", Author: " + author + ", Genre: " + genre + ", Availability: " + availability);

            if (title == null || title.trim().isEmpty() || author == null || author.trim().isEmpty()) {
                System.out.println("[ERROR] Title and Author cannot be empty!");
                request.setAttribute("errorMessage", "❌ Title and Author are required fields!");
                request.getRequestDispatcher("addBook.jsp").forward(request, response);
                return;
            }

            Book book = new Book(title, author, genre, availability);
            System.out.println("[DEBUG] Book object created: " + book);

            boolean isAdded = BookDAO.addBook(book);

            if (isAdded) {
                System.out.println("[SUCCESS] Book added successfully!");
                response.sendRedirect("books.jsp"); // Redirect to book list
            } else {
                System.out.println("[ERROR] Failed to add book to the database!");
                request.setAttribute("errorMessage", "❌ Error adding book to the database!");
                request.getRequestDispatcher("addBook.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println("[EXCEPTION] " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("errorMessage", "❌ Invalid input: " + e.getMessage());
            request.getRequestDispatcher("addBook.jsp").forward(request, response);
        }
    }
}

package com.library.servlets;

import com.library.dao.BookDAO;
import com.library.model.Book;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@WebServlet("/DeleteBook")
public class DeleteBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String query = request.getParameter("bookId"); // Can be ID or Title
        String action = request.getParameter("action");

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        if ("fetch".equals(action)) {
            // Fetch book by ID or Title
            List<Book> books = BookDAO.searchBook(query);
            if (!books.isEmpty()) {
                Book book = books.get(0); // Pick the first match
                out.println("{ \"success\": true, \"book\": { \"id\": " + book.getId() +
                            ", \"title\": \"" + book.getTitle() + "\", \"author\": \"" + book.getAuthor() +
                            "\", \"genre\": \"" + book.getGenre() + "\", \"availability\": \"" + book.getAvailability() + "\" } }");
            } else {
                out.println("{ \"success\": false, \"message\": \"Book not found.\" }");
            }
        } else if ("delete".equals(action)) {
            int bookId;
            try {
                bookId = Integer.parseInt(query); // Try converting to number
            } catch (NumberFormatException e) {
                // If it's not a number, find the first book by title and get its ID
                List<Book> books = BookDAO.searchBook(query);
                if (!books.isEmpty()) {
                    bookId = books.get(0).getId();
                } else {
                    out.println("{ \"success\": false, \"message\": \"Book not found.\" }");
                    return;
                }
            }

            boolean deleted = BookDAO.deleteBook(bookId);
            if (deleted) {
                out.println("{ \"success\": true, \"message\": \"Book deleted successfully!\" }");
            } else {
                out.println("{ \"success\": false, \"message\": \"Book deletion failed.\" }");
            }
        }
    }
}

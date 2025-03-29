package com.library.servlets;

import com.library.dao.BookDAO;
import com.library.model.Book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/updateBook")
public class UpdateBookServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String searchQuery = request.getParameter("searchQuery");
		String bookIdStr = request.getParameter("bookId");

		if (searchQuery != null) {
			// Search for books
			List<Book> books = BookDAO.searchBook(searchQuery);
			request.setAttribute("searchResults", books);
			request.getRequestDispatcher("update.jsp").forward(request, response);
		} else if (bookIdStr != null) {
			int bookId = Integer.parseInt(bookIdStr);
			String title = request.getParameter("title");
			String author = request.getParameter("author");
			String genre = request.getParameter("genre");
			String availability = request.getParameter("availability");

			// Fetch book before update
			Book bookBeforeUpdate = BookDAO.getBookById(bookId);

			// Update book
			boolean isUpdated = BookDAO.updateBook(bookId, title, author, genre, availability);

			if (isUpdated) {
				// Fetch updated book details
				Book updatedBook = BookDAO.getBookById(bookId);
				request.setAttribute("message", "✅ Book updated successfully!");
				request.setAttribute("bookUpdated", updatedBook);
			} else {
				request.setAttribute("message", "❌ Update Failed. Try Again!");
				request.setAttribute("bookBeforeUpdate", bookBeforeUpdate);
			}

			// Forward to update.jsp
			request.getRequestDispatcher("update.jsp").forward(request, response);
		}
	}
}